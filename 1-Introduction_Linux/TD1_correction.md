
# TD n°1

  

## **1. Commandes de base Linux**
 

### **Exercice 1.1 : Manipulation des fichiers et répertoires**

 1. Créez un répertoire nommé `MonProjet`.

```bash
mkdir MonProjet
```

**Correction :**
Cette commande crée un répertoire nommé "MonProjet" dans le répertoire courant.

2. Accédez à ce répertoire et créez trois fichiers (fichier1.txt, fichier2.txt, fichier3.txt).

```bash
cd MonProjet
touch fichier1.txt fichier2.txt fichier3.txt
```

**Correction :**`cd MonProjet` permet de naviguer dans le répertoire. `touch` crée des fichiers vides.

3. Listez les fichiers du répertoire avec des informations détaillées.

```bash
ls -l
```

**Correction :**

La commande affiche une liste avec les permissions, la taille, et les dates de modification des fichiers.

4. Renommez fichier1.txt en donnees.txt.

```bash
mv fichier1.txt donnees.txt
```

**Correction :**

La commande `mv` est utilisée pour renommer ou déplacer un fichier.

5. Supprimez le fichier fichier3.txt.

```bash
rm fichier3.txt
```

**Correction :**

La commande `rm` supprime le fichier spécifié.  

6.  1. En utilisant echo, écrivez des lignes dans le fichier fichier2.txt.
	2. Toujours avec echo, rajoutez une dernière ligne avec le mot "error"
	3. Renommez le fichier `system.log`
7. Affichez les lignes contenant le mot "error" dans `system.log`.

```bash
grep "erreur" system.log
```

**Correction :**

La commande `grep` recherche et affiche les lignes contenant "erreur" dans le fichier spécifié.

**Plus dur...**

1. Effectuez les actions suivantes en une seule commande :
- Créez un répertoire `ProjetFinal`.
- Créez 5 fichiers (capteur1.txt, capteur2.txt, ..., capteur5.txt) à l’intérieur.
- Copiez les fichiers dans un sous-répertoire `Backup`.

**Astuce :** Combinez `mkdir`, `touch` et `cp` avec des boucles Bash.

```bash
mkdir ProjetFinal && cd  ProjetFinal && touch  capteur{1..5}.txt && mkdir  Backup && cp  capteur*.txt  Backup/
```

**Correction :**

Cette commande enchaîne les actions pour créer, copier et organiser des fichiers.

2. Renommez tous les fichiers `capteur*.txt` en remplaçant "capteur" par "data" (par exemple, `capteur1.txt` devient `data1.txt`).

**Astuce :** Utilisez une boucle avec `mv` et des variables.

```bash
for  file  in  capteur*.txt; do  mv  "$file"  "${file/capteur/data}"; done
```

**Correction :**

Cette boucle itère sur chaque fichier et remplace "capteur" par "data" dans le nom.

---

### **Exercice 1.2 : Permissions, utilisateurs et processus **

  
1. Vérifiez les permissions du fichier donnees.txt.

```bash
ls -l donnees.txt
```

**Correction :**

Cette commande affiche les permissions actuelles du fichier.

2. Modifiez les permissions pour rendre le fichier exécutable.

```bash
chmod +x donnees.txt
```

**Correction :**`chmod +x` ajoute l’autorisation d’exécution pour tous les utilisateurs.

3. Créez deux nouveaux utilisateurs : `capteur_admin` et `capteur_user`.

- Assurez-vous que `capteur_user` n’a pas accès aux commandes sudo.

```bash
sudo adduser capteur_admin
sudo adduser capteur_user
```

**Correction :**

Les commandes créent les utilisateurs avec des répertoires personnels. `capteur_user` est sans privilèges supplémentaires.

4. Simulez un processus d’arrière-plan (comme un programme qui tourne en continu) :
- Lancez un processus en arrière-plan avec la commande `sleep`.
- Identifiez son PID avec `ps` et terminez-le avec `kill`.

```bash
sleep 100 &
ps
kill <PID>
```

**Correction :**`sleep 100 &` exécute la commande en arrière-plan, `ps` liste les processus, et `kill` termine le processus en utilisant son PID.

