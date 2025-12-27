@echo off
title The Network
color 0a
:Start_Net_Connect
cls
echo    Your username will be displayed to you. It will be
echo in I.P address format (example- 888.888.888). Let your
echo teammates know this address so they can use it contact
echo you.
pause
echo.
echo.
Net View
nbtstat -a //computername
echo.
echo    Go back to the game to learn to use the network.
echo NOTE: THIS interface is called 'the network'.
echo       Do not close it.
echo.
pause
start echo USE THE CODE FORMAT:   NET SEND "PARTNER_ADDRESS" "MESSAGE"
call "Elite Squad - Rescue Ops (Executor).bat"

