# Exercice : Construire un modèle IA pour classifier des fleurs Iris avec TensorFlow

## Objectif
Vous allez construire et entraîner un modèle de réseau de neurones pour prédire la classe d'une fleur en fonction de ses caractéristiques (longueur/largeur des pétales et sépales).

---

## Étape 1 : Charger les données Iris

Le dataset Iris est un jeu de données standard pour la classification. Il contient trois classes de fleurs : Setosa, Versicolor, Virginica. Chaque fleur est décrite par quatre caractéristiques.

1. Importez les bibliothèques nécessaires : `tensorflow`, `sklearn`, et `numpy`.
2. Chargez le dataset Iris à l'aide de `load_iris`.
3. Vérifiez les données en affichant les caractéristiques (X) et les labels (y).


---

## Étape 2 : Préparer les données

Pour utiliser TensorFlow, nous devons :
1. **Convertir les labels** en format *one-hot encoding*.
2. **Diviser les données** en ensembles d'entraînement (train) et de test (test).

**Instructions** :
1. Utilisez `OneHotEncoder` pour convertir les labels en format one-hot.
2. Divisez les données en ensembles d'entraîment et de test (80 % train, 20 % test).

---

## Étape 3 : Construire le modèle

Nous allons définir un réseau de neurones simple avec TensorFlow. Il comprendra :
1. Une **couche d'entrée** pour 4 caractéristiques (longueur/largeur des pétales et sépales).
2. Une **couche cachée** avec 10 neurones.
3. Une **couche de sortie** avec 3 neurones (une pour chaque classe) utilisant la fonction d'activation softmax.

**Instructions** :
1. Utilisez `Sequential` pour construire le modèle.
2. Ajoutez les couches nécessaires : `Dense` avec des fonctions d’activation.

---

## Étape 4 : Compiler le modèle

Avant d'entraîner le modèle, nous devons le compiler en spécifiant :
1. Une **fonction de perte** : `categorical_crossentropy` pour les classifications multi-classes.
2. Un **optimiseur** : `adam` pour l’apprentissage.
3. Une **métrique d’évaluation** : `accuracy`.

---

## Étape 5 : Entraîner le modèle

L'étape suivante consiste à entraîner le modèle sur les données d'entraîment (`X_train`, `y_train`).

**Instructions** :
1. Entraînez le modèle en spécifiant :
   - Nombre d'épochs : 50.
   - Taille des lots (*batch size*) : 8.
   - Fraction des données à utiliser pour la validation : 10 %.
2. Observez la progression de la perte et de la précision.


---

## Étape 6 : Évaluer le modèle

Pour vérifier la performance du modèle, évaluez-le sur l'ensemble de test (`X_test`, `y_test`). Précisez la perte et la précision.


---

## Étape 7 : Faire des prédictions

Utilisez le modèle pour prédire les classes des fleurs dans l'ensemble de test.

**Instructions** :
1. Utilisez `model.predict` pour obtenir les prédictions.
2. Identifiez la classe prédite et comparez-la à la classe réelle.


---

## Bonus : Améliorations possibles
- Essayez d'ajouter une deuxième couche cachée.
- Augmentez/diminuez le nombre de neurones dans la couche cachée.
- Modifiez le nombre d'épochs ou la taille des lots.
- Évaluez le modèle avec d'autres métriques comme `precision`, `recall`.

---
