#!/bin/bash

echo "Stopping old container..."
docker stop amazon-clone || true

echo "Removing old container..."
docker rm amazon-clone || true

echo "Building Docker image..."
docker build -t amazon-clone:latest .

echo "Starting new container..."
docker run -d --name amazon-clone -p 8080:80 amazon-clone:latest

echo "Deployment completed successfully."
