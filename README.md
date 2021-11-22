# project-4
CircleCI status:
[![CircleCI](https://circleci.com/gh/k-laflin/project-4/tree/main.svg?style=svg)](https://circleci.com/gh/k-laflin/project-4/tree/main)

## Summary
This project deploys a machine learning python application which can predict housing prices in Boston. It can be configured to deploy in a Kubernetes container, using a CircleCI pipeline. 

## How to run the app:
To run using docker:
`./run_docker.sh`
To run using kubernetes:
`./upload_docker.sh`
`minikube start`
`./run_kubernetes.sh`
When running this for the first time, you might get an error because the status is still pending. When `kubectl get pod project4` returns a Running status, then re-run the following:
`kubectl port-forward project4 8000:80`

You can then test the app by requesting a prediction in a new terminal:
`./make_prediction.sh`

## Files included:
`app.py`            : the python application.
`make_prediction.sh`: a shell script which can be called to get a prediction once the application is running. 
`Dockerfile`        : a configuration file which can be used to build our docker image. 
`requirements.txt`  : lists the required packages for the application.
`Makefile`          : pre-defined Makefile for easy building and testing. 
`run_docker.sh`     : a shell script which builds a docker container according to the Dockerfile specs, and begins running the application. 
`upload_docker.sh`  : assumes `run_docker.sh` has already been run. Tags the image with the remote path, and pushes it to a Dockerhub repository.
`run_kubernetes.sh` : deploys the docker image in a kubernetes container. Requires a previous run of `upload_docker.sh` as well as an active Kubernetes pod.