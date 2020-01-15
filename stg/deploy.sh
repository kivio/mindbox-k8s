#!/bin/sh
set -e

echo "Updating repo"
git pull

echo "Switching to stg context"
kubectl config use-context stg

echo "Deploying Redis"
kubectl apply -f redis-stg.yaml

echo "Deploying app"
kubectl apply -f mindbox-task-stg.yaml

echo "Deployed."