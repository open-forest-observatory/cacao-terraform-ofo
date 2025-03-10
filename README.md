## about:
CACAO(Cloud Automation & Continuous Analysis Orchestration) is an orchestration service for researchers and educators that eliminates the complexity of using multiple clouds. It allows user to import templates defined in various templating language(e.g. terraform, ansible, argo workflow) from any git hosting solution (e.g. Github, Gitlab). Once a template has been created, users can deploy VMs with provisioned software with a few clicks to OpenStack Cloud (e.g., Jetstream2) and commercial cloud (e.g., AWS). 

This repository holds a CACAO formatted Terraform and Ansible meant to deploy an Open Forest Observatory development VM to Jetstream2. 

This deployment will launch a user defined VM with the following software installed:

* Agisoft Metashape Desktop GUI & Python Module
* R and RStudio
* Anaconda
* Jupyter notebook
* QGIS
* Sublime
* Geograypher

More information about CACAO can be found in [in this repo](https://gitlab.com/cyverse/cacao)

Cacao homepage https://cyverse.org/cacao

When you deploy a VM through Cacao, you get a Webshell and an interactive Desktop

How should I transfer data on and off Js2 VM? SCP, Rsync? 

CACAO documentation on Jetstream2 https://docs.jetstream-cloud.org/ui/cacao/overview/

NSF ACCESS https://access-ci.org/

To use CACAO and Jetstream2, you need ACCESS credentials. https://operations.access-ci.org/identity/new-user

Who is eligible for ACCESS allocations? https://allocations.access-ci.org/allocations-policy#eligibility





## requirements:
- Ubuntu
- A boot volume with at least 30G 
