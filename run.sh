#!/bin/bash
set -e

IMAGE_NAME="hello-world-app"
CONTAINER_NAME="hello-world-container"
PORT=8080

echo "==> Construction de l'image Docker ($IMAGE_NAME)..."
docker build -t "$IMAGE_NAME" .

if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "==> Suppression de l'ancien conteneur..."
    docker rm -f "$CONTAINER_NAME" > /dev/null
fi

echo "==> Lancement du conteneur sur le port $PORT..."
docker run -d --name "$CONTAINER_NAME" -p "$PORT":80 "$IMAGE_NAME"

echo ""
echo "L'application est en ligne : http://localhost:$PORT"
