@echo off
color 2f
mode con: cols=40 lines=15
title WiFi�����ѯ
echo ���ڲ�ѯ���
setlocal enabledelayedexpansion
for /f "tokens=2* delims=:" %%i in ('netsh wlan show profiles') do (
    set str=%%i
    for /f "tokens=3* delims= " %%d in ('netsh wlan show profiles key^=clear name^="!str:~1!"^| findstr "�ؼ�����"') do (
        echo "!str:~1!"����Ϊ����%%d��
        echo "!str:~1!"����Ϊ����%%d��>>WiFi.txt
    )
)
echo �����ڽű�����Ŀ¼��WiFi.txt�ļ���
echo ������˳���ѯ
pause>nul