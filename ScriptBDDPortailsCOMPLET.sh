#!/bin/bash 
echo "PROVISION BDD"

#parametres administrateur
DBPASSWD="password"
DBUSER="root"

BASEDIR=$PWD

while IFS=';' read DBNAMESITE
do
  printf " creation de la base  %s\n" pf_"$DBNAMESITE"_jms

  mysql -u$DBUSER -p$DBPASSWD -e "CREATE DATABASE IF NOT EXISTS pf_"$DBNAMESITE"_jms DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci"

  printf " creation du DBUSER pour %s\n" "$DBNAMESITE"
  mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON pf_"$DBNAMESITE"_jms.* TO 'pf_"$DBNAMESITE"_user'@'%' IDENTIFIED BY 'pf_"$DBNAMESITE"_password' WITH GRANT OPTION"
  mysql -u$DBUSER -p$DBPASSWD -e "GRANT ALL PRIVILEGES ON pf_"$DBNAMESITE"_jms.* TO 'pf_"$DBNAMESITE"_user'@'localhost' IDENTIFIED BY 'pf_"$DBNAMESITE"_password' WITH GRANT OPTION"

  mysql -u$DBUSER -p$DBPASSWD -e "flush privileges"

  echo " creation du schema  %s\n pf_"$DBNAMESITE"_jms"
  mysql -u$DBUSER -p$DBPASSWD pf_"$DBNAMESITE"_jms < $DBNAMESITE.sql 
done < $BASEDIR/listeSitesBDD.csv
sudo systemctl restart mysqld
exit 0