5. Ajoutez une règle à `crontab` pour exécuter un script automatiquement toutes les 5 minutes.

```bash
crontab -e
*/5 * * * * /chemin/vers/script.sh
```

**Correction :**

La tâche planifiée est ajoutée dans le fichier crontab.


## **2. Écriture de scripts Bash**

  

### **Exercice 2.1 : Script pour automatiser les tâches**

  
**Énoncé :**

Créez un script Bash nommé `script_auto.sh` qui effectue les actions suivantes :

1. Crée un répertoire nommé `Backup`.
2. Copie tous les fichiers `.txt` présents dans le répertoire courant vers `Backup`.
3. Affiche un message indiquant que la sauvegarde est terminée.

  
**Correction :Script Bash :**


```bash
#!/bin/bash
mkdir  -p  Backup
cp  *.txt  Backup/
echo  "Sauvegarde terminée."
```

**Exécution :**

```bash
chmod  +x  script_auto.sh
./script_auto.sh
```

---


### **Exercice 2.2 : Paramètres et boucles**

**Énoncé :**

Modifiez le script précédent pour inclure une boucle qui affiche les noms des fichiers copiés.

**Correction :Script Bash :**

```bash

#!/bin/bash

mkdir  -p  Backup
for  file  in  *.txt; do
cp  "$file"  Backup/
echo  "Copié : $file"
done
echo  "Sauvegarde terminée."

```

---


## **3. Introduction à Python sur Linux**

### **Exercice 3.1 : Premier script Python**

1. Créez un fichier Python nommé `script_python.py` :

```bash
touch script_python.py
```

2. Éditez le fichier avec un éditeur (nano, vim ou VS Code) et ajoutez le code suivant :

```python
# script_python.py
print("Bienvenue dans Python sur Linux !")
```

3. Exécutez le script Python depuis le terminal :

```bash
python3 script_python.py
```

**Correction :**

1. Le fichier est créé avec la commande `touch script_python.py`.
2. Le contenu ajouté au fichier :

```python
print("Bienvenue dans Python sur Linux !")
```

3. Le script s’exécute avec la commande `python3 script_python.py`, et le message "Bienvenue dans Python sur Linux !" est affiché dans le terminal.

  

## **3.2. Interaction entre Bash et Python**

### **Exercice 3.2.1 : Interaction avec script_auto.sh**

1. Modifiez votre script Bash `script_auto.sh` pour appeler le script Python après la sauvegarde :

```bash

#!/bin/bash
mkdir Backup
for  file  in  *.txt; do
cp $file Backup/
echo "Copié : $file"
done
echo "Sauvegarde terminée."
python3 script_python.py
```

  **Correction :**

1. Le script appelle `python3 script_python.py` après la sauvegarde, affichant ainsi le message "Bienvenue dans Python sur Linux !" à la fin de l'exécution.

---

### **Exercice 3.2.2 : Interaction avancée avec Python**

1. Créez un script Bash `process_data.sh` qui :
- Lit le contenu d’un fichier texte ligne par ligne.
- Appelle un script Python (`process_line.py`) pour traiter chaque ligne et affiche le résultat dans le terminal.

**Exemple de contenu du script Python :**

```python
# process_line.py
import sys
line = sys.argv[1]
print(f"Traitement de la ligne : {line}")

```

**Exemple de commande utilisateur :**

```bash
./process_data.sh donnees.txt
```

**Correction :**

  

1. Le fichier `process_data.sh` contient le code suivant :
2. 
```bash
#!/bin/bash
while  read  -r  line; do
python3 process_line.py "$line"
done < "$1"
```

2. Le fichier Python `process_line.py` prend chaque ligne en argument et affiche le message "Traitement de la ligne : ...".
3. La commande `./process_data.sh donnees.txt` traite le fichier ligne par ligne et affiche les résultats.

  

# **4. Découverte des drivers et initiation à Arduino avec Linux**

  

## **4.1 : Liste des périphériques connectés**

  
### **Énoncé :**


1. Identifiez les périphériques connectés à votre machine :

```bash
lsusb
```

2. Listez les ports série disponibles (utiles pour connecter l’Arduino) :

```bash
dmesg | grep tty

```

