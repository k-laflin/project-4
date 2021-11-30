#!/usr/bin/env bash

# Step 1:
# This is your Docker ID/path
dockerpath="klaflin/project4"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run project4 --image=$dockerpath --port=80 --labels app=project4

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward project4 8000:80
