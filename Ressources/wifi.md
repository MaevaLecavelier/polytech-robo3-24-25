Pour configurer le Wifi en ligne de commande : 

`nmcli device wifi list #permet de voir la liste des réseaux Wifi détectés`

`sudo nmcli device wifi connect "Nom du réseau" --ask`

**ATTENTION** : la commande ci-dessus va d'abord vous demander le mot de passe  utilisateur et ensuite le mot de passe Wifi. 


Une fois le Wifi configuré sur votre carte, vous pourrez vous y connecter à distance (avec uniquement une interface Terminal). 
Pour cela, vous allez avoir besoin de votre nom d'utilisateur et du nom de la machine. Vous pouvez récupérer ces informations 
avec `whoami` (indique le nom d'utilisateur) et `hostname`(affiche le nom de la machine). 
Et ensuite, pour s'y connecter à distance : 

/!\ Votre ordinateur doit être connecté au **même wifi**

`ssh <nom de l'utilisateur>@<hostname>`

Exemple : `ssh maeva@ubuntu`

Si vous êtes connectés au même Wifi, un message concernant l'authentification du système s'affichera. Taper Yes dans le terminal
et vous pourrez vous connecter avec votre mot de passe utilisateur.



Se connecter en série (si pas de Wifi configuré et pas d'écran) : 

* Télécharger Tera Term
* Connecter un câble USB-C (sur le port à droite de la Jetson) à votre ordinateur. Le câble doit permettre le transfert de données
* Sur Tera Term, sélectionner "Serial" et choisissez la ligne correspondant au périphérique USB connecté
* Un terminal s'ouvre. taper sur Entrée, et le login apparaît. Vous pourrez alors vous connecter au wifi avec les lignes de commande au début de cette page !
