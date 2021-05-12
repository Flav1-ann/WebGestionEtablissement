# Établissement scolaire

## Prérequis

- Avoir java avec le jdk et jre 15
- Avoir maven d'installé
- Avoir tomcat 7 d'installé et aucun server lancé
- Avoir phpMyAdmin d'installé et lancé 

## Installation

1. Aller dans le fichier DB et lancer le script de la base de données dans phpMyAdmin.
2. Aller EtablissementScolaire-dao/src/main/java/eu/ensup/etablissementscolaire/BaseDao.java et modifier vos identifiants de connexion this.login avec votre login et this.password avec votre password
3. Aller a la racine du projet dans \EtablissementScolaire et ouvrir un cmd et lancer la commande "mvn clean install"
4. Aller dans le ficher \EtablissementScolaire\EtablissementScolaire-presentation dans le cmd "cd EtablissementScolaire-presentation" si vous êtes dans \EtablissementScolaire
   et lancer la commande "mvn tomcat7:run"

## Lancement


1. Ouvrir votre navigateur préféré et tapper l'url "localhost:8080/etablissementScolaire"

   1.1 une fois dans le navigateur le login est directeur@gmail.com et le mot de passe est directeur
