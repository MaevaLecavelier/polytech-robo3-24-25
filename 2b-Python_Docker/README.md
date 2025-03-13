# TD02 Python avec Docker


Bienvenue dans le TD2-bis où nous allons travailler sur Python avec un environnement complètement isolé : Docker. 

Pour utiliser pleinement ce dossier, voici les premières étapes:  
- Rendre le script d'installation exécutable
- Exécuter le script d'installation
- Fermer le terminal
- Rouvrir le terminal

``` Cette opération permet de fermer la session et de la redémarrer pour appliquer les changements de groupe qui ont été opérés dans le script d'installation```

- Confirmer que vous faites bien partie du groupe "docker" en faisant la commande `groups` : 

```bash
$ groups
docker adm tty uucp dialout cdrom sudo audio dip video plugdev i2c lpadmin gdm lightdm sambashare weston-launch gpio kali
```

- Faire `docker-compose version` et vérifier que la fin du script affiche cela :

```bash
docker-compose version 1.27.4, build unknown
docker-py version: 4.4.4
CPython version: 3.6.9
OpenSSL version: OpenSSL 1.1.1  11 Sep 2018
```
 
- Vérifier la version de `nvidia-docker` :

```bash
$ nvidia-docker version
NVIDIA Docker: 2.8.0
Client:
 Version:           20.10.7
 API version:       1.41
 Go version:        go1.13.8
 Git commit:        20.10.7-0ubuntu5~18.04.3
 Built:             Mon Nov  1 01:04:31 2021
 OS/Arch:           linux/arm64
 Context:           default
 Experimental:      true

Server:
 Engine:
  Version:          20.10.7
  API version:      1.41 (minimum version 1.12)
  Go version:       go1.13.8
  Git commit:       20.10.7-0ubuntu5~18.04.3
  Built:            Fri Oct 22 00:57:37 2021
  OS/Arch:          linux/arm64
  Experimental:     false
 containerd:
  Version:          1.5.5-0ubuntu3~18.04.2
  GitCommit:
 runc:
  Version:          1.0.1-0ubuntu2~18.04.1
  GitCommit:
 docker-init:
  Version:          0.19.0
  GitCommit:
```


Pour vérifier que l'installation s'est bien passé et que vous êtes prêts à travailler, faire les commandes suivantes : 
- `docker-compose build` : permet de construire l'image Docker telle que définie dans le fichier `Dockerfile`
- `docker-composer up -d`: permet de créer et démarrer le conteneur défini dans le fichier `docker-compose.yml. Le flag `-d` permet de le lancer en arrière-plan (ie: détaché). Ce qui permet de ne pas bloquer le terminal.
- `docker ps`: permet d'afficher la liste des conteneurs actifs. Vous pourrez alors voir le nom du conteneur que vous venez de démarrer 
- `docker exec -it <nom du conteneur> bash` : permet de se connecter au conteneur spécifier. Les flags `-i` et `-t`(souvent concaténé `-it`) permettent d'utiliser un terminal (`-t`) en mode interactif (`-i`). `bash` permet de spécifier que l'on veut lancer le shell Bash, nous permettant de pouvoir interragir avec l'environnement créé.

Si tout s'est bien passé, vous devriez être dans un environnement Docker avec Python 3.10. Pour le confirmer, faire : `python3 --version`

Maintenant, pour vérifier que vous avez bien toutes les bibliothèques d'installées, une fois dans le conteneur Docker, aller dans le dossier `app` et exécuter avec Python le fichier `test_imports.py`
