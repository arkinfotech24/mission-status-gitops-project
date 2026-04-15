#!/bin/bash

echo "🚀 Starting ArgoCD access..."

kubectl port-forward svc/argocd-server -n argocd --address 0.0.0.0 7070:80
