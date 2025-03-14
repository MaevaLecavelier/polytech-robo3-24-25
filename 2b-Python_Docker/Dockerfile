# Utiliser une image officielle Python 3.10
FROM python:3.10-slim

# Installer des dépendances système nécessaires
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libopencv-dev \
    ffmpeg \
    python3-pip \
    python3-dev \
    python3-venv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Installer les bibliothèques Python
RUN pip install --no-cache-dir \
    numpy \
    pandas \
    opencv-python \
    tensorflow \
    matplotlib \
    scikit-learn \
    seaborn \
    pyserial \
    jupyterlab \
    flask \
    requests

# Créer un dossier pour les projets
WORKDIR /app

# Copier les scripts ou fichiers nécessaires (optionnel)
COPY . /app

# Définir le point d'entrée par défaut pour le conteneur
CMD ["/bin/bash"]
