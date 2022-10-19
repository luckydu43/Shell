#!/bin/bash 

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~~~~ Installation des portails Internet V3 créés en Joomla Multi_sites"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#####################################################################
#ICI : changer ces variables selon la situation
#   |      |      |      |      |      |      |      |      |      |   
#   |      |      |      |      |      |      |      |      |      |   
#  \./    \./    \./    \./    \./    \./    \./    \./    \./    \./

#Nouvelle IP du serveur HTTP
NEW_IP="255.255.255.255"
#Nouvelle URL du serveur HTTP
NEW_URL="url.fr"
#groupe "apache" pour les fichiers lus par httpd sous CentOS
#Mettre "www-data" pour Debian
GROUPE_HTTPD="apache"
#IP de la base de données. Mettre localhost ou 127.0.0.1 si la BDD
#est sur le même serveur que le serveur HTTP
NEW_IP_BDD="255.255.255.254"
#Port de la base de données.
NEW_PORT_BDD="12345"

#  /'\    /'\    /'\    /'\    /'\    /'\    /'\    /'\    /'\    /'\  
#   |      |      |      |      |      |      |      |      |      |   
#   |      |      |      |      |      |      |      |      |      |   
#####################################################################

#Repertoire où sont places ce script et le fichier portails-intradef.tar.gz
NEW_CHEMIN=$PWD

#Anciens paramètres
OLD_CHEMIN="/path/joomla"
OLD_IP="255.255.255.255"
OLD_IP_BDD="255.255.255.254"
OLD_PORT_BDD="12345"

#Test de la configuration
touch supprime_moi
if [ ! $? -eq 0 ]
then
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "######################################################################"
	echo "######################################################################"
	echo "#### Erreur : Aucun accès en écriture dans ce répertoire ! ###########"
	echo "####          Utilisez un compte disposant de privilèges élevés. #####"
	echo "######################################################################"
	echo "######################################################################"
    exit 0
fi
rm -rf supprime_moi
echo "~~~~ Accès en écriture : OK"

echo "~~~~ Décompression des fichiers sur le serveur"
echo "~~~~ Ceci prend quelques minutes..."
tar -zxf joomla.tar.gz

echo "~~~~ Modifications pour le portail parent : chemins et IP"
#Mise à jour des chemins et des IP dans le fichier configuration.php du parent
sudo sed -i "s,"$OLD_IP_BDD","$NEW_IP_BDD",g" $NEW_CHEMIN/configuration.php
sudo sed -i "s,"$OLD_PORT_BDD","$NEW_PORT_BDD",g" $NEW_CHEMIN/configuration.php
sudo sed -i "s,"$OLD_CHEMIN","$NEW_CHEMIN",g" $NEW_CHEMIN/configuration.php
#Prise en compte de la demande de renommer oldschema en newschema
sudo sed -i "s,oldschema,newschema,g" $NEW_CHEMIN/configuration.php
#Mise à jour des chemins et des IP dans le fichier config_multisites.php global
sudo sed -i "s,"$OLD_CHEMIN","$NEW_CHEMIN",g" $NEW_CHEMIN/multisites/config_multisites.php
sudo sed -i "s#"$OLD_IP"#"$NEW_IP"#g" $NEW_CHEMIN/multisites/config_multisites.php
sudo sed -i "s#OLDURL#"$NEW_URL"#g" $NEW_CHEMIN/multisites/config_multisites.php

echo "~~~~ Modifications pour tous les portails : liens symboliques, chemins et IP"
echo "~~~~ Ceci prend quelques dizaines de secondes..."
#Ajout/Modification des liens symboliques pour chaque sous-portail
cd $NEW_CHEMIN/multisites

