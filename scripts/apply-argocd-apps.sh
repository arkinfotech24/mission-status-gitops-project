#!/bin/bash
set -e
kubectl apply -f argocd/prometheus-app.yaml
kubectl apply -f argocd/grafana-app.yaml
kubectl get applications -n argocd
