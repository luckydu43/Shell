#!/bin/bash
# Script à lancer sur demande sans besoin
# d'élévation de droits
# Il permet de changer la résolution de l'écran
# pour des résolutions personnalisées 
# bien supérieures. Dans mon cas je partais
# d'une 1600x900 pour finir sur une 2000x1125
# Cette modification n'est pas persistante,
# il convient de placer ce script sur le
# bureau, prêt à être lancé au démarrage

###############################################
#### DETERMINER LE PARAMETRAGE D'UNE RESOLUTION
###############################################
#gtf 2400 1350 60

###############################################
#### CREATION DES RESOLUTIONS #################
###############################################
xrandr --newmode "1680x945_60.00"  131.44  1680 1784 1960 2240  945 946 949 978  -HSync +Vsync
xrandr --newmode "1760x990_60.00"  144.65  1760 1864 2056 2352  990 991 994 1025  -HSync +Vsync
xrandr --newmode "1840x1035_60.00"  158.34  1840 1952 2152 2464  1035 1036 1039 1071  -HSync +Vsync
xrandr --newmode "1920x1080_60.00"  172.80  1920 2040 2248 2576  1080 1081 1084 1118  -HSync +Vsync
xrandr --newmode "2000x1125_60.00"  187.73  2000 2128 2344 2688  1125 1126 1129 1164  -HSync +Vsync
xrandr --newmode "2080x1170_60.00"  203.45  2080 2216 2440 2800  1170 1171 1174 1211  -HSync +Vsync
xrandr --newmode "2160x1215_60.00"  219.62  2160 2304 2536 2912  1215 1216 1219 1257  -HSync +Vsync
xrandr --newmode "2240x1260_60.00"  237.85  2240 2400 2640 3040  1260 1261 1264 1304  -HSync +Vsync
xrandr --newmode "2320x1305_60.00"  255.50  2320 2480 2736 3152  1305 1306 1309 1351  -HSync +Vsync
xrandr --newmode "2400x1350_60.00"  273.59  2400 2568 2832 3264  1350 1351 1354 1397  -HSync +Vsync

###############################################
#### CHARGEMENT DES RESOLUTIONS POUR L'ECRAN ##
###############################################
xrandr --addmode eDP-1-1 1680x945_60.00
xrandr --addmode eDP-1-1 1760x990_60.00
xrandr --addmode eDP-1-1 1840x1035_60.00
xrandr --addmode eDP-1-1 1920x1080_60.00
xrandr --addmode eDP-1-1 2000x1125_60.00
xrandr --addmode eDP-1-1 2080x1170_60.00
xrandr --addmode eDP-1-1 2160x1215_60.00
xrandr --addmode eDP-1-1 2240x1260_60.00
xrandr --addmode eDP-1-1 2320x1305_60.00
xrandr --addmode eDP-1-1 2400x1350_60.00

###############################################
#### RESOLUTION A APPLIQUER ###################
###############################################
#xrandr --output eDP-1-1 --mode 1600x900
#xrandr --output eDP-1-1 --mode 1680x945_60.00
#xrandr --output eDP-1-1 --mode 1760x990_60.00
#xrandr --output eDP-1-1 --mode 1840x1035_60.00
#xrandr --output eDP-1-1 --mode 1920x1080_60.00
xrandr --output eDP-1-1 --mode 2000x1125_60.00
#xrandr --output eDP-1-1 --mode 2080x1170_60.00
#xrandr --output eDP-1-1 --mode 2160x1215_60.00
#xrandr --output eDP-1-1 --mode 2240x1260_60.00
#xrandr --output eDP-1-1 --mode 2320x1305_60.00
#xrandr --output eDP-1-1 --mode 2400x1350_60.00

# Dès que les résolutions sont créées, cette
# commande permet de changer de résolution à 
# la volée.
#xrandr -s 2400x1350_60.00

###############################################
#### FIN ######################################
###############################################
exit
