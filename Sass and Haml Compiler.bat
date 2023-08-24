@echo off
title Sass Watcher - Sass Compiler - Haml Compiler - By R.S.T



REM HAML
rem
REM haml render input.haml > output.html


REM SASS
rem
REM sass --watch input.sass:output.css		=		Watch files for changes.
REM sass --watch input-dir:output-dir		=		Watch directories for changes.
REM sass --update same as above two		=		Instant update without watch



:Menu
cls
echo =======================================================================================
echo =============== Sass Watcher - Sass Compiler - Haml Compiler - By R.S.T ===============
echo =======================================================================================
echo.
echo 1. Watch Sass
echo 2. Compile Sass
echo 3. Compile Haml
echo 4. Help: Interactive
echo 0. Exit
set /p answer=~ 

if %answer%==1 (
	set sass_action=Watch
	set sass_action_name=Watch
	goto Action_Sass
)
if %answer%==2 (
	set sass_action=Update
	set sass_action_name=Compile
	goto Action_Sass
)
if %answer%==3 goto Compile_Haml
if %answer%==4 goto Help
if %answer%==0 goto Exit


:Exit
echo Sure to quit (y/n)?
set /p answer=~ 
if %answer%==y (exit /b) else goto Menu 



REM ================= Sass ==================

:Action_Sass
cls
echo ====================================
echo =============== Sass ===============
echo ====================================
REM %sass_action% means Watch or Upadate. So when you see %sass_action% Sass File, pronounce it either as Watch Sass File or Update Sass File. Etc.
echo 1. %sass_action_name% Sass file
echo 2. %sass_action_name% Sass folder
echo 0. Cancel
set /p answer=~ 
if %answer%==1 set to_action=file
if %answer%==2 set to_action=folder
if %answer%==0 goto Menu

:Start_Sass_Action
cls
echo Paste absolute or relative [drive:\path] i.e the folder itself
if %to_action%==folder echo (add no brackets):
if %to_action%==file echo where file is (add no brackets):
set /p pth=~ 
if %to_action%==file (
	echo.
	echo Paste [filename.filextenstion] i.e the file itself ^(add no brackets^):
	set /p filenme=~ 
	echo.
	pause
)

:Save_Into
set diff_pth=0
cls
echo 1. Save into same folder
echo 2. Save into different folder
echo 0. Cancel
set /p answer=~ 

if %answer%==1 goto Save_Sass
if %answer%==2 (
	set diff_pth=1
	cls
	echo Paste absolute or relative [drive:\path] to save to
	set /p new_pth=~ 
)
if %answer%==0 goto Menu


:Save_Sass
cls
echo Sass may force-close this terminal upon execution. When this happens, it does not mean the command was unsuccessful. Simply check folder for changes.
cls
pause
cls
if %to_action%==file goto To_Action_File
if %to_action%==folder goto To_Action_Folder

:To_Action_File
	echo Save %filenme% as (remember to add the extension you want (~.css)) [0 to cancel]
	set /p new_filenme=~ 
	if %new_filenme%==0 goto Menu
	if %diff_pth%==0 sass --%sass_action% "%pth%\%filenme%":"%pth%\%new_filenme%"
	if %diff_pth%==1 sass --%sass_action% "%pth%\%filenme%":"%new_pth%\%new_filenme%"

:To_Action_Folder
	if %diff_pth%==0 sass --%sass_action% "%pth%":"%pth%"
	if %diff_pth%==1 sass --%sass_action% "%pth%":"%new_pth%"





pause
goto Menu






REM ================= Haml ==================


:Compile_Haml
cls
echo ===============================================
echo =============== Haml ^| Compile ===============
echo ===============================================
echo.
echo Paste [drive:\path\filename.file_extension] of the HAML file (add no brackets):
set /p haml_file=~ 
echo.
echo Paste [drive:\path\filename.file_extension] to save the above file as:
set /p haml_new=~ 

echo.
echo Haml may force-close terminal upon execution. When this happens, it does not mean the command was unsuccessful. Simply check folder for changes.
echo.

pause
cls

haml render "%haml_file%" > "%haml_new%"


goto Menu










REM ================= Help Section ==================


