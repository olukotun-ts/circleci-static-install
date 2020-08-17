provider "google" {
  project = "cci-eval"
  region  = "${var.region}"
  zone    = "${var.zone}"
}

resource "google_compute_network" "circleci_network" {
  name = "circleci-network"
}

resource "google_compute_firewall" "ingress_rules" {
  name  = "circleci-ingress"
  network = "${google_compute_network.circleci_network.self_link}"
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports = ["22", "80", "443", "3001", "4647", "7171", "8080", "8081", "8585", "8800", "64535-65535"]
  }

  allow {
    protocol = "udp"
    ports = ["8125"]
  }
}

resource "google_compute_firewall" "egress_rules" {
  name = "circleci-egress"
  network = "${google_compute_network.circleci_network.self_link}"
  direction = "EGRESS"

  allow {
    protocol = "tcp"
    ports = ["22", "80", "443", "3001", "4647", "7171", "8080", "8081", "8585", "8800"]
  }

  allow {
    protocol = "udp"
    ports = ["53"]
  }
}


resource "google_compute_instance" "service_agent" {
  name = "circleci-service"
  machine_type = "${var.machine_type}"
  allow_stopping_for_update = "true"
  metadata = {
    ssh-keys = "${var.ssh_keys}"
  }

  boot_disk {
    initialize_params {
      image = "${var.os_image}"
      size  = "${var.disk_size}"
    }
  }

  network_interface {
    network = "${google_compute_network.circleci_network.self_link}"
    access_config {
    }
  }
}

output "service-ip" {
  value = "${google_compute_instance.service_agent.network_interface.0.access_config.0.nat_ip}"
}

/*
resource "google_compute_instance" "build_agent" {
  name = "circleci-build"
  machine_type  = "${var.machine_type}"
  allow_stopping_for_update = "true"
  metadata = {
    ssh-keys = "${var.ssh_keys}"
  }

  boot_disk {
    initialize_params {
      image = "${var.os_image}"
      size = "${var.disk_size}"
    }
  }

  network_interface {
    network = "${google_compute_network.circleci_network.self_link}"
    access_config {
    }
  }
}

output "build-ip" {
  value = "${google_compute_instance.build_agent.network_interface.0.access_config.0.nat_ip}"
}
*/