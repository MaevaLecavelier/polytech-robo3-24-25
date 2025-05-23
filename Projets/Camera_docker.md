# Utiliser la caméra avec Docker

## Lier la caméra au Docker  

Il faut rajouter dans le docker-compose ces lignes-là : 

    devices:
     - /dev/video0:/dev/video0  # Accès à la caméra
    # - /dev/ttyUSB0:/dev/ttyUSB0 # Accès à l'Arduino


## Permettre à la vidéo de s'afficher sur la machine hôte

Avec un écran connecté à la machine sur laquelle tourne le Docker (Jetson Nano ou votre ordinateur), taper la commande suivante : 

    xhost +
Cela autorise n'importe quel processus à se connecter à l'écran, et donc permet au Docker d'afficher le retour caméra si demandé par un programme Python. 
Pour annuler l'autorisation : 

    xhost -

