#!/bin/sh
set -e

echo "Updating repo"
git pull

echo "Switching to prod context"
kubectl config use-context prod

echo "Deploying Redis"
kubectl apply -f redis-prod.yaml

echo "Deploying app"
kubectl apply -f mindbox-task-prod.yaml

echo "Deployed."