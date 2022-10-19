@echo off & mode con: cols=30 lines=5
color 0a
title anti-shutdown

echo  ษออออออออออออออออออออออออออป
echo  บ Anti-Shutdown lanc le : บ
echo  บ %date% … %time% บ
echo  ศออออออออออออออออออออออออออผ
:1
rem shutdown -a > NUL 2>&1
title %time%
goto 1