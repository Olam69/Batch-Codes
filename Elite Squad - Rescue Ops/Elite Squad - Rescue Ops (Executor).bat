@echo off
title Elite Squad - Rescue Ops (Executor)
color 0a
:Start_Net_Connect
cls
echo    Whenever you need to share an Intel with your partner(s),
echo go to The Network and type in this format:
echo.
echo       net send 'username of that partner' 'the message'
echo.
echo NOTE: Type without quotation (' ') marks.
echo.
echo Tip: You might want to write the above code down. The game
echo      will not come back to this page.
pause
goto Missions_Executor_Mode

:Missions_Executor_Mode
cls
echo         _Executor Mode_
echo 1. Mission 1
echo 2. Mission 2
echo 3. Mission 3
echo 4. Mission 4
echo 5. Mission 5
echo 6. Mission 6
echo 7. Mission 7
echo 8. Mission 8
echo.
set /p answer=
if %answer%==1 goto Mission_1_Exe_Md
if %answer%==2 goto Mission_2_Exe_Md
if %answer%==3 goto Mission_3_Exe_Md
if %answer%==4 goto Mission_4_Exe_Md
if %answer%==5 goto Mission_5_Exe_Md
if %answer%==6 goto Mission_6_Exe_Md
if %answer%==7 goto Mission_7_Exe_Md
if %answer%==8 goto Mission_8_Exe_Md

:Mission_1_Exe_Md
cls
echo         _Mission 1_
echo 




    