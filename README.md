🔹 Project Overview
AFM (App Feature / Microservice) is a production-style DevSecOps project designed to simulate how modern enterprises build, secure, deploy, monitor, and operate microservices on cloud-native infrastructure.

The project represents a banking-domain application consisting of multiple independently deployable microservices (AFMs), deployed on Amazon EKS, provisioned using Terraform, and delivered through GitLab CI/CD pipelines with integrated security and observability.

Unlike tutorial-driven demos, AFM focuses on:
End-to-end lifecycle ownership
Infrastructure + Application + Operations
Real failure scenarios and recovery
Production-aligned DevOps decision-making

🔹 Problem Statement
Most DevOps portfolios demonstrate isolated concepts such as:
Docker image builds
Simple CI pipelines
Basic Kubernetes deployments

However, real-world DevOps roles require engineers to:
Design scalable infrastructure
Build secure CI/CD pipelines
Manage Kubernetes networking & ingress
Integrate DevSecOps practices
Implement observability
Handle upgrades, failures, and zero-downtime changes
The AFM project was created to bridge this gap by building a realistic, production-like system instead of a tool-specific demo.

🔹 Solution Approach
The AFM project is structured around separation of concerns, following enterprise DevOps patterns:
Infrastructure Layer:
AWS infrastructure provisioned using Terraform
EKS cluster, networking, IAM, RDS, ECR, and ALB integration

Application Layer:
Multiple banking-domain microservices (Registration, Login, Auth, Frontend)
Containerized workloads deployed on Kubernetes
Configuration managed using ConfigMaps and Secrets

CI/CD Layer
GitLab CI/CD pipelines for:
Infrastructure provisioning
Application build & deployment
Security scanning
Observability setup
Parameterized pipelines with manual control gates

DevSecOps & Observability:
Security scans integrated into CI/CD
Metrics, logs, and dashboards for runtime visibility
Failure simulations to validate resilience
Each component was designed, implemented, tested, broken, and fixed, mirroring real production environments.

🔹 Why Banking Domain?
The banking domain was intentionally chosen because it naturally enforces:
Security-first design
High availability expectations
Strict deployment discipline
Clear separation of services

This makes the project highly relevant for:
Enterprise DevOps roles
Regulated industries
Interview discussions around reliability, security, and scale

🔹 Key Outcomes
Through this project, the following capabilities were demonstrated:
End-to-end DevSecOps pipeline ownership
Kubernetes production concepts (Ingress, probes, rollouts)
Secure handling of infrastructure and application changes
Monitoring-driven troubleshooting
Upgrade and failure-handling strategies
Portfolio-ready, interview-verifiable experience

🔹 Important Note on Tooling
The actual source code repositories and CI/CD pipelines are maintained in GitLab, reflecting real enterprise workflows.
This GitHub repository serves as a public portfolio and documentation hub, showcasing architecture, decisions, pipelines, and operational learnings.
