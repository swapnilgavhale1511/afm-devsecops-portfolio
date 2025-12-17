
## 1️⃣ Problem Statement & Motivation
Most DevOps learning projects available publicly focus on **tool demonstrations**, not **system thinking**.  
They usually stop at:
- Running containers
- Simple CI pipelines
- One-click Kubernetes deployments

However, real DevOps roles require engineers to:
- Make **design decisions**
- Handle **constraints**
- Face **failures**
- Balance **cost, security, and scalability**
- Operate systems with **limited resources**

### Motivation Behind AFM
The **AFM (App Feature / Microservice) Project** was created to:
- Simulate **real enterprise DevOps challenges**
- Build a system **incrementally**, not perfectly
- Start small → evolve → migrate → optimize
- Document **why decisions were taken**, not just _what was done_

This project intentionally embraces **constraints**:
- Limited budget
- No domain/DNS
- Single-node Kubernetes cluster
- Manual + automated workflows
- Real failures and recovery

---

## 2️⃣ Why Microservices Architecture?
### Why Microservices (Instead of Monolith)?
Microservices were chosen to demonstrate:
- Independent build & deploy
- Service isolation
- Kubernetes-native workflows
- Real CI/CD complexity
This mirrors how **banking and enterprise systems** are actually built.

---

## 3️⃣ Why Only 4 AFMs (Microservices)?
The project intentionally limits itself to **four AFMs** to maintain **clarity and depth**:
### Selected AFMs:
1. **Auth Service**
2. **Registration Service**
3. **Login Service**
4. **Frontend UI (separate microservice)**    

### Why This Split?
- **Auth, Login, Registration**  
    → Represent typical identity workflows in banking systems
- **Frontend UI as a separate microservice**  
    → Enables:
    - Independent UI deployment
    - Backend changes without UI rebuild
    - Real ingress & routing scenarios

This is **not over-engineering**, but **controlled realism**.

---

## 4️⃣ Why Spring Boot (Java) & HTML/CSS Frontend?
### Backend – Spring Boot (Java)
Chosen because:
- Widely used in banking & enterprise systems
- Strong ecosystem
- Easy observability integration
- Realistic for interviews

### Frontend – HTML/CSS (Simple)
Chosen intentionally:
- Focus stays on **DevOps**, not frontend frameworks
- Faster iteration
- Easy containerization
- Clear ingress routing demonstration

---

## 5️⃣ Technology Stack – Why Each Tool Was Chosen
### ☁️ AWS – Why AWS?
AWS was selected because it reflects **real enterprise adoption**.
**Services used and why:**
- **EC2** – GitLab shell runner & initial hosting
- **S3** – Terraform remote state
- **DynamoDB** – Terraform state locking
- **ECR** – Secure container registry
- **IAM** – Fine-grained access control
- **CloudWatch** – Infrastructure-level monitoring
- **RDS** – Persistent production-style database

---

### ☸️ Amazon EKS – Why Single Node (t3.medium)?
- Budget-constrained, realistic learning setup
- Forces **capacity planning**
- Exposes pod scheduling issues
- Enables real troubleshooting
> Single-node EKS is **harder**, not easier — and that was intentional.

---

## 6️⃣ GitLab for SCM & CI/CD – Why?
### Why GitLab Instead of GitHub Actions / Jenkins?
- Unified SCM + CI/CD
- Enterprise-grade pipelines
- Strong support for:
    - Manual gates
    - Parameterized pipelines        
    - Multi-stage DevSecOps workflows

---

### Why EC2 t3.medium as GitLab Shell Runner?
- Needed Docker-in-Docker control
- Needed full system access
- Same host used initially for app hosting
- Reduced cost & complexity

### Challenges Faced (Will be shown later):
- Disk cleanup
- Docker daemon conflicts
- Permission issues
- Long-running pipelines

(All documented in later sections)

---

## 7️⃣ Monorepo Strategy – Why One Repo?
All AFM microservices were initially kept in a **single monorepo**.
### Why Monorepo?
- Easier dependency management
- Shared pipeline logic
- Centralized control    
- Faster iteration