### **Correction :**

 1. La commande `lsusb` affiche la liste des périphériques USB connectés, avec leur ID fabricant et produit.

**Exemple de sortie :**

```
Bus 002 Device 003: ID 1a86:7523 QinHeng Electronics HL-340 USB-Serial adapter
```

2. La commande `dmesg | grep tty` affiche les informations sur les ports série reconnus :

**Exemple de sortie :**

```
[12345.678901] usb 2-1: pl2303 converter now attached to ttyUSB0
```
---

  

## **4.2 : Introduction aux drivers**

### **Énoncé :**

1. Installez une bibliothèque Python pour la communication série (PySerial) :

```bash
pip install pyserial
```

2. Écrivez un script Python qui détecte un port série et affiche un message :

```python
import serial.tools.list_ports
ports = serial.tools.list_ports.comports()
for port in ports:
	print(f"Port détecté : {port.device}")

```

3. Testez le script avec un Arduino connecté (si disponible).


### **Correction :**

1. La commande `pip install pyserial` installe PySerial, une bibliothèque utile pour communiquer avec des ports série.

2. Le script Python énumère tous les ports série disponibles sur le système et affiche leur nom.

**Exemple de sortie :**

```
Port détecté : /dev/ttyUSB0
```

3. En connectant un Arduino, le port série correspondant sera affiché, ce qui permet d’identifier l’appareil pour des communications futures.


---

## **4.3 : Analyse des drivers**

### **Énoncé :**

  1. Identifiez le module utilisé par un périphérique USB connecté à votre machine :
- Branchez un périphérique USB (comme une clé USB ou une Arduino).
- Utilisez la commande suivante pour identifier les modules associés :

```bash
lsmod | grep usb
```

2. Désactivez temporairement un module et observez le comportement du périphérique :

```bash
sudo modprobe -r <nom_du_module>
sudo modprobe <nom_du_module>
```

  

### **Explications :**

1. La commande `lsmod | grep usb` affiche les modules liés aux périphériques USB.

**Exemple de sortie :**

```
usbserial 45056 1 pl2303
```

2. La commande `modprobe -r` désactive temporairement un module, tandis que `modprobe` le réactive. Après désactivation, le périphérique cesse de fonctionner. Une réactivation restaure son fonctionnement.

**Attention :** Cette manipulation nécessite des droits administrateur.

## Exercices avancés


### **Exercice 1.1 : Script avancé pour la gestion de fichiers**

**Énoncé :**

Créez un script Bash nommé `analyse_capteurs.sh` qui :

1. Demande à l’utilisateur un répertoire en entrée.

2. Compte le nombre de fichiers `.txt` dans ce répertoire et affiche le résultat.

3. Archive ces fichiers dans une archive `.tar.gz` nommée `backup.tar.gz`.

4. Supprime les fichiers originaux après archivage avec confirmation.


**Astuce :** Utilisez les commandes `read`, `find`, `tar`, et `rm`.

**Exemple de commande utilisateur :**

```bash
./analyse_capteurs.sh  /home/user/donnees
```

**Correction :**

```bash
#!/bin/bash
# Demander le répertoire à l'utilisateur
echo  -n  "Veuillez entrer le chemin du répertoire : "
read  repertoire

# Vérifier que le répertoire existe
if [ ! -d "$repertoire" ]; then
	echo  "Erreur : Le répertoire n'existe pas."
	exit  1
fi

# Compter les fichiers .txt
nb_fichiers=$(find  "$repertoire"  -type  f  -name  "*.txt" | wc  -l)
echo  "Nombre de fichiers .txt : $nb_fichiers"

# Créer l'archive .tar.gz

tar  -czf  backup.tar.gz  -C  "$repertoire" $(find  "$repertoire"  -type  f  -name  "*.txt"  -printf  "%P\n")

echo  "Les fichiers .txt ont été archivés dans backup.tar.gz."

# Demander confirmation pour la suppression des fichiers

read  -p  "Voulez-vous supprimer les fichiers originaux ? (y/n) : "  confirmation

if [ "$confirmation" == "y" ]; then
	find  "$repertoire"  -type  f  -name  "*.txt"  -delete

	echo  "Fichiers originaux supprimés."
else
	echo  "Suppression annulée."
fi

```

---
