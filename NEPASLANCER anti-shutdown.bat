@echo off & mode con: cols=30 lines=5
color 0a
title anti-shutdown

echo  ��������������������������ͻ
echo  � Anti-Shutdown lanc� le : �
echo  � %date% � %time% �
echo  ��������������������������ͼ
:1
rem shutdown -a > NUL 2>&1
title %time%
goto 1