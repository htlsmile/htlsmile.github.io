@echo off
color 2f
mode con: cols=40 lines=15
title WiFi密码查询
echo 正在查询结果
setlocal enabledelayedexpansion
for /f "tokens=2* delims=:" %%i in ('netsh wlan show profiles') do (
    set str=%%i
    for /f "tokens=3* delims= " %%d in ('netsh wlan show profiles key^=clear name^="!str:~1!"^| findstr "关键内容"') do (
        echo "!str:~1!"密码为：【%%d】
        echo "!str:~1!"密码为：【%%d】>>WiFi.txt
    )
)
echo 保存在脚本所在目录的WiFi.txt文件中
echo 任意键退出查询
pause>nul