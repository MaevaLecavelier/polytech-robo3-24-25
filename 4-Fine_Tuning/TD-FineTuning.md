GDocs : https://docs.google.com/document/d/1yOTLO0u2nwuLYNvJmuL-niVyeo9wDdCBkpRWCHFW4Zc/edit?usp=sharing

### Comprendre les bases

**1. Les modèles pré-entraînés**

Un modèle pré-entraîné est un modèle qui a déjà été entraîné sur un large ensemble de données (comme des millions d’images) pour reconnaître des motifs généraux. Pourquoi pensez-vous qu’il est utile d’utiliser un modèle pré-entraîné au lieu de construire un modèle à partir de zéro ? Quels sont les avantages par rapport au fait d'entraîner un modèle entier ? 
        
**2.  La taille des images**

Les modèles pré-entraînés comme `MobileNetV2` ont été conçus pour travailler avec des images d’une taille fixe. Que pourrait-il arriver si on leur donnait des images plus grandes ou plus petites ? Argumenter par rapport à l'architecture du modèle.
        
**3. L’augmentation des données**
 
En quoi consiste l'augmentation des données ? À quoi sert-elle ?
    
### Se familiariser avec le processus

**4.  La spécialisation**
Pourquoi commence-t-on par utiliser le modèle pré-entraîné tel quel (avec ses paramètres fixes) avant de l’entraîner davantage (et donc de le modifier) ?

**5. Le taux d’apprentissage**

Définition : "Le taux d'apprentissage fait référence à la force avec laquelle les informations nouvellement acquises remplacent les anciennes informations. Il détermine l’importance accordée aux informations récentes par rapport aux informations précédentes au cours du processus d’apprentissage." 
Autrement dit, le taux d’apprentissage détermine à quelle vitesse le modèle ajuste ses "paramètres internes" pendant l’entraînement. Si ce taux est trop élevé, le modèle pourrait "oublier" ce qu’il a appris avant.  Quel est le taux utilisé lors du fine tuning ? Pourquoi pensez-vous qu’un petit taux d’apprentissage est utilisé lors du fine-tuning ?
        
**6. Séparer les données**  
Pourquoi avons-nous besoin de données de validation et de test ? Comment sont-elles séparées dans l'exercice ?

### Analyser les résultats

**7. La précision (accuracy)**
  
Que signifie "précision" (accuracy) en Machine Learning ? Comment est-elle calculée ? La précision peut indiquer un phénomène de surapprentissage. Si la précision est élevée sur l’entraînement mais basse sur la validation, qu’est-ce que cela peut dire sur le modèle ?

**8. En cas de problème**
  
Pourquoi le modèle pourrait-il échouer à reconnaître correctement une image  ? Comment pensez-vous qu’on pourrait améliorer cela ?
        

### Lier à des idées pratiques

**9. Le transfert d’apprentissage**
   
Imaginez que vous travailliez sur un projet où vous devez reconnaître des types d’objets hyper-spécifiques  (comme des outils industriels ou des anomalies de pièces usinées). Pourquoi serait-il pertinent d’utiliser le transfert d’apprentissage ? Quels sont les deux principaux avantages d'utiliser un modèle pré-entraîné ? 

**10. Données de tests différentes**
Que se passe-t-il si nos données ne ressemblent pas aux données sur lesquelles le modèle a été pré-entraîné ? Quels ajustements pourriez-vous proposer pour résoudre ce problème ?
        

### Explorer et expérimenter

**11. Pertinence de l’augmentation de données**

Comment pourriez-vous tester si l’augmentation des données améliore vraiment les performances ? Quelles seraient les métriques pertinentes à analyser pour s'assurer que l'augmentation de données  a été pertinente ? 

**12. Variété des données**  

Pourquoi est-il important d’avoir des données variées dans votre jeu d’entraînement ?**
           
