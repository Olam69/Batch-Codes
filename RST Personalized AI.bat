@echo off
color 0a
title R.S.T Personalised

:skipper
set music=0
goto Home

:start
set /a greeting=%random%
if %greeting% gtr 6 goto start
if %greeting% lss 1 goto start
if %greeting%==1 goto for_1
if %greeting%==2 goto for_2
if %greeting%==3 goto for_3
if %greeting%==4 goto for_4
if %greeting%==5 goto for_5
if %greeting%==6 goto for_6
:for_1
cls
echo Welcome boss!
set /p answer=~ 
goto Home
:for_2
cls
echo Hello boss!
set /p answer=~ 
goto Home
:for_3
cls
echo Jason online, sir.
set /p answer=~ 
goto Home
:for_4
cls
echo Jason, up!
set /p answer=~ 
goto Home
:for_5
cls
echo Good to see you, sir.
set /p answer=~ 
goto Home
:for_6
cls
echo How are you today, boss?
set /p answer=~ 
goto Home



:Home

REM %music% at default is 0, when you visit sublime text, it then sets to 3
if %music%==3 goto Play_Ask

cls
echo These are your favourite apps, boss. Fresh and ready as always.
echo   1. Chrome
echo   2. Notepad
echo   3. Sublime Text
echo   4. Code::Blocks
echo   5. File Explorer
echo   6. Desktop Apps
echo   7. Groove Music
echo   8. Utilities
set /p answer=~ 


if %answer%==1 (
  cls
  echo Loading Google Chrome...
  start chrome.exe
  echo Done!
  pause
  goto Home
)

if %answer%==2 (
  cls
  echo Loading Notepad...
  start notepad.exe
  goto Home
)

if %answer%==3 (
  cls
  echo Sublime Text on the way...
  "C:\Program Files\Sublime Text\sublime_text.exe"
  set music=3
  pause
  goto Home
)

if %answer%==4 (
  cls
  echo Launching CODE::BLOCKS
  "C:\Program Files\CodeBlocks\codeblocks.exe"
  echo Enjoy
  set music=3
  goto Home
)

if %answer%==5 (
  cls
  echo Loading File Explorer...
  start explorer.exe
  goto Home
)

if %answer%==6 (
  cls
  echo Showing desktop apps and folders...
  start C:\Users\HP\Desktop
  echo Here you go.
  pause
  goto Home
)

if %answer%==7 (
  echo Groove Music on the way...
  "C:\Users\HP\Desktop\Groove Music.lnk"
  echo Task complete!
  pause
  goto Home
)

if %answer%==8 goto Utilities



:Play_Ask
set music=0
cls
echo Would you like me to play you a little something as you work?
echo   1. Yes, please.
echo   2. No need.
set /p answer=~ 
if %answer%==1 goto Play
if %answer%==2 goto Home

:Play
"C:\Users\HP\Music\WHISPERS OF THE MIND Full Song Mohenjo Daro Hrithik Roshan, Pooja Hegde A R Rahman.mp3"
goto Home



:Utilities
cls
echo   1. Running Apps
echo   2. Connect Wifi
echo   3. Disconnect Wifi
echo   4. Keys
echo   0. Home
set /p answer=~ 
if %answer%==1 goto Tasks
if %answer%==2 goto Conn_Wifi
if %answer%==3 goto DisConn_Wifi
if %answer%==4 goto Keys
if %answer%==0 (
  goto Home
) else goto Utilities


:Tasks
cls
tasklist
echo.
echo =================================================================================
echo.
echo Would you like to terminate any of the above listed process? (Critical warning level... DO NOT terminate ANY key process...)
echo   1. Yes
echo   2. Home
set /p answer= ~ 
if %answer%==1 (
  echo %answer%
  set /p task=Task Process ID - PID ~ 
  echo %task%
  taskkill /PID %task%
  echo %task% killed
  pause
  goto Home
)
if %answer%==2 (
 goto Home
) else goto Home


:Conn_Wifi
cls
echo AVAILABLE NETWORKS
netsh wlan show networks
echo (0 to cancel) Connect to (Wifi name):
set /p name=~ 
if %name%==0 (
  pause
  goto Utilities
) else (
  netsh wlan connect name="%name%"
  echo Start Chrome? [y/n]
)
set /p answer=~ 
if %answer%==y (
  start chrome.exe
  echo Chrome is on the way sir!
  pause
  goto Utilities
) else goto Utilities




:DisConn_Wifi
cls
netsh wlan disconnect
pause
goto Utilities


:Keys
cls
set /p pass=Input password:  
if %pass%==ConnConnect (
  cls
  netsh wlan show profiles
  echo =================================================================================
  echo Input network name
  set /p name=~ 
  netsh wlan show profiles name="%name%" key=clear
  pause
  goto Utilities
) else goto Utilities





