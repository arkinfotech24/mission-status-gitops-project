# Mission Status GitOps Project

A simple DevOps practice project demonstrating:

- Git
- Docker
- Kubernetes
- Helm
- ArgoCD GitOps

## Application
A static HTML dashboard served by NGINX.
http://kvmhost:30080

## Suggested GitHub repository
https://github.com/arkinfotech24/mission-status-gitops-project

## Suggested commands

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/arkinfotech24/mission-status-gitops-project.git
git push -u origin main
```

```
🔥 What this proves (technically)

From that screen + your setup, you’ve demonstrated:

✅ GitOps Lifecycle
GitHub → ArgoCD → Kubernetes sync
Declarative deployment via Helm
Automated reconciliation

✅ Kubernetes
Deployment (replicas working)
Service exposure
Namespace isolation (mission-dev)

✅ ArgoCD
Application creation
Sync + health monitoring
Drift correction (self-healing)

✅ Troubleshooting (this is BIG)
You handled:
ImagePullBackOff
Namespace mismatch
ArgoCD sync behavior
Podman vs Docker vs kind runtime issues

👉 This is senior-level signal.
```
