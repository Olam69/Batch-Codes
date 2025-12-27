@echo off
title Elite Squad - Rescue Ops
color 0a

:Main_Menu
cls
echo    _Main Menu_
echo 1. Start
echo 2. Credits
echo 3. Exit
echo.
set /p answer=
if %answer%==1 goto Start
if %answer%==2 goto Credits
if %answer%==3 goto Exit

:Credits
cls
echo        _Credits_
echo      As usual, all credits go to the Creator of all.
echo Elite Squad - Rescue Ops was only made by R.S.T and its team.
echo.
echo Big shout out to all our fans. We really love you all guys.
echo                    -Saberedowo Toyeeb. R.S.T Studio. Its crew.
echo And to our new fans, don't miss out our other games:
echo ---Elite Squad - The Elite Hacker
echo ---Lost in Sinora
echo ---The Mist
echo and yes,
echo ---Taken
echo.
set /p answer=
goto Main_Menu

:Exit
cls
echo Sure to exit (y/n)?
set /p answer=
if %answer%==y goto Exit_Y
if &answer%==n goto Main_Menu
:Exit_Y
echo Exiting Elite Squad - Rescue Ops now.
pause
exit /b

:Start
cls
echo 1. Go solo
echo 2. Team mode
echo 3. Main menu
echo.
set /p answer=

:Team_Mode
cls
echo         _Steps for Team Mode_
echo.
echo       _Please make sure to read_
echo.
echo    1) Connect the computers to the same local network.
echo It can be the same mobile hotspot or a router.
echo.
echo  (Don't worry. No mobile data is required).
echo    2) On the next page, each one of you is to select a
echo different character. You will come across three
echo choices, this means that you will need three computers.
echo  (Again, don't be afraid. Two can play)
echo.
echo    3) Are your computers connected? Type 'next' to
echo continue.
echo.
set /p answer=

:Character_Select
cls
echo         _Character Select_
echo  Type the name of who you would like to play as;
echo.
echo     -Executor. 'Ethan'
echo    As the executor, you get to always have the fun
echo on the field. (That is when fun doesn't mean death.
echo But, well...). Battles and team coordination is
echo yours, captain.
echo.
echo     -Code_Master. 'Peter'
echo    The team's hacker. Bypass any security. Infiltrate
echo any database. Break and make codes. Anything 21st
echo century is yours to command.
echo.
echo     -Surveillance. 'Alex'
echo    You are the team's eagle eyes. You need to stay
echo awake. Stay sharp. Take care of troublesome movements.
echo And yes. How would you like to use a sniper?
echo
set /p answer=
if %answer%==Executor goto Executor
if %answer%==executor goto Executor
if %answer%==1 goto Executor
if %answer%==Ethan goto Executor
if %answer%==ethan goto Executor
if %answer%==Code_Master goto Code_Master
if %answer%==code_master goto Code_Master
if %answer%==2 goto Code_Master
if %answer%==Peter goto Code_Master
if %answer%==peter goto Code_Master
if %answer%==Surveillance goto Surveillance
if %answer%==surveillance goto Surveillance
if %answer%==3 goto Surveillance
if %answer%==Alex goto Surveillance
if %answer%==alex goto Surveillance
else(
echo.
echo  Invalid input.
echo You need to type a name. Nothing else.
pause
goto Character_Select)

:Executor
call "The Network - Ethan.bat"
exit /b

:Code_Master
start "codemaster.bat"
exit /b

:Surveillance
start "surveillance.bat"
exit /b


::This is where this script ends.
::We proceed to the chosen character's script now.



    