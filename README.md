## Deploying Open Forest Observatory VMs with CACAO:
[CACAO(Cloud Automation & Continuous Analysis Orchestration)](https://cyverse.org/cacao) is an orchestration service for researchers and educators that eliminates the complexity of using multiple clouds. It allows user to import templates defined in various templating language(e.g. terraform, ansible, argo workflow) from any git hosting solution (e.g. Github, Gitlab). Once a template has been created, users can deploy VMs with provisioned software with a few clicks to OpenStack Cloud (e.g., Jetstream2) and commercial cloud (e.g., AWS). 

This repository holds CACAO formatted Terraform and Ansible template meant to deploy an Open Forest Observatory development VM to [Jetstream2](https://jetstream-cloud.org/). 

## Provisioned Software
The following software will be installed when you launch an Open Forest Observatory VM. 

* Agisoft Metashape Desktop GUI v2.1.2
* Agisoft Metashape Python Module v2.1.2
  * The python library is installed in a conda environment called `meta`. To activate the conda environment type in the CLI `conda activate meta`
  * Instructions for running the Metashape python script can be found [here](https://github.com/open-forest-observatory/automate-metashape)
* R (v 4.x), Rstudio Desktop, and RStudio Server (v 2023.12.1)
  * Users can access Rstudio from their local web browser at `http://<public_ip_address>:8787`
  * `useradd rstudio`
  * `passwd rstudio`
* Anaconda3 (2023.09-0)
* Jupyter notebook
* QGIS (latest stable)
* Sublime
* If launching a GPU VM, GPU drivers and cuda will be installed and ready for use


<br/>

## Jetstream2 & NSF ACCESS

CACAO was built as an interface for [Jetstream2](https://jetstream-cloud.org/), which is a research cloud computing system hosted at Indiana University. Js2 is meant for large computation research including AI training and inference. It is also ideal for aerial imagery photogrammetry which needs large resources (CPUs, GPUs, RAM) to process large datasets. 

The ability to use Js2 is managed through the National Science Foundation's [ACCESS](https://access-ci.org/) program. Use of ACCESS computing resources is primarily intended to be used for non-commercial research activitiy, but many types of potential users (including non-profit and commercial) may be able to get an allocation. Please check the resources [here](https://allocations.access-ci.org/allocations-policy#eligibility) for eligibility to use ACCESS computing resources. To start the process of getting a user account go [here](https://operations.access-ci.org/identity/new-user)

<br/>

## Deployment Instructions

* [Login to CACAO](https://cacao.jetstream-cloud.org/) on Jetstream2. You will need your ACCESS credentials to login. 

* [Add public ssh keys to CACAO](https://docs.jetstream-cloud.org/ui/cacao/credentials/)

* Go to the _Templates_ tab and select the _Open Forest Observatory_ template

* Click _Deploy_
* Select your cloud and allocation project
* For the boot image select Featured-Ubuntu22 or Featured-Ubuntu24
* Give your instance a name and select the flavor of VM
* Type in the Metashape license server IP address


More information can be found on the [CACAO documentation on Jetstream2](https://docs.jetstream-cloud.org/ui/cacao/overview/). 


<br/>

## Transfer Data
### Transfer data from local machine to VM
Once a VM has been launched, transfer your aerial imagery data to the VM for processing. Your ssh keys need to be setup already. 

* Note the public ip address of the VM instance

* We recommend using the CLI tool `scp` to transfer data between your local machine and the VM

* On your local machine, go to a terminal and use the `scp` tool to transfer data onto the VM 

`scp -r </my/local/directory> <access-ci_username>@remote_host_publicIP:</remote/directory/>`

### Transfer data from VM back to local machine

`scp -r <access-ci_usernam>e@remote_host_publicIP:</remote/directory> </my/local/directory>`



<br/>

## Editing this Repository

Edit the software stack https://github.com/open-forest-observatory/cacao-terraform-ofo/tree/main/ansible/roles/ofo/tasks

The `main.yaml` controls all the software, and there is a yaml for each individual software. 

<br/>

## requirements:
- Ubuntu
- A boot volume with at least 30G 
