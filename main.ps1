mvn -f C:\Users\33664\Desktop\Ensup\M1\Info\EtablissementScolaire\EtablissementScolaire\pom.xml clean package -Ptest
Copy-Item -Path C:\Users\33664\Desktop\Ensup\M1\Info\EtablissementScolaire\EtablissementScolaire\EtablissementScolaire-presentation\target\EtablissementScolaire-presentation-1.0-SNAPSHOT.war -Destination C:\apache-tomcat-9.0.43\webapps\ -PassThru