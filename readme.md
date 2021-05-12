# Établissement scolaire

## Prérequis

- Avoir java avec le jdk et jre 15
- Avoir maven d'installé
- Avoir tomcat 7 d'installé et aucun server lancé
- Avoir phpMyAdmin d'installé et lancé 

## Installation

1. Aller dans le fichier DB et lancer le script de la base de données dans phpMyAdmin.
2. Dans votre dossier .m2 de maven avoir un profil avec comme properties :
   ```
   <db.url>jdbc:mysql://localhost:3306/etablissement_scolaire?serverTimezone=Europe/Berlin</db.url>
   <db.username>VOTRE USERNAME</db.username>
   <db.password>VOTRE PASSWORD</db.password>
   ```
   
3. Aller a la racine du projet dans \EtablissementScolaire\EtablissementScolaire-dao et dans le cmd lancer 
   ```
   mvn clean install -PVOTREPROFIL
   ```

4. Aller a la racine du projet dans \EtablissementScolaire et ouvrir un cmd et lancer la commande 
   ```
   mvn clean install
   ```
   
5. Aller dans le ficher \EtablissementScolaire\EtablissementScolaire-presentation dans le cmd 
   ```
   cd EtablissementScolaire-presentation
   ``` 
   
   Et lancer la commande 
   ```
   mvn tomcat7:run
   ```

## Lancement


1. Ouvrir votre navigateur préféré et tapper l'url http://localhost:8080/etablissementScolaire

   1.1 une fois dans le navigateur le login est directeur@gmail.com et le mot de passe est directeur
