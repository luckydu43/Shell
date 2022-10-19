#!/bin/bash 

echo "~~~~ Modification des fichiers dans le cadre du module JMS pour Joomla"

#Variables

APACHE="apache"
DEBIAN="www-data"

WDIR=$PWD
echo "#### $PWD ####"
BASEDIR="var/www/html"
echo "#### $BASEDIR ####"
OLD_CHEMIN="/applications/site/joomla"
NEW_CHEMIN="/var/www/html/joomla"

OLD_CHEMIN_FULL="/applications/site/joomla/multisites"
NEW_CHEMIN_FULL="/var/www/html/joomla/multisites"

OLD_CHEMIN_INDEX="/applications/site/joomla"
NEW_CHEMIN_INDEX="/var/www/html/joomla"

OLD_IP="255.255.255.255"
NEW_IP="255.255.255.255"

OLD_IP_DIR="255.255.255.255/joomla/multisites"
NEW_IP_DIR="255.255.255.255/joomla/multisites"

echo "~~~~ vérification de l'existence du repertoire site sous appllications"
if [ ! -d "/$BASEDIR" ];then
  echo "creation du dossier /$BASEDIR";
  sudo mkdir /$BASEDIR
fi

while IFS=';' read site
do

	echo "##### SUPPRESSION DU " "$site" "#####"
	sudo rm -Rf /$BASEDIR/joomla/multisites/$site
    
	#### MASTER ####
	echo "~~~~ Suppression du ""$site" " dans le config_multisites.php du master ~~~~"
	sudo sed -i "s;array( 'url' => 'http:\/\/"$OLD_IP"\/joomla\/multisites\/"$site"', 'site_id' => '"$site"'),;;g " /$BASEDIR/joomla/multisites/config_multisites.php

done < $WDIR/listeSitesSupprJMS.csv