liste_portails=`ls`
for portail in $liste_portails
do
	#On revient au repertoire racine des sous-portails
	cd $NEW_CHEMIN/multisites
	#On ouvre le repertoire racine du sous-portail concerne par la boucle for
	#En cas "d'ouverture d'un fichier", l'erreur n'apparaitra pas mais elle 
	#sera bien traitee dans la suite de ce script
	cd $portail > /dev/null 2>&1
	#On extrait le nom seul du repertoire sans son arborescence complète
	path=${PWD##*/}
	#SI LE NOM DU DOSSIER COURANT EST LE NOM DU PORTAIL PARCOURU, on entre
	#La boucle etant alimentee par un ls, cela evite la lecture des fichiers.
	#Nous ne voulons ici que des dossiers, repertoires racine des sous-portails
    if [ $path == $portail ]
    then
		#Modification des liens symboliques
		sudo ln -sfn $NEW_CHEMIN/administrator $NEW_CHEMIN/multisites/$portail/administrator
		sudo ln -sfn $NEW_CHEMIN/bin $NEW_CHEMIN/multisites/$portail/bin
		sudo ln -sfn $NEW_CHEMIN/cli $NEW_CHEMIN/multisites/$portail/cli
		sudo ln -sfn $NEW_CHEMIN/components $NEW_CHEMIN/multisites/$portail/components
		sudo ln -sfn $NEW_CHEMIN/CONTRIBUTING.md  $NEW_CHEMIN/multisites/$portail/CONTRIBUTING.md
		sudo ln -sfn $NEW_CHEMIN/defines.php $NEW_CHEMIN/multisites/$portail/defines.php
		sudo ln -sfn $NEW_CHEMIN/hello.php $NEW_CHEMIN/multisites/$portail/hello.php
		sudo ln -sfn $NEW_CHEMIN/hello.txt $NEW_CHEMIN/multisites/$portail/hello.txt
		sudo ln -sfn $NEW_CHEMIN/htaccess.txt $NEW_CHEMIN/multisites/$portail/htaccess.txt
		sudo ln -sfn $NEW_CHEMIN/includes $NEW_CHEMIN/multisites/$portail/includes
		sudo ln -sfn $NEW_CHEMIN/jaextmanager_data $NEW_CHEMIN/multisites/$portail/jaextmanager_data
		sudo ln -sfn $NEW_CHEMIN/language $NEW_CHEMIN/multisites/$portail/language
		sudo ln -sfn $NEW_CHEMIN/layouts $NEW_CHEMIN/multisites/$portail/layouts
		sudo ln -sfn $NEW_CHEMIN/libraries $NEW_CHEMIN/multisites/$portail/libraries
		sudo ln -sfn $NEW_CHEMIN/LICENSE.txt  $NEW_CHEMIN/multisites/$portail/LICENSE.txt
		sudo ln -sfn $NEW_CHEMIN/media $NEW_CHEMIN/multisites/$portail/media > /dev/null 2>&1
		sudo ln -sfn $NEW_CHEMIN/modules $NEW_CHEMIN/multisites/$portail/modules
		sudo ln -sfn $NEW_CHEMIN/multisites $NEW_CHEMIN/multisites/$portail/multisites
		sudo ln -sfn $NEW_CHEMIN/plugins $NEW_CHEMIN/multisites/$portail/plugins
		sudo ln -sfn $NEW_CHEMIN/README.txt  $NEW_CHEMIN/multisites/$portail/README.txt
		sudo ln -sfn $NEW_CHEMIN/robots.txt $NEW_CHEMIN/multisites/$portail/robots.txt
		sudo ln -sfn $NEW_CHEMIN/robots.txt.dist $NEW_CHEMIN/multisites/$portail/robots.txt.dist
		sudo ln -sfn $NEW_CHEMIN/t3-assets $NEW_CHEMIN/multisites/$portail/t3-assets
		sudo ln -sfn $NEW_CHEMIN/web.config.txt $NEW_CHEMIN/multisites/$portail/web.config.txt
		sudo ln -sfn $NEW_CHEMIN/templates/purity_iii/local/css/themes/themeadt $NEW_CHEMIN/multisites/$portail/templates/purity_iii/local/css/themes/themeadt
		#Mise à jour des chemins et des IP dans le fichier config_multisites.php
		sudo sed -i "s,"$OLD_CHEMIN","$NEW_CHEMIN",g" $NEW_CHEMIN/multisites/$portail/config_multisites.php
		#Mise à jour des chemins dans les fichiers index.php et index2.php
		sudo sed -i "s,"$OLD_CHEMIN","$NEW_CHEMIN",g" $NEW_CHEMIN/multisites/$portail/index.php
		sudo sed -i "s,"$OLD_CHEMIN","$NEW_CHEMIN",g" $NEW_CHEMIN/multisites/$portail/index2.php
		#Mise à jour des chemins et des IP dans le fichier configuration.php
		sudo sed -i "s,"$OLD_IP_BDD","$NEW_IP_BDD",g" $NEW_CHEMIN/multisites/$portail/configuration.php
		sudo sed -i "s,"$OLD_PORT_BDD","$NEW_PORT_BDD",g" $NEW_CHEMIN/multisites/$portail/configuration.php
		sudo sed -i "s,"$OLD_CHEMIN","$NEW_CHEMIN",g" $NEW_CHEMIN/multisites/$portail/configuration.php		
		#Prise en compte de la demande de renommer oldschema en newschema
		sudo sed -i "s,oldschema,newschema,g" $NEW_CHEMIN/multisites/$portail/configuration.php
	fi
done

echo "~~~~ Changer proprietaire:groupe des fichiers de tous les portails"
echo "~~~~ Ceci prend quelques secondes..."
sudo chown -Rf $GROUPE_HTTPD:$GROUPE_HTTPD $NEW_CHEMIN

sudo ln -sfn $NEW_CHEMIN $NEW_CHEMIN/multisites/parent
sudo ln -sfn $NEW_CHEMIN $NEW_CHEMIN/multisites/master

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~~~~ Fin de l'installation ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
exit 0
