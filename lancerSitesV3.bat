@echo off
title Script de d�routage des IPs sniffeuses de Windows 10
color 0a
:1
echo.
echo ������������������������������������������������������ͻ
echo �                                                      �
echo � Script de lancement des sites Internet V3 Joomla JMS �
echo �                                                      �
echo ������������������������������������������������������ͼ
echo. & pause>nul

REM si le fichier n'existe pas, il y a une lev�e d'exception.
if not exist listeSitesV3.txt (goto erreurFichier)

REM Boucle for parcourant le fichier des sites. Chaque ligne du fichier
REM est envoy�e � la m�thode lancementSite.
for /f "delims=" %%i in ('type listeSitesV3.txt') do call :lancementSite %%i
goto :fin

REM M�thode permettant d'ouvrir une fen�tre Mozilla correspondant au site en param�tre.
:lancementSite
SET site=%1
echo  %site%...
start "%site%" D:\programs\portable\FirefoxPortable61\App\Firefox64\firefox.exe -new-window http://221.11.149.146/fusionJoomla/multisites/%site%/index.php/fr/
goto :eof

REM Lev�e d'exception en cas d'erreur de lecture du fichier.
:erreurFichier
echo.
echo Le fichier des noms de site est introuvable. 
:fin
echo.

echo ����������������������������������������������������������������ͻ
echo �                                                                �
echo �Appuyez sur une touche pour stopper toutes les instances Firefox�
echo �                                                                �
echo ����������������������������������������������������������������ͼ & pause>nul
taskkill /im firefox.exe /f
cls
goto 1
