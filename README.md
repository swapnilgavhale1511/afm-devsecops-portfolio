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
------------------------------------------------------------------------------------------------------------------------------------------------------------

🔹 Section 2: High-Level Architecture
The AFM project follows a layered, production-oriented architecture, separating infrastructure, application delivery, security, and observability concerns. This mirrors how real enterprise DevOps platforms are designed and operated.

🔹 Architectural Layers Overview
1️⃣ Infrastructure Layer (AWS + Terraform)

The foundation of the AFM project is built using Infrastructure as Code (IaC) with Terraform.

Core components:
AWS VPC – Isolated networking for workloads
Amazon EKS – Managed Kubernetes control plane
EKS Worker Nodes – EC2-based compute for workloads
Amazon RDS – Centralized relational database
Amazon ECR – Container image registry
IAM – Least-privilege access for services and pipelines
ALB (via AWS Load Balancer Controller) – External traffic entry point

All infrastructure resources are:
Version-controlled
Reproducible
Environment-aware

Provisioned via a dedicated AFM Infra pipeline

2️⃣ Application Layer (Microservices on Kubernetes)

AFM is composed of multiple banking-domain microservices, each treated as an independent deployable unit (AFM):

Frontend UI

Registration Service

Login Service

Auth API

Kubernetes concepts used:

Deployments & ReplicaSets

Services (ClusterIP)

Ingress (ALB-based)

ConfigMaps & Secrets

Liveness & Readiness Probes

Rolling update strategy

This design enables:

Independent scaling

Controlled rollouts

Fault isolation

Zero-downtime updates

3️⃣ Traffic Flow Architecture

End-user traffic flow:

User Browser
   ↓
AWS Application Load Balancer (ALB)
   ↓
Kubernetes Ingress (AWS Load Balancer Controller)
   ↓
Service (ClusterIP)
   ↓
AFM Pods (Microservices)
   ↓
Amazon RDS


Key points:

ALB handles SSL termination and routing

Kubernetes Ingress rules control service-level routing

Services abstract pod-level changes

Database access is restricted via security groups

🔹 CI/CD Architecture (GitLab-Centric)

CI/CD is treated as a first-class architectural component, not an afterthought.

Pipelines are logically separated into:
🔹 AFM Infra Pipeline

Terraform init / plan / apply

EKS provisioning

IAM, networking, ALB controller setup

State stored remotely with locking

🔹 AFM Application Pipeline

Source checkout

Build & package

Docker image build & push to ECR

Kubernetes deployment updates

Controlled deploy toggles (build-only / deploy-only)

🔹 AFM Observability Pipeline

Prometheus installation & configuration

ServiceMonitor setup

Grafana dashboards

CloudWatch agent integration

Verification stages

All pipelines are:

Parameterized

Manually controllable

Auditable

Environment-safe

🔹 DevSecOps Architecture Integration

Security is embedded directly into the delivery flow:

SAST – Code-level analysis

Image Scanning – Container vulnerability checks

DAST – Runtime application scanning

Security Gates – Fail pipelines on critical findings

Security tools are integrated within GitLab CI, ensuring:

Early detection

Shift-left security

No manual security steps

🔹 Observability Architecture

AFM implements multi-layer observability, similar to production systems:

CloudWatch

Node-level metrics

Infrastructure health

Prometheus

Application and Kubernetes metrics

Custom ServiceMonitors

Grafana

Visualization and dashboards

Real-time system insights

This enables:

Faster troubleshooting

Proactive monitoring

Interview-grade operational discussions

🔹 Architectural Design Principles Followed

Separation of concerns

Immutable infrastructure

Declarative configuration

Least privilege security

Automation-first approach

Production realism over simplicity

🔹 Why This Architecture Matters (Interview Angle)

This architecture demonstrates:

How DevOps operates beyond CI/CD

How Kubernetes fits into enterprise platforms

How security and monitoring are not optional

How real systems are designed for change, failure, and growth
