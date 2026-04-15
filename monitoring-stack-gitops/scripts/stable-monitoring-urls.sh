#!/bin/bash
set -euo pipefail

MON_NS="monitoring"
GRAFANA_SVC="monitoring-grafana"
PROM_SVC="monitoring-prometheus-server"

GRAFANA_NODEPORT=6060
PROM_NODEPORT=6061

echo "Checking Kubernetes connectivity..."
kubectl cluster-info >/dev/null

echo "Checking namespace..."
kubectl get ns "${MON_NS}" >/dev/null

echo "Checking services..."
kubectl get svc "${GRAFANA_SVC}" -n "${MON_NS}" >/dev/null
kubectl get svc "${PROM_SVC}" -n "${MON_NS}" >/dev/null

echo "Patching Grafana service to NodePort ${GRAFANA_NODEPORT}..."
kubectl patch svc "${GRAFANA_SVC}" -n "${MON_NS}" --type='merge' -p "
spec:
  type: NodePort
  ports:
    - name: service
      port: 80
      targetPort: 3000
      nodePort: ${GRAFANA_NODEPORT}
"

echo "Patching Prometheus service to NodePort ${PROM_NODEPORT}..."
kubectl patch svc "${PROM_SVC}" -n "${MON_NS}" --type='merge' -p "
spec:
  type: NodePort
  ports:
    - name: service
      port: 80
      targetPort: 9090
      nodePort: ${PROM_NODEPORT}
"

HOST_IP="$(hostname -I | awk '{print $1}')"

echo
echo "Stable URLs configured:"
echo "Grafana:    http://${HOST_IP}:${GRAFANA_NODEPORT}"
echo "Prometheus: http://${HOST_IP}:${PROM_NODEPORT}"
echo
echo "Current services:"
kubectl get svc -n "${MON_NS}" "${GRAFANA_SVC}" "${PROM_SVC}"