while IFS=';' read site
do

	OLD_HOST="IP:PORT"
	NEW_HOST="votreIP:votrePORT"

	OLD_USER="votreUser"
	NEW_USER="pf_"$site"_user"

	OLD_PWD="votrePwd"
	NEW_PWD="pf_"$site"_password"

	OLD_DIR_CONF="/applications/site/joomla"
	NEW_DIR_CONF="/var/www/html/joomla"
  
  echo "~~~~ modification des liens symbolique pour %s\n" "$site"
  echo "~~~~ Partie générale ~~~~"
  sudo ln -sfn /$BASEDIR/joomla/administrator /$BASEDIR/joomla/multisites/$site/administrator
  sudo ln -sfn /$BASEDIR/joomla/bin /$BASEDIR/joomla/multisites/$site/bin
  sudo ln -sfn /$BASEDIR/joomla/cli /$BASEDIR/joomla/multisites/$site/cli
  sudo ln -sfn /$BASEDIR/joomla/components /$BASEDIR/joomla/multisites/$site/components
  sudo ln -sfn /$BASEDIR/joomla/CONTRIBUTING.md  /$BASEDIR/joomla/multisites/$site/CONTRIBUTING.md 
  sudo ln -sfn /$BASEDIR/joomla/defines.php /$BASEDIR/joomla/multisites/$site/defines.php
  sudo ln -sfn /$BASEDIR/joomla/hello.php /$BASEDIR/joomla/multisites/$site/hello.php
  sudo ln -sfn /$BASEDIR/joomla/hello.txt /$BASEDIR/joomla/multisites/$site/hello.txt
  sudo ln -sfn /$BASEDIR/joomla/htaccess.txt /$BASEDIR/joomla/multisites/$site/htaccess.txt
  sudo ln -sfn /$BASEDIR/joomla/includes /$BASEDIR/joomla/multisites/$site/includes
  sudo ln -sfn /$BASEDIR/joomla/jaextmanager_data /$BASEDIR/joomla/multisites/$site/jaextmanager_data
  sudo ln -sfn /$BASEDIR/joomla/language /$BASEDIR/joomla/multisites/$site/language
  sudo ln -sfn /$BASEDIR/joomla/layouts /$BASEDIR/joomla/multisites/$site/layouts
  sudo ln -sfn /$BASEDIR/joomla/libraries /$BASEDIR/joomla/multisites/$site/libraries
  sudo ln -sfn /$BASEDIR/joomla/LICENSE.txt  /$BASEDIR/joomla/multisites/$site/LICENSE.txt 
  sudo ln -sfn /$BASEDIR/joomla/media /$BASEDIR/joomla/multisites/$site/media
  sudo ln -sfn /$BASEDIR/joomla/modules /$BASEDIR/joomla/multisites/$site/modules
  sudo ln -sfn /$BASEDIR/joomla/multisites /$BASEDIR/joomla/multisites/$site/multisites
  sudo ln -sfn /$BASEDIR/joomla/plugins /$BASEDIR/joomla/multisites/$site/plugins
  sudo ln -sfn /$BASEDIR/joomla/README.txt  /$BASEDIR/joomla/multisites/$site/README.txt 
  sudo ln -sfn /$BASEDIR/joomla/robots.txt /$BASEDIR/joomla/multisites/$site/robots.txt
  sudo ln -sfn /$BASEDIR/joomla/robots.txt.dist /$BASEDIR/joomla/multisites/$site/robots.txt.dist
  sudo ln -sfn /$BASEDIR/joomla/t3-assets /$BASEDIR/joomla/multisites/$site/t3-assets
  sudo ln -sfn /$BASEDIR/joomla/web.config.txt /$BASEDIR/joomla/multisites/$site/web.config.txt  
  
  echo "~~~~ Partie installation dir ~~~~"
  sudo ln -sfn /$BASEDIR/joomla/installation/COPYRIGHT /$BASEDIR/joomla/multisites/$site/installation/COPYRIGHT
  sudo ln -sfn /$BASEDIR/joomla/installation/CREDITS /$BASEDIR/joomla/multisites/$site/installation/CREDITS
  sudo ln -sfn /$BASEDIR/joomla/installation/INSTALL /$BASEDIR/joomla/multisites/$site/installation/INSTALL
  sudo ln -sfn /$BASEDIR/joomla/installation/LICENSES /$BASEDIR/joomla/multisites/$site/installation/LICENSES
  sudo ln -sfn /$BASEDIR/joomla/installation/application /$BASEDIR/joomla/multisites/$site/installation/application
  sudo ln -sfn /$BASEDIR/joomla/installation/cache /$BASEDIR/joomla/multisites/$site/installation/cache
  sudo ln -sfn /$BASEDIR/joomla/installation/configuration.php-dist /$BASEDIR/joomla/multisites/$site/installation/configuration.php-dist
  sudo ln -sfn /$BASEDIR/joomla/installation/controller /$BASEDIR/joomla/multisites/$site/installation/controller
  sudo ln -sfn /$BASEDIR/joomla/installation/favicon.ico /$BASEDIR/joomla/multisites/$site/installation/favicon.ico
  sudo ln -sfn /$BASEDIR/joomla/installation/form /$BASEDIR/joomla/multisites/$site/installation/form
  sudo ln -sfn /$BASEDIR/joomla/installation/helper /$BASEDIR/joomla/multisites/$site/installation/helper
  sudo ln -sfn /$BASEDIR/joomla/installation/html /$BASEDIR/joomla/multisites/$site/installation/html
  sudo ln -sfn /$BASEDIR/joomla/installation/language /$BASEDIR/joomla/multisites/$site/installation/language
  sudo ln -sfn /$BASEDIR/joomla/installation/localise.xml /$BASEDIR/joomla/multisites/$site/installation/localise.xml
  sudo ln -sfn /$BASEDIR/joomla/installation/model /$BASEDIR/joomla/multisites/$site/installation/model
  sudo ln -sfn /$BASEDIR/joomla/installation/response /$BASEDIR/joomla/multisites/$site/installation/response
  sudo ln -sfn /$BASEDIR/joomla/installation/sql /$BASEDIR/joomla/multisites/$site/installation/sql
  sudo ln -sfn /$BASEDIR/joomla/installation/template /$BASEDIR/joomla/multisites/$site/installation/template
  sudo ln -sfn /$BASEDIR/joomla/installation/view /$BASEDIR/joomla/multisites/$site/installation/view
  
  echo "~~~~ Partie CSS ~~~~"
  sudo ln -sfn /$BASEDIR/joomla/templates/purity_iii/local/css/themes/themeadt /$BASEDIR/joomla/multisites/$site/templates/purity_iii/local/css/themes/themeadt
  
  echo "~~~~ Partie config_multisite ~~~~"
  echo "~~~~ Modification du chemin ~~~~"
  sudo sed -i "s,"$OLD_CHEMIN_FULL","$NEW_CHEMIN_FULL",g" /$BASEDIR/joomla/multisites/$site/config_multisites.php
  echo "~~~~ Modification des IP ~~~~"
  sudo sed -i "s,"$OLD_IP_DIR","$NEW_IP_DIR",g" /$BASEDIR/joomla/multisites/$site/config_multisites.php
  
  echo "~~~~ Partie index ~~~~"
  sudo sed -i "s,"$OLD_CHEMIN_INDEX","$NEW_CHEMIN_INDEX",g" /$BASEDIR/joomla/multisites/$site/index.php
  sudo sed -i "s,"$OLD_CHEMIN_INDEX","$NEW_CHEMIN_INDEX",g" /$BASEDIR/joomla/multisites/$site/index2.php
  
  echo "~~~~ Partie configuration.php ~~~~"
  sudo sed -i "s,"$OLD_HOST","$NEW_HOST",g" /$BASEDIR/joomla/multisites/$site/configuration.php
  sudo sed -i "s,"$OLD_USER","$NEW_USER",g" /$BASEDIR/joomla/multisites/$site/configuration.php
  sudo sed -i "s,"$OLD_PWD","$NEW_PWD",g" /$BASEDIR/joomla/multisites/$site/configuration.php
  sudo sed -i "s,"$OLD_DIR_CONF","$NEW_DIR_CONF",g" /$BASEDIR/joomla/multisites/$site/configuration.php
  
  
  #### MASTER ####
  echo "~~~~ Ajout du site dans le config_multisites.php du master ~~~~"
  # on ajoute toujours après le 523rt
  sudo sed -i "s/'523rt'),/'523rt'), array( 'url' => 'http:\/\/"$NEW_IP"\/joomla\/multisites\/"$site"', 'site_id' => '"$site"'),/" /$BASEDIR/joomla/multisites/config_multisites.php
  
