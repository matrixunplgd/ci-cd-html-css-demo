#Utilisation de l'image de Apache Officielle
FROM httpd:alpine

#Copie du fichier de configuration dans le conteneur
COPY . /usr/local/apache2/htdocs

#Expose le port 80
EXPOSE 80
