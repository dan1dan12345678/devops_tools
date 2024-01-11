#!/bin/bash

# Define your port-forward commands
commands=(
  "kubectl --namespace default port-forward grafana-64884db568-77c7s 3000 --address 0.0.0.0"
  "kubectl --namespace default port-forward prometheus-server-6b68fbd54b-96zn4 9090 --address 0.0.0.0"
  "kubectl port-forward svc/argocd-server -n argocd 8080:443 --address 0.0.0.0"
)

# Loop through and execute each command in the background
for cmd in "${commands[@]}"; do
    nohup $cmd > /dev/null 2>&1 &
    echo "Started: $cmd"
done

echo "All port-forwards are running in the background."
