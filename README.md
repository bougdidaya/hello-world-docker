# Hello World — App conteneurisée avec Docker

## C'est quoi ce projet ?

Une petite page web ("Hello World") empaquetée avec Docker, pour qu'elle
puisse tourner sur n'importe quelle machine sans installation compliquée.

## Structure des fichiers

hello-world-docker/
- app/            -> le code de la page (HTML, CSS, JS)
- Dockerfile       -> la recette pour construire l'image
- run.sh           -> le script qui lance tout automatiquement
- README.md        -> ce fichier

## Comment l'utiliser

cd ~/hello-world-docker
chmod +x run.sh
./run.sh

Une fois lancé, ouvre un navigateur sur :

http://localhost:8080

Tu peux relancer ./run.sh autant de fois que tu veux, même après avoir
modifié le code — le script gère tout tout seul.

## Comment ça marche, en 3 étapes

1. Dockerfile -> un fichier texte qui dit "prends nginx, ajoute mes
   fichiers HTML/CSS/JS dedans"
2. docker build -> transforme cette recette en une image
   (un modèle prêt à l'emploi, stocké sur le disque)
3. docker run -> prend cette image et démarre un conteneur
   (un vrai processus, en train de tourner, accessible sur le port 8080)

## Le rôle du port 8080

Le conteneur écoute sur le port 80 à l'intérieur de lui-même, mais
ce port n'est pas visible depuis l'extérieur tout seul. La commande
docker run -p 8080:80 crée un pont : tout ce qui arrive sur le port
8080 de la machine est redirigé vers le port 80 du conteneur.

## Commandes utiles

docker ps                          # voir si le conteneur tourne
docker logs hello-world-container  # voir ce qui se passe dedans
docker stop hello-world-container  # arrêter
docker start hello-world-container # relancer sans tout reconstruire

## Problème fréquent

Si tu vois une erreur du genre "le nom est déjà utilisé" en lançant
docker run à la main, c'est qu'un ancien conteneur existe déjà.
Le script run.sh gère ça automatiquement — utilise-le plutôt que de
taper les commandes une par une.
