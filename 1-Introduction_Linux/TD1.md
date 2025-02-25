# TD n°1

## **1. Commandes de base Linux**

### **Exercice 1.1 : Manipulation des fichiers et répertoires**

1. Créez un répertoire nommé `MonProjet`.
2. Accédez à ce répertoire et créez trois fichiers (fichier1.txt, fichier2.txt, fichier3.txt).
3. Listez les fichiers du répertoire avec des informations détaillées.
4. Renommez fichier1.txt en donnees.txt.
5. Supprimez le fichier fichier3.txt.
6.   1. En utilisant echo, écrivez des lignes dans le fichier fichier2.txt.
     2. Toujours avec echo, rajoutez une dernière ligne avec le mot "error"
     3. Renommez le fichier `system.log`
7. Affichez les lignes contenant le mot "error" dans `system.log`.


    
**Plus dur...**

1. Effectuez les actions suivantes en une seule ligne de commande :
    - Créez un répertoire `ProjetFinal`.
    - Créez 5 fichiers (capteur1.txt, capteur2.txt, ..., capteur5.txt) à l’intérieur.
    - Copiez les fichiers dans un sous-répertoire `Backup`.   
2. Renommez tous les fichiers `capteur*.txt` en remplaçant "capteur" par "data" (par exemple, `capteur1.txt` devient `data1.txt`).
    **Astuce :** Utilisez une boucle avec `mv` et des variables.    

---

### **Exercice 1.2 : Permissions, utilisateurs et processus**

1. Vérifiez les permissions du fichier donnees.txt. 
2. Modifiez les permissions pour rendre le fichier exécutable.    
3. Créez deux nouveaux utilisateurs : `capteur_admin` et `capteur_user`.
    - Assurez-vous que `capteur_user` n’a pas accès aux commandes sudo.  
4. Simulez un processus d’arrière-plan (comme un programme qui tourne en continu) :
    - Lancez un processus en arrière-plan avec la commande `sleep`.
        - **Attention** la commande sleep prend un argument.
        - **Astuce** le charactère `&` permet de lancer une commande en arrière plan`
    - Identifiez son PID avec `ps` et terminez-le avec `kill`.
5. Ajoutez une règle à `crontab` pour exécuter un script automatiquement toutes les 5 minutes.
    - Pour en savoir plus sur le format de crontab : https://crontab.guru/
  

## **2. Écriture de scripts Bash**

### **Exercice 2.1 : Script pour automatiser les tâches**

**Énoncé :**
Créez un script Bash nommé `script_auto.sh` qui effectue les actions suivantes :

1. Crée un répertoire nommé `Backup`.
2. Copie tous les fichiers `.txt` présents dans le répertoire courant vers `Backup`.
3. Affiche un message indiquant que la sauvegarde est terminée.

Exécutez le script

---

### **Exercice 2.2 : Paramètres et boucles**

**Énoncé :**
Modifiez le script précédent pour inclure une boucle qui affiche les noms des fichiers copiés.

---

## **3. Introduction à Python sur Linux**

### **Exercice 3.1 : Premier script Python**

1. Créez un fichier Python nommé `script_python.py`
  
2. Éditez le fichier avec un éditeur (nano, vim ou VS Code) et ajoutez le code suivant
    
    ```python
    # script_python.py
    print("Bienvenue dans Python sur Linux !")
    ```
  
3. Exécutez le script Python depuis le terminal


## **3.2. Interaction entre Bash et Python**

### **Exercice 3.2.1 : Interaction avec script_auto.sh**

1. Modifiez votre script Bash `script_auto.sh` pour appeler le script Python après la sauvegarde :

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
    

# **4. Exercice de découverte des drivers et initiation à Arduino avec Linux**

## **4.1 : Liste des périphériques connectés**

### **Énoncé :**

1. Identifiez les périphériques connectés à votre machine
    
2. Listez les ports série disponibles (utiles pour connecter l’Arduino). **Indice** : les ports séries utilisent le terme `tty`
   
---

## **4.2 : Introduction aux drivers**

### **Énoncé :**

1. Installez une bibliothèque Python pour la communication série (PySerial) :
    
2. Écrivez un script Python qui détecte un port série et affiche un message :
    
    ```
    import serial.tools.list_ports
    
    ports = serial.tools.list_ports.comports()
    for port in ports:
        print(f"Port détecté : {port.device}")
    ```
    
3. Testez le script avec un Arduino connecté (si disponible). Que voyez-vous ? 

---

## **4.3 : Analyse des drivers**

### **Énoncé :**

1. Identifiez le module utilisé par un périphérique USB connecté à votre machine :
    - Branchez un périphérique USB (comme une clé USB ou une Arduino).
    - Utilisez la commande suivante pour identifier les modules associés :
        
        ```
        lsmod | grep usb
        ```
        
2. Désactivez temporairement un module et observez le comportement du périphérique :
    
    ```
    sudo modprobe -r <nom_du_module>
    sudo modprobe <nom_du_module>
    ```
    

### **Explications :**

1. La commande `lsmod | grep usb` affiche les modules liés aux périphériques USB.
**Exemple de sortie :**
    
    ```
    Module                  Size  Used by
    usbserial              45056  1 pl2303
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
./analyse_capteurs.sh /home/user/donnees
```
