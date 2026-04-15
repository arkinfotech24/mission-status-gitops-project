## Grafana and Prometheus Block

#!/bin/bash

echo "Starting Grafana on :6060"
nohup kubectl port-forward svc/monitoring-grafana -n monitoring --address 0.0.0.0 6060:80 > grafana.log 2>&1 &

echo "Starting Prometheus on :6061"
nohup kubectl port-forward svc/monitoring-prometheus-server -n monitoring --address 0.0.0.0 6061:80 > prometheus.log 2>&1 &

echo ""
echo "Grafana:     http://192.168.1.170:6060"
echo "Prometheus:  http://192.168.1.170:6061"