:Help
cls
echo ============================================
echo =============== Help Section ===============
echo ============================================
echo.
echo ____ Sass is a CSS framework which stands for Sytantictally Awesome Stylesheet ____
echo With Sass you have not X2 power of basic CSS... you have over X4 the superpower of things you could never do with raw CSS syntaxes!
echo Be sure to read more about it online...
echo.
pause

:Help_Start
cls
echo ==========================================
echo =============== Help Start ===============
echo ==========================================
echo Step 1: Installation
echo Do you have Sass installed (y/n)? [0 to cancel]
set /p answer=~ 
if %answer%==y goto Help_Continue
if %answer%==n goto Help_Install_Sass
if %answer%==0 goto Menu


:Help_Continue
cls
echo Step 2: Checking Installation
echo If you see a version number on the next window, then your Sass is installed correctly
start sass -v
echo.
echo If you see a version number on the popped window;
echo 1. Continue; else
echo 2. Go back to install
echo 0. Cancel
set /p answer=~ 
if %answer%==1 goto Help_Continue_2
if %answer%==2 goto Help_Start
if %answer%==0 goto Menu

:Help_Continue_2
cls
echo Step 3: Solutions
echo Since Sass is correctly installed on your machine, then here are some things that might be the cause of the program not working
echo.
pause
echo.
echo (01) - Your inputs are wrong:
echo      + Make sure to check that your input are very correct while following the Sass prompts in this program
echo      + These include your filepath, your filename, and (dot) your file_extension; and the path, name and (dot) extension you want to save the resulting output file with
echo.
echo      + BEST TO COPY AND PASTE DIRECTLY FROM YOUR FILE EXPLORER
echo.
pause
echo.
echo (02) - You are adding extra apostrophes:
echo      + Unless your filepath or filename contain apostrophes, you have ZERO need to add any
echo      + Neither at the start, nor at the end
echo.
echo      + NO NEED TO ADD EXTRA APOSTROPHES IF THEY ARE NOT IN YOUR FILE
echo.
pause
echo.
echo (03) - Addition
echo      + This will be the last resort, but if you are very sure you are doing everything right...
echo.
echo      + RUN AS ADMIN
echo.
pause
echo.
echo (04) - Hey hurray^! No fourth^!
echo.
pause
goto Menu



:Help_Install_Sass
cls
echo This part has been particularly streamlined to follow Ruby but...
pause
echo You can definitely install Sass using NodeJS npm
echo --------
echo The drawback of this though, as I last read on the official Sass website, is that it may be slightly slower
echo .
echo 1. Install once - Ruby gem
echo 2. Install once - NodeJS npm
echo 3. Embed Option - Sass CDN
echo 0. Cancel
set /p answer=~ 
if %answer%==1 goto Help_Gem
if %answer%==2 goto Help_Npm
if %answer%==3 goto Help_CDN
if %answer%==0 goto Menu


:Help_Gem
cls
echo Do you have Ruby installed (y/n)? [0 to cancel]
set /p answer=~ 
if %answer%==y goto Help_Ruby_Continue
if %answer%==n goto Help_Install_Ruby
if %answer%==0 goto Menu

:Help_Ruby_Continue
cls
echo Starting Sass installation. Make sure to have an active internet connection, this should take less than an mb
pause
echo.
echo gem install sass
start gem install sass
exit /b

:Help_Install_Ruby
cls
echo Directing to...
echo https://rubyinstaller.org
echo.
pause
start https://rubyinstaller.org
goto Menu


:Help_Npm
cls
echo Do you have NodeJS installed (y/n)? [0 to cancel]
set /p answer=~ 
if %answer%==y goto Help_Node_Continue
if %answer%==n goto Help_Install_Node
if %answer%==0 goto Menu

:Help_Node_Continue
cls
echo Starting Sass installation. Make sure to have an active internet connection, this should take less than an mb
pause
echo.
echo npm install sass
start npm install sass
exit /b

:Help_Install_Node
cls
echo Directing to...
echo https://nodejs.org/en/download
echo.
pause
start https://nodejs.org/en/download
goto Menu


:Help_CDN
cls
echo Luckily, the Sass team got you covered with a CDN!
echo --------
echo ^<script src="https://gist.github.com/christiannaths/acb132b9b88b65d15f37.js"^>^</script^>
echo --------
echo NOTE: Requires internet connection when you load your page. You know how CDNs work right?
echo.

pause
goto Menu

