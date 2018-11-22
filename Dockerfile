FROM ubuntu:14.04
    
RUN apt-get update
RUN apt-get install -y htop apache2 openssh-server nmap

# Installation de Node.js à partir du site officiel
#RUN curl -LO "https://nodejs.org/dist/v0.12.5/node-v0.12.5-linux-x64.tar.gz" \
#&& tar -xzf node-v0.12.5-linux-x64.tar.gz -C /usr/local --strip-components=1 \
#&& rm node-v0.12.5-linux-x64.tar.gz

# Ajout du fichier de dépendances package.json
#ADD package.json /app/

# Changement du repertoire courant
WORKDIR ~


# Ajout des sources
#ADD . /app/

# On expose le port 3000
EXPOSE 3000

# On partage un dossier de log
VOLUME /var/log

# On lance le serveur quand on démarre le conteneur
#CMD node server.js