### Challenge:
> How to build & deploy **only one service** without rebuilding all?

### Solution:
- **Hybrid GitLab pipeline**
- Manual inputs:
    - build = true/false
    - deploy = true/false
    - service selection
- Real enterprise-style pipeline control

---

## 8️⃣ Terraform – Infrastructure as Code
### Why Terraform?
- Cloud-agnostic IaC
- Declarative
- Enterprise standard

### Key Practices Used:
- Modular design
- Environment-aware structure
- Remote state:
    - **S3 backend**
    - **DynamoDB lock**
- No local `terraform apply`
- Infra changes only via pipeline

---

## 9️⃣ Docker – Why Still Required:
Even with Kubernetes:
- Docker is the **packaging standard**
- Enables:
    - Local testing
    - Docker Compose workflows
    - Consistent builds across environments

---

## 🔟 Kubernetes – Why Not Just Docker Compose:
### Why Kubernetes?
Docker Compose was initially sufficient, **until**:
- Scaling was needed
- Rolling updates were needed
- Health checks mattered
- Ingress routing became complex
- Future upgrade strategies were discussed

Kubernetes enabled:
- Declarative deployments
- Self-healing
- Traffic abstraction
- Production-style operations

---

## 1️⃣1️⃣ HTTPS Journey – Docker Compose → EKS
### Phase 1: Docker Compose
- NGINX
- Self-signed certificate
- HTTPS enabled locally
- Good for early-stage validation

### Phase 2: EKS + ALB Controller
- Switched to AWS Load Balancer Controller
- Self-signed cert **not supported**
- AWS ACM not used (no DNS)
- Operated over HTTP

This shows **real constraint-based decision making**.

---

## 1️⃣2️⃣ Database Evolution – user.json → RDS
### Initial State:
- Local `/data/user.json`
- Simple & fast

### Why Changed?
- Not persistent
- Not scalable
- Not production-like

### Final State:
- Amazon RDS
- Secure access via SG
- Used by all AFMs
- Real database connectivity challenges handled

---

## 1️⃣3️⃣ DevSecOps – Shift Left Security
### Why Security Early?
Security added **inside pipelines**, not post-deployment.
### Tools Chosen:
- **SAST** – SonarQube
- **SCA / Image Scan** – Trivy
- **DAST** – OWASP ZAP

### Integration:
- Multi-stage GitLab pipelines
- Fail-on-critical issues
- Manual gates where needed
---

## 1️⃣4️⃣ Observability – Why PT, GA & CloudWatch?
### CloudWatch
- Node & infra metrics
- AWS-native visibility

### Prometheus (PT)
- Kubernetes & app metrics
- Service-level monitoring

### Grafana (GA)
- Visualization
- Debugging
- Interview-grade dashboards

### Real Challenge Faced:
- Single node capacity exceeded
- 17 pods couldn’t schedule
- Solution:
    - Reduced AFM replicas
    - Kept observability components minimal

---

## 1️⃣5️⃣ Why Separate Repos & Pipelines?
### 1. **afm-project**
- Application CI/CD
- Build, scan, deploy

### 2. **afm-infra**
- Terraform modules
- Environment-wise provisioning
- IAM, EKS, ALB

### 3. **afm-observability**
- Monitoring stack
- Metrics, dashboards
- Verification pipelines
This separation reflects **real platform teams**.

---

## 1️⃣6️⃣ Journey Summary (Very Important)

- Started with EC2 + Docker Compose
- Added NGINX + HTTPS
- Migrated to Kubernetes (EKS)
- Faced IAM & EKS issues
- Integrated DevSecOps
- Hit capacity limits
- Optimized pod strategy
- Built observability
- Documented everything

# 📸 Architecture Diagrams & Screenshots
This section provides **visual evidence** of the AFM project’s architecture, pipelines, deployments, security scans, and observability setup.

> ⚠️ Screenshots are intentionally organized **by pipeline and phase**, not randomly.  
> This mirrors how DevOps platforms are reviewed in real teams.

---

