#!/bin/bash

set -e

PROJECT_ROOT="afm-devsecops-portfolio"

echo "Creating AFM DevSecOps Portfolio structure..."

# Root directory
mkdir -p "$PROJECT_ROOT"

# README
touch "$PROJECT_ROOT/README.md"

# Diagrams
mkdir -p "$PROJECT_ROOT/diagrams"
touch \
  "$PROJECT_ROOT/diagrams/afm-high-level-architecture.png" \
  "$PROJECT_ROOT/diagrams/afm-cicd-architecture.png" \
  "$PROJECT_ROOT/diagrams/afm-architecture-evolution.png"

# Screenshots base
mkdir -p "$PROJECT_ROOT/screenshots"

# afm-project screenshots
mkdir -p "$PROJECT_ROOT/screenshots/afm-project"
touch \
  "$PROJECT_ROOT/screenshots/afm-project/pipeline-inputs.png" \
  "$PROJECT_ROOT/screenshots/afm-project/build-stage.png" \
  "$PROJECT_ROOT/screenshots/afm-project/docker-build.png" \
  "$PROJECT_ROOT/screenshots/afm-project/ecr-push.png" \
  "$PROJECT_ROOT/screenshots/afm-project/k8s-deploy.png" \
  "$PROJECT_ROOT/screenshots/afm-project/alb-ingress.png" \
  "$PROJECT_ROOT/screenshots/afm-project/pods-running.png"

# afm-infra screenshots
mkdir -p "$PROJECT_ROOT/screenshots/afm-infra"
touch \
  "$PROJECT_ROOT/screenshots/afm-infra/terraform-init.png" \
  "$PROJECT_ROOT/screenshots/afm-infra/terraform-plan.png" \
  "$PROJECT_ROOT/screenshots/afm-infra/terraform-apply.png" \
  "$PROJECT_ROOT/screenshots/afm-infra/eks-nodes.png" \
  "$PROJECT_ROOT/screenshots/afm-infra/alb-controller.png" \
  "$PROJECT_ROOT/screenshots/afm-infra/iam-issues.png"

# afm-observability screenshots
mkdir -p "$PROJECT_ROOT/screenshots/afm-observability"
touch \
  "$PROJECT_ROOT/screenshots/afm-observability/prometheus-targets.png" \
  "$PROJECT_ROOT/screenshots/afm-observability/grafana-dashboard.png" \
  "$PROJECT_ROOT/screenshots/afm-observability/cloudwatch-metrics.png" \
  "$PROJECT_ROOT/screenshots/afm-observability/servicemonitor.png"

# security screenshots
mkdir -p "$PROJECT_ROOT/screenshots/security"
touch \
  "$PROJECT_ROOT/screenshots/security/sonarqube-scan.png" \
  "$PROJECT_ROOT/screenshots/security/trivy-scan.png" \
  "$PROJECT_ROOT/screenshots/security/zap-scan.png"

# issues screenshots
mkdir -p "$PROJECT_ROOT/screenshots/issues"
touch \
  "$PROJECT_ROOT/screenshots/issues/pod-scheduling-failure.png" \
  "$PROJECT_ROOT/screenshots/issues/node-capacity-exceeded.png" \
  "$PROJECT_ROOT/screenshots/issues/image-tag-mismatch.png" \
  "$PROJECT_ROOT/screenshots/issues/db-connectivity-issue.png" \
  "$PROJECT_ROOT/screenshots/issues/replica-optimization-fix.png"

# Pipeline docs
mkdir -p "$PROJECT_ROOT/pipeline-docs"
touch \
  "$PROJECT_ROOT/pipeline-docs/afm-project-pipeline.md" \
  "$PROJECT_ROOT/pipeline-docs/afm-infra-pipeline.md" \
  "$PROJECT_ROOT/pipeline-docs/afm-observability-pipeline.md"

# Interview notes
mkdir -p "$PROJECT_ROOT/interview-notes"
touch \
  "$PROJECT_ROOT/interview-notes/explain-this-project.md" \
  "$PROJECT_ROOT/interview-notes/k8s-upgrade-strategy.md" \
  "$PROJECT_ROOT/interview-notes/blue-green-deployment.md" \
  "$PROJECT_ROOT/interview-notes/failure-scenarios.md"

# Resume section
mkdir -p "$PROJECT_ROOT/resume"
touch \
  "$PROJECT_ROOT/resume/project-summary.md" \
  "$PROJECT_ROOT/resume/achievements.md"

# PDF folder
mkdir -p "$PROJECT_ROOT/pdf"
touch "$PROJECT_ROOT/pdf/AFM-DevSecOps-Portfolio.pdf"

echo "AFM DevSecOps Portfolio structure created successfully!"
echo
tree "$PROJECT_ROOT" || ls -R "$PROJECT_ROOT"

