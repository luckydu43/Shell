'Installation du serveur Apache'
yum install httpd

'Problème de doublon du repository epel. 
 Les lignes suivantes permettent d identifier le problème : '
yum repolist all
cd etc/yum.repos.d
ls -l
cat epel.*
grep epel /etc/yum.repos.d/*

'Dans mon cas, il a fallu supprimer le repository epel dans le fichier suivant.
 Il était doublon avec le epel déclaré dans le decos.repo : '
vi epel.repo

'Il convient de télécharger les sources de la version de php au préalable.
https://www.php.net/downloads.php
Celle choisie ici est la php-7.2.20.tar.gz
On se connecte au serveur via filezilla (port 22) et on glisse cette archive dans le répertoire /home'
cd /home

'Les bonnes pratiques sous Linux recommandent les installations dans le répertoire /usr/local. Si on a les droits. On est root, ça tombe bien'
cp php-7.2.20.tar.gz /usr/local
cd /usr/local
'On vérifie bien que le fichier soit présent'
ls
'On le décompresse'
tar -zxvf php-7.2.20.tar.gz
'On vérifie que le dossier ait bien été crée'
ls
'On y entre'
cd php-7.2.20

'Avant d aller plus loin, il faut un compilateur C et la commande make. Cela est fourni par le paquet suivant'
sudo yum group install "Development Tools"

'les 2 lignes qui ont résolu le problème posé par une installation foireuse de libxml2'
yum reinstall libxml2
yum install libxml2-devel -y

'On peut se lancer dans l installation'
sh configure
make
make install

'On efface les bêtises'
cd ..
rm php-7.2.20.tar.gz
cd /
rm -rf home
'Le répertoire home n est pas effaçable. Vous ne supprimez donc que le contenu'

'Check des versions'
php -v
httpd -version

'Si ce guide ne vous parait pas assez clair, en voici un autre. La légende ne dit pas qu il soit plus simple à mettre en oeuvre :
https://www.tecmint.com/install-and-compile-php-7-on-centos-7-and-debian-8/'