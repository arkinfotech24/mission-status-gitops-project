#!/bin/bash
kubectl port-forward svc/monitoring-prometheus-server -n monitoring 9090:80
