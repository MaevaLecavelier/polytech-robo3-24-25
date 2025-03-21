# Exercice : Construire un modèle IA pour classifier des fleurs Iris avec TensorFlow

## Objectif
Vous allez construire et entraîner un modèle de réseau de neurones pour prédire la classe d'une fleur en fonction de ses caractéristiques (longueur/largeur des pétales et sépales).
Cet exercice est un exercice guidé pour apprendre à prendre en main les concepts d'IA. Au cours prochain, nous reviendrons sur ces concepts pour expliquer plus en détail ce que nous avons fait.

---

## Étape 1 : Charger les données Iris

Le dataset Iris est un jeu de données standard pour la classification. Il contient trois classes de fleurs : Setosa, Versicolor, Virginica. Chaque fleur est décrite par quatre caractéristiques.

1. Importez les bibliothèques nécessaires : `tensorflow`, `sklearn`, et `numpy`.
2. Chargez le dataset Iris à l'aide de `sklearn.datasets.load_iris`.
3. Vérifiez les données en affichant les caractéristiques (X) et les labels (y).

**Code à compléter** :
```python
from sklearn import datasets

# Charger le dataset Iris
iris = datasets.load_iris()
x = iris.data  # Caractéristiques (features)
y = iris.target  # Labels (classes)

# Affichez quelques exemples de données
print("Caractéristiques (X) :")
print(x[:5])
print("Labels (y) :")
print(y[:5])
```

---

## Étape 2 : Préparer les données

Pour utiliser TensorFlow, nous devons :
1. **Convertir les labels** en format *one-hot encoding*.
2. **Diviser les données** en ensembles d'entraîment (train) et de test (test).

**Instructions** :
1. Utilisez `OneHotEncoder` de `sklearn.preprocessing` pour convertir les labels en format one-hot.
2. Divisez les données en ensembles d'entraîment et de test (80 % train, 20 % test) avec `train_test_split`.

**Code à compléter** :
```python
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import OneHotEncoder

# Convertir les labels en one-hot encoding
encoder = OneHotEncoder(sparse_output=False)
y_one_hot = encoder.fit_transform(y.reshape(-1, 1))

# Diviser les données en ensembles d'entraîment et de test
x_train, x_test, y_train, y_test = train_test_split(x, y_one_hot, test_size=0.2, random_state=42)

print("Dimensions de x_train :", x_train.shape)
print("Dimensions de y_train :", y_train.shape)
```

---

## Étape 3 : Construire le modèle

Nous allons définir un réseau de neurones simple avec TensorFlow. Il comprendra :
1. Une **couche d'entrée** pour 4 caractéristiques (longueur/largeur des pétales et sépales).
2. Une **couche cachée** avec 10 neurones.
3. Une **couche de sortie** avec 3 neurones (une pour chaque classe) utilisant la fonction d'activation softmax.

**Instructions** :
1. Utilisez `tf.keras.Sequential` pour construire le modèle.
2. Ajoutez les couches nécessaires : `Dense` avec des fonctions d’activation.

**Code à compléter** :
```python
import tensorflow as tf

# Construire le modèle
model = tf.keras.Sequential([
    tf.keras.layers.InputLayer(input_shape=(4,)),  # Couche d'entrée avec 4 caractéristiques
    tf.keras.layers.Dense(10, activation='relu'),  # Couche cachée avec 10 neurones
    tf.keras.layers.Dense(3, activation='softmax')  # Couche de sortie pour 3 classes
])

# Résumé du modèle
model.summary()
```

---

## Étape 4 : Compiler le modèle

Avant d'entraîner le modèle, nous devons le compiler en spécifiant :
1. Une **fonction de perte** : `categorical_crossentropy` pour les classifications multi-classes.
2. Un **optimiseur** : `adam` pour l’apprentissage.
3. Une **métrique d’évaluation** : `accuracy`.

**Code à compléter** :
```python
# Compiler le modèle
model.compile(optimizer='adam',
              loss='categorical_crossentropy',
              metrics=['accuracy'])

print("Modèle compilé avec succès.")
```

---

## Étape 5 : Entraîner le modèle

L'étape suivante consiste à entraîner le modèle sur les données d'entraîment (`X_train`, `y_train`).

**Instructions** :
1. Entraînez le modèle en spécifiant :
   - Nombre d'époques : 50.
   - Taille des lots (*batch size*) : 8.
   - Fraction des données à utiliser pour la validation : 10 %.
2. Observez la progression de la perte et de la précision.

**Code à compléter** :
```python
# Entraîner le modèle
history = model.fit(x_train, y_train, epochs=50, batch_size=8, validation_split=0.1)

print("Entraîment terminé.")
```

---

## Étape 6 : Évaluer le modèle

Pour vérifier la performance du modèle, évaluez-le sur l'ensemble de test (`X_test`, `y_test`).

**Code à compléter** :
```python
# Évaluer le modèle
loss, accuracy = model.evaluate(x_test, y_test)
print(f"Perte sur l'ensemble de test : {loss:.4f}")
print(f"Précision sur l'ensemble de test : {accuracy:.4f}")
```

---

## Étape 7 : Faire des prédictions

Utilisez le modèle pour prédire les classes des fleurs dans l'ensemble de test.

**Instructions** :
1. Utilisez `model.predict` pour obtenir les prédictions.
2. Identifiez la classe prédite et comparez-la à la classe réelle.

**Code à compléter** :
```python
import numpy as np

# Faire des prédictions
predictions = model.predict(x_test)
predicted_classes = np.argmax(predictions, axis=1)
true_classes = np.argmax(y_test, axis=1)

print("Prédictions :", predicted_classes)
print("Classes réelles :", true_classes)
```

## Étape 8 : Évaluer avec précision, rappel et F1-score


Évaluez le modèle avec d'autres métriques comme `precision`, `recall`

### Importer les fonctions nécessaires
Ajoutez les fonctions suivantes depuis `sklearn.metrics` :
```python
from sklearn.metrics import precision_score, recall_score, f1_score, classification_report
```

### Calculer les métriques
```python
# Calculer les métriques
precision = precision_score(true_classes, predicted_classes, average='weighted')
recall = recall_score(true_classes, predicted_classes, average='weighted')
f1 = f1_score(true_classes, predicted_classes, average='weighted')

print(f"Précision : {precision:.4f}")
print(f"Rappel : {recall:.4f}")
print(f"F1-score : {f1:.4f}")
```

> **Note** : La méthode `average='weighted'` calcule une moyenne pondérée par la taille de chaque classe. Vous pouvez également utiliser `average='macro'` (non pondéré) ou `average='micro'` (total des vrais positifs diviseé par le total des prédictions).

### Rapport de classification
```python
# Générer un rapport de classification
report = classification_report(true_classes, predicted_classes, target_names=iris.target_names)
print(report)
```

---

## Bonus : Améliorations possibles
- Essayez d'ajouter une deuxième couche cachée.
- Augmentez/diminuez le nombre de neurones dans la couche cachée.
- Modifiez le nombre d'époques ou la taille des lots.

---

Ce format permet de suivre pas à pas tout en introduisant progressivement les concepts et les étapes nécessaires pour créer un modèle IA avec TensorFlow.

