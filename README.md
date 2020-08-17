To provision resources when deploying Server on GCP. For use in conjuction with the scripts in the [circleci/server-static-install](https://github.com/circleci/server-static-install) repo.


# Prerequisites
Have the following available before beginning the installation procedure:

- A CircleCI License file (.rli). Contact CircleCI support if you need a license.

- A machine to run Ubuntu 14.04 or 16.04 with a minimum of at least 100 GB storage, 32 GB RAM, and 4 CPUs (8 CPUs preferred) for the Services VM.

- A cluster of machines running Ubuntu 14.04 or 16.04 with a minumum of 8 GB RAM and 4 CPUs each, as well as network access to any Docker registries that are required by your builds for the Nomad Client VMs.


# Installing the Services Machine
- Copy [provision-services-ubuntu.sh](https://raw.githubusercontent.com/circleci/server-static-install/master/provision-services-ubuntu.sh) to the Services VM machine.

- SSH into the machine provisioned for the Services VM and run the sudo su command.

- Run `./provision-services-ubuntu.sh` to start the script.

- Go to the public IP of the host on port 8800 using HTTPS.

- Enter your license.

- Set the VM Provider to None.

- Set 1.0 Builds to Off.

- Set 2.0 Builds to Clustered.

# Installing the Nomad Clients
- Copy [provision-nomad-client-ubuntu.sh](https://raw.githubusercontent.com/circleci/server-static-install/master/provision-nomad-client-ubuntu.sh) to the Nomad Server machine.

- Log in to the machine provisioned for the Nomad Server and run the sudo su command.

- Run `./provision-nomad-client-ubuntu.sh` with the NOMAD_SERVER_ADDRESS environment variable set to the routable IP of the Services machine. For example:

```
NOMAD_SERVER_ADDRESS=0.0.0.0 ./provision-nomad-client-ubuntu.sh
```