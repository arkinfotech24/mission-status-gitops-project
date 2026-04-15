# Monitoring Stack GitOps Bundle

This bundle installs Prometheus and Grafana in Kubernetes and is structured so ArgoCD can manage it from Git.

## What is included
- Prometheus Helm release
- Grafana Helm release
- ArgoCD Application manifests
- Grafana datasource pre-provisioning
- Example dashboard ConfigMap
- Access helper scripts

## Suggested repo layout
Commit this folder into your Git repo, then apply the ArgoCD applications from the `argocd/` folder.

## Quick start
1. Unzip the bundle
2. Review the values files under `apps/`
3. Apply the ArgoCD applications:
   ```bash
   kubectl apply -f argocd/prometheus-app.yaml
   kubectl apply -f argocd/grafana-app.yaml
   ```
4. Verify:
   ```bash
   kubectl get applications -n argocd
   kubectl get pods -n monitoring
   ```

## Grafana login
- Username: admin
- Password: admin123

## Local access
```bash
./scripts/access-grafana.sh
./scripts/access-prometheus.sh
```