## 📐 Architecture Diagrams
### 1️⃣ High-Level System Architecture
**Description:**
- User → ALB → EKS → AFM Microservices → RDS
- Clear separation of Infra, App, Security, Observability

`![AFM High-Level Architecture](diagrams/afm-high-level-architecture.png)`

📌 _Diagram will include_:
- AWS VPC
- EKS single-node cluster
- ALB Controller
- AFM microservices
- RDS
- Monitoring stack

---

### 2️⃣ CI/CD Architecture (GitLab-Centric)
**Description:**
- Separate pipelines for:
    - afm-project
    - afm-infra
    - afm-observability
- Security and monitoring integrated

`![AFM CI/CD Architecture](diagrams/afm-cicd-architecture.png)`

---

## 🧱 Infrastructure Pipeline Screenshots (afm-infra)
### 3️⃣ Terraform Plan Stage
`![Terraform Plan](screenshots/afm-infra/terraform-plan.png)`
**Shows:**
- Environment-based execution
- Planned infra changes
- No direct apply without review

---

### 4️⃣ Terraform Apply (EKS Provisioning)
`![Terraform Apply](screenshots/afm-infra/terraform-apply.png)`
**Highlights:**
- EKS cluster creation
- IAM roles
- ALB controller readiness

---

### 5️⃣ EKS Cluster Validation
`![EKS Nodes](screenshots/afm-infra/eks-nodes.png)`
**Shows:**
- Single node (t3.medium)
- Node ready state
- Capacity awareness

---

## 🚀 Application Pipeline Screenshots (afm-project)
### 6️⃣ Hybrid GitLab Pipeline Inputs
`![Hybrid Pipeline Inputs](screenshots/afm-project/hybrid-pipeline-inputs.png)`
**Shows:**
- Build toggle
- Deploy toggle
- Single-service selection
- Monorepo challenge solution

---

### 7️⃣ Docker Build & Push to ECR
`![Docker Build Push](screenshots/afm-project/docker-build-push.png)`

---

### 8️⃣ Kubernetes Deployment Rollout
`![K8s Deployment](screenshots/afm-project/k8s-deployment.png)`

**Shows:**
- Rolling updates
- Zero downtime behavior
- Pod recreation

---

### 9️⃣ ALB Ingress Routing
`![ALB Ingress](screenshots/afm-project/alb-ingress.png)`
**Highlights:**
- Path-based routing
- Service-level exposure
- HTTP traffic via ALB

---

## 🔐 DevSecOps Screenshots
### 🔟 SonarQube – SAST Scan
`![SonarQube Scan](screenshots/security/sonarqube-scan.png)`
---

### 1️⃣1️⃣ Trivy – Image Vulnerability Scan

`![Trivy Scan](screenshots/security/trivy-scan.png)`

---

### 1️⃣2️⃣ OWASP ZAP – DAST Scan
`![OWASP ZAP Scan](screenshots/security/zap-scan.png)`

**Shows:**

- Runtime security testing
- Pipeline-integrated DAST
- Shift-left security implementation

---

## 📊 Observability Screenshots (afm-observability)
### 1️⃣3️⃣ Prometheus Targets & ServiceMonitors

`![Prometheus Targets](screenshots/observability/prometheus-targets.png)`

---

### 1️⃣4️⃣ Grafana Dashboards

`![Grafana Dashboard](screenshots/observability/grafana-dashboard.png)`

---

### 1️⃣5️⃣ CloudWatch Metrics

`![CloudWatch Metrics](screenshots/observability/cloudwatch-metrics.png)`

---

## ⚠️ Real Issues & Constraints (Visual Proof)

### 1️⃣6️⃣ Pod Scheduling Failure (Capacity Exceeded)

`![Pod Scheduling Issue](screenshots/issues/pod-scheduling-failure.png)`

**Explanation:**
- Single-node cluster
- 17 pods
- Insufficient CPU/memory
- Real production-style limitation

---

### 1️⃣7️⃣ Resolution – Replica Optimization

`![Replica Fix](screenshots/issues/replica-optimization.png)`

**Shows:**
- Reduced replicas
- Successful scheduling
- Stability restored