done < $WDIR/listeSitesAjoutJMS.csv

while IFS=';' read site
do
  
  echo "~~~~ modification des liens symbolique pour %s\n" "$site"
  echo "~~~~ Partie générale ~~~~"
  sudo ln -sfn /$BASEDIR/joomla/administrator /$BASEDIR/joomla/multisites/$site/administrator
  sudo ln -sfn /$BASEDIR/joomla/bin /$BASEDIR/joomla/multisites/$site/bin
  sudo ln -sfn /$BASEDIR/joomla/cli /$BASEDIR/joomla/multisites/$site/cli
  sudo ln -sfn /$BASEDIR/joomla/components /$BASEDIR/joomla/multisites/$site/components
  sudo ln -sfn /$BASEDIR/joomla/CONTRIBUTING.md  /$BASEDIR/joomla/multisites/$site/CONTRIBUTING.md 
  sudo ln -sfn /$BASEDIR/joomla/defines.php /$BASEDIR/joomla/multisites/$site/defines.php
  sudo ln -sfn /$BASEDIR/joomla/hello.php /$BASEDIR/joomla/multisites/$site/hello.php
  sudo ln -sfn /$BASEDIR/joomla/hello.txt /$BASEDIR/joomla/multisites/$site/hello.txt
  sudo ln -sfn /$BASEDIR/joomla/htaccess.txt /$BASEDIR/joomla/multisites/$site/htaccess.txt
  sudo ln -sfn /$BASEDIR/joomla/includes /$BASEDIR/joomla/multisites/$site/includes
  sudo ln -sfn /$BASEDIR/joomla/jaextmanager_data /$BASEDIR/joomla/multisites/$site/jaextmanager_data
  sudo ln -sfn /$BASEDIR/joomla/language /$BASEDIR/joomla/multisites/$site/language
  sudo ln -sfn /$BASEDIR/joomla/layouts /$BASEDIR/joomla/multisites/$site/layouts
  sudo ln -sfn /$BASEDIR/joomla/libraries /$BASEDIR/joomla/multisites/$site/libraries
  sudo ln -sfn /$BASEDIR/joomla/LICENSE.txt  /$BASEDIR/joomla/multisites/$site/LICENSE.txt 
  sudo ln -sfn /$BASEDIR/joomla/media /$BASEDIR/joomla/multisites/$site/media
  sudo ln -sfn /$BASEDIR/joomla/modules /$BASEDIR/joomla/multisites/$site/modules
  sudo ln -sfn /$BASEDIR/joomla/multisites /$BASEDIR/joomla/multisites/$site/multisites
  sudo ln -sfn /$BASEDIR/joomla/plugins /$BASEDIR/joomla/multisites/$site/plugins
  sudo ln -sfn /$BASEDIR/joomla/README.txt  /$BASEDIR/joomla/multisites/$site/README.txt 
  sudo ln -sfn /$BASEDIR/joomla/robots.txt /$BASEDIR/joomla/multisites/$site/robots.txt
  sudo ln -sfn /$BASEDIR/joomla/robots.txt.dist /$BASEDIR/joomla/multisites/$site/robots.txt.dist
  sudo ln -sfn /$BASEDIR/joomla/t3-assets /$BASEDIR/joomla/multisites/$site/t3-assets
  sudo ln -sfn /$BASEDIR/joomla/web.config.txt /$BASEDIR/joomla/multisites/$site/web.config.txt  
  
  echo "~~~~ Partie installation dir~~~~"
  sudo ln -sfn /$BASEDIR/joomla/installation/COPYRIGHT /$BASEDIR/joomla/multisites/$site/installation/COPYRIGHT
  sudo ln -sfn /$BASEDIR/joomla/installation/CREDITS /$BASEDIR/joomla/multisites/$site/installation/CREDITS
  sudo ln -sfn /$BASEDIR/joomla/installation/INSTALL /$BASEDIR/joomla/multisites/$site/installation/INSTALL
  sudo ln -sfn /$BASEDIR/joomla/installation/LICENSES /$BASEDIR/joomla/multisites/$site/installation/LICENSES
  sudo ln -sfn /$BASEDIR/joomla/installation/application /$BASEDIR/joomla/multisites/$site/installation/application
  sudo ln -sfn /$BASEDIR/joomla/installation/cache /$BASEDIR/joomla/multisites/$site/installation/cache
  sudo ln -sfn /$BASEDIR/joomla/installation/configuration.php-dist /$BASEDIR/joomla/multisites/$site/installation/configuration.php-dist
  sudo ln -sfn /$BASEDIR/joomla/installation/controller /$BASEDIR/joomla/multisites/$site/installation/controller
  sudo ln -sfn /$BASEDIR/joomla/installation/favicon.ico /$BASEDIR/joomla/multisites/$site/installation/favicon.ico
  sudo ln -sfn /$BASEDIR/joomla/installation/form /$BASEDIR/joomla/multisites/$site/installation/form
  sudo ln -sfn /$BASEDIR/joomla/installation/helper /$BASEDIR/joomla/multisites/$site/installation/helper
  sudo ln -sfn /$BASEDIR/joomla/installation/html /$BASEDIR/joomla/multisites/$site/installation/html
  sudo ln -sfn /$BASEDIR/joomla/installation/language /$BASEDIR/joomla/multisites/$site/installation/language
  sudo ln -sfn /$BASEDIR/joomla/installation/localise.xml /$BASEDIR/joomla/multisites/$site/installation/localise.xml
  sudo ln -sfn /$BASEDIR/joomla/installation/model /$BASEDIR/joomla/multisites/$site/installation/model
  sudo ln -sfn /$BASEDIR/joomla/installation/response /$BASEDIR/joomla/multisites/$site/installation/response
  sudo ln -sfn /$BASEDIR/joomla/installation/sql /$BASEDIR/joomla/multisites/$site/installation/sql
  sudo ln -sfn /$BASEDIR/joomla/installation/template /$BASEDIR/joomla/multisites/$site/installation/template
  sudo ln -sfn /$BASEDIR/joomla/installation/view /$BASEDIR/joomla/multisites/$site/installation/view
  
  echo "~~~~ Partie CSS ~~~~"
  sudo ln -sfn /$BASEDIR/joomla/templates/purity_iii/local/css/themes/themeadt /$BASEDIR/joomla/multisites/$site/templates/purity_iii/local/css/themes/themeadt
  
  echo "~~~~ Partie config_multisite ~~~~"
  echo "~~~~ Modification du chemin ~~~~"
  sudo sed -i "s,"$OLD_CHEMIN_FULL","$NEW_CHEMIN_FULL",g" /$BASEDIR/joomla/multisites/$site/config_multisites.php
  echo "~~~~ Modification des IP ~~~~"
  sudo sed -i "s,"$OLD_IP_DIR","$NEW_IP_DIR",g" /$BASEDIR/joomla/multisites/$site/config_multisites.php
  
  echo "~~~~ Partie index ~~~~"
  sudo sed -i "s,"$OLD_CHEMIN_INDEX","$NEW_CHEMIN_INDEX",g" /$BASEDIR/joomla/multisites/$site/index.php
  sudo sed -i "s,"$OLD_CHEMIN_INDEX","$NEW_CHEMIN_INDEX",g" /$BASEDIR/joomla/multisites/$site/index2.php
  
done < $WDIR/listeSitesModifJMS.csv

echo "~~~~ Modification du chemin du config_multisites.php ~~~~"
sudo sed -i "s,"$OLD_CHEMIN","$NEW_CHEMIN",g" /$BASEDIR/joomla/multisites/config_multisites.php
echo "~~~~ Modification des IP du config_multisites.php ~~~~"
sudo sed -i "s/"$OLD_IP"/"$NEW_IP"/g" /$BASEDIR/joomla/multisites/config_multisites.php

echo "~~~~ Changer propriétaire:groupe du joomla ~~~~"
sudo chown -Rf $APACHE:$APACHE /$BASEDIR/joomla

exit 0
