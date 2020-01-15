#!/bin/sh
set -e

echo "Updating repo"
git pull

echo "Switching to dev context"
kubectl config use-context dev

echo "Deploying Redis"
kubectl apply -f redis-dev.yaml

echo "Deploying app"
kubectl apply -f mindbox-task-dev.yaml

echo "Deployed."
