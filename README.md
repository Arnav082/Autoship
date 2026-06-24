# Enterprise DevOps Platform

## Overview

This project demonstrates an end-to-end CI/CD pipeline using AWS, Terraform, Ansible, Jenkins, GitHub Actions, and Flask.

The goal of the project is to automate infrastructure provisioning, server configuration, application deployment, and continuous delivery.

---

## Architecture

```text
Developer
    │
    ▼
GitHub Repository
    │
    ▼
GitHub Webhook
    │
    ▼
Jenkins Pipeline
    │
    ▼
Ansible Server
    │
    ▼
Application Server
    │
    ▼
Flask Application
```

---

## Technologies Used

* Git
* GitHub
* GitHub Actions
* Jenkins
* Ansible
* Terraform
* AWS EC2
* Linux (Ubuntu)
* Python
* Flask
* Gunicorn
* Systemd
* Nginx

---

## Infrastructure

The infrastructure was provisioned using Terraform.

Resources:

* Jenkins EC2 Instance
* Ansible EC2 Instance
* Application EC2 Instance
* Security Groups
* Key Pair Integration

AWS Region:

* us-east-1

---

## Configuration Management

Ansible was used to automate server configuration.

Implemented Roles:

* jenkins
* git
* python
* nginx
* app_deploy

Automated Tasks:

* Install Jenkins
* Install Git
* Install Python & Pip
* Install Nginx
* Deploy Flask Application
* Configure Systemd Services

---

## Continuous Integration

GitHub Actions performs:

* Dependency Installation
* Application Testing using Pytest
* Security Scanning using Bandit

---

## Continuous Delivery

Jenkins Pipeline performs:

1. Triggered automatically by GitHub Webhook
2. Connects to Ansible Server
3. Executes deployment playbook
4. Deploys latest application version
5. Restarts required services

---

## Application Deployment

The application deployment process includes:

* Clone latest source code
* Create Python Virtual Environment
* Install Dependencies
* Configure Gunicorn
* Configure Systemd Service
* Start Flask Application

---

## Project Workflow

```text
Git Push
   │
   ▼
GitHub Webhook
   │
   ▼
Jenkins Pipeline
   │
   ▼
Ansible Playbook
   │
   ▼
Application Server
   │
   ▼
Flask Application Updated
```

---

## Key Features

* Infrastructure as Code using Terraform
* Configuration Management using Ansible
* Automated CI using GitHub Actions
* Automated CD using Jenkins
* Webhook-Based Deployment
* Service Management with Systemd
* Automated Application Deployment

---

## Learning Outcomes

Through this project I gained hands-on experience with:

* AWS Infrastructure Provisioning
* Terraform Automation
* Ansible Roles and Playbooks
* Jenkins Pipelines
* GitHub Webhooks
* Linux Administration
* CI/CD Implementation
* Application Deployment Automation
* Troubleshooting Real-World DevOps Issues

---

## Future Improvements

* Docker Containerization
* Kubernetes Deployment
* ArgoCD GitOps Workflow
* Custom VPC and Networking
* Monitoring with Prometheus & Grafana
* Load Balancer Integration
* Multi-Environment Deployments

```
```
