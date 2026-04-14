#!/bin/bash
set -e

echo "Starting Kubernetes deployment..."

echo "Applying deployment manifest..."
kubectl apply -f k8s/deployment.yaml

echo "Applying service manifest..."
kubectl apply -f k8s/service.yaml

echo "Current deployments:"
kubectl get deployments

echo "Current pods:"
kubectl get pods

echo "Current services:"
kubectl get svc

echo "Deployment finished successfully."
