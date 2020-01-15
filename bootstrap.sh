#!/bin/sh
set -e

echo "Creating namespaces..."

kubectl apply -f dev/namespace.yaml
kubectl apply -f stg/namespace.yaml
kubectl apply -f prod/namespace.yaml

echo "Namespaces created."
echo "Creating contexts..."

kubectl config set-context dev --namespace=dev \
  --cluster=docker-desktop \
  --user=docker-desktop
kubectl config set-context stg --namespace=stg \
  --cluster=docker-desktop \
  --user=docker-desktop
kubectl config set-context prod --namespace=prod \
  --cluster=docker-desktop \
  --user=docker-desktop

echo "Contexts dev, stg, prod created."