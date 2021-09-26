:: *******Begin Comment**************
::
:: @description     This program attempts to wake up the computer through the Asuswrt-Merlin router.
:: @author          htlsmile
:: @date            2021/09/25
::
:: *******End   Comment**************

@echo off

set router_username=htlsmile
set router_ip=172.23.1.1
set mac_address=98:EE:CB:B1:C5:07

title WakeOnLan
color 1F
chcp 437 >nul
echo.
echo "  _    _ _______ _       _____ __  __ _____ _      ______ 
echo " | |  | |__   __| |     / ____|  \/  |_   _| |    |  ____|
echo " | |__| |  | |  | |    | (___ | \  / | | | | |    | |__   
echo " |  __  |  | |  | |     \___ \| |\/| | | | | |    |  __|  
echo " | |  | |  | |  | |____ ____) | |  | |_| |_| |____| |____ 
echo " |_|  |_|  |_|  |______|_____/|_|  |_|_____|______|______|
echo "                                                          
echo "                                                          
echo.

:Ping

echo.
echo        Try connecting to the router[%router_ip%]...
echo.
ping -n 1 %router_ip% >nul

:: 在批处理程序中使用 ERRORLEVEL 值时，必须按降序列出它们。
:: https://docs.microsoft.com/zh-cn/windows-server/administration/windows-commands/choice#remarks

:: if 与 ERRORLEVEL 的用法
:: https://docs.microsoft.com/zh-cn/windows-server/administration/windows-commands/if

if ERRORLEVEL 1 goto NotConnected
if ERRORLEVEL 0 goto Connected

:NotConnected

color 4F
echo.
echo        Router[%router_ip%] Unreachable !
echo.
goto ExitCmd

:Connected

color 2F
echo.
echo        Router[%router_ip%] Reachable !
echo.
echo.
echo        Wake up MAC[%mac_address%]
echo.
ssh -l %router_username% %router_ip% "/usr/sbin/ether-wake -i br0 -b %mac_address%; exit"
echo.
echo        Wake up complete!
echo.
goto ExitCmd

:ExitCmd
timeout /T 5
exit