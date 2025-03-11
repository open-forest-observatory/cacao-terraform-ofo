## about:
[CACAO(Cloud Automation & Continuous Analysis Orchestration)](https://cyverse.org/cacao) is an orchestration service for researchers and educators that eliminates the complexity of using multiple clouds. It allows user to import templates defined in various templating language(e.g. terraform, ansible, argo workflow) from any git hosting solution (e.g. Github, Gitlab). Once a template has been created, users can deploy VMs with provisioned software with a few clicks to OpenStack Cloud (e.g., Jetstream2) and commercial cloud (e.g., AWS). 

This repository holds CACAO formatted Terraform and Ansible template meant to deploy an Open Forest Observatory development VM to [Jetstream2](https://jetstream-cloud.org/)

This deployment will launch a user defined VM with the following software installed:

* Agisoft Metashape Desktop GUI & Python Module
* R and RStudio
* Anaconda
* Jupyter notebook
* QGIS
* Sublime
* Geograypher

<br/>

## Jetstream2 & NSF ACCESS

CACAO was built as an interface for [Jetstream2](https://jetstream-cloud.org/), which is a research cloud computing system hosted at Indiana University. Js2 is meant for large computation research including AI training and inference. It is also ideal for aerial imagery photogrammetry which needs large resources (CPUs, GPUs, RAM) to process large datasets. 

The ability to use Js2 is managed through the National Science Foundation's [ACCESS](https://access-ci.org/) program. Use of ACCESS computing resources is primarily intended to be used for non-commercial research activitiy, but many types of potential users (including non-profit and commercial) may be able to get an allocation. Please check the resources [here](https://allocations.access-ci.org/allocations-policy#eligibility) for eligibility to use ACCESS computing resources. To start the process of getting a user account go [here](https://operations.access-ci.org/identity/new-user)

More information about CACAO can be found in [in this repo](https://gitlab.com/cyverse/cacao)

<br/>

## Using CACAO to Deploy Provisioned VMs

[Login to CACAO](https://cacao.jetstream-cloud.org/) on Jetstream2. You will need your ACCESS credentials to login. 

Please read the [CACAO documentation on Jetstream2](https://docs.jetstream-cloud.org/ui/cacao/overview/). It will guide you through the CACAO user interface, how to set up ssh keys, and how to launch templated instances. 

<br/>

## Transfer Data between local machine and VM

### Transfer data from local to VM

* After a VM has been launched in CACAO, note the public ip address of the instance.

* From your local machine, go to a terminal use the `scp` tool to transfer data onto the VM. You will need to have your computer [public ssh keys uploaded to CACAO](https://docs.jetstream-cloud.org/ui/cacao/credentials/) before hand. 

`scp -r /my/local/directory access-ci_username@remote_host_publicIP:/remote/directory/`

### Transfer data VM back to local

`scp -r access-ci_username@remote_host_publicIP:/remote/directory /my/local/directory`



<br/>

## Editing this Repository

Edit the software stack https://github.com/open-forest-observatory/cacao-terraform-ofo/tree/main/ansible/roles/ofo/tasks

The `main.yaml` controls all the software, and there is a yaml for each individual software. 

<br/>

## requirements:
- Ubuntu
- A boot volume with at least 30G 
