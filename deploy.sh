#!/bin/bash

APP_NAME="simple-node-app"
PORT=5000

echo "🚀 Stopping existing Docker containers..."
docker stop $APP_NAME || true

echo "🗑 Removing existing Docker containers..."
docker rm $APP_NAME || true

echo "🗑 Removing old Docker images..."
docker rmi $APP_NAME:latest || true

echo "🐳 Building a new Docker image..."
docker build -t $APP_NAME:latest .

echo "🚀 Running a new Docker container..."
docker run -d -p $PORT:5000 --name $APP_NAME $APP_NAME:latest

echo "✅ Deployment completed! Visit http://localhost:$PORT"
