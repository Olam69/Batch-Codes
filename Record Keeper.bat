@echo off
title Record and Account Keeper Software - From R.S.T Softwares
color 06

set jjjt=Please select an option according to its number...
set col_group=::::::::::::::::::::

if exist "business_profile.txt" (goto Price_Setup) else (goto first)

:first
cls
echo Welcome! Please input the name of your business.
set /p bus_name=Type here ~ 
echo %bus_name% > business_profile.txt
cls
echo Business name saved! Check;
echo %bus_name%
echo 1. Done
echo 2. Edit
set /p answer=Type here ~ 
if %answer%==1 goto Price_Setup
if %answer%==2 goto edit_bus_name
:edit_bus_name
cls
set /p bus_name=~ 
echo %bus_name% > business_profile.txt
cls
echo Business name saved! Check;
echo %bus_name%
echo 1. Done
echo 2. Edit
set /p answer=Type here ~ 
if %answer%==1 goto Price_Setup
if %answer%==2 goto edit_bus_name

:Price_Setup
if exist "Names_and_Prices.txt" (goto home)
cls
echo   Welcome to the setup screen! Let's start by adding your products/services and their prices respectively.
echo   NOTE: You can start from any product/service that comes to your mind first!
echo.
set /p prod=Product/Service 1 ~ 
echo %prod% > Names_and_Prices.txt
set /p price=Price of %prod% (0-9 only!) ~ 
echo %price% >> Names_and_Prices.txt
:cont_price_setup_q
echo.
echo 1. Continue
echo 2. That's all
set /p answer=~
if %answer%==1 goto cont_price_setup 
if %answer%==2 goto home
:cont_price_setup
echo.
set /p prod=Product/Service ~ 
echo %prod% >> Names_and_Prices.txt
set /p price=Price of %prod% (0-9 only!) ~ 
echo %price% >> Names_and_Prices.txt
goto cont_price_setup_q


:home
for /f "tokens=* delims=" %%x in (business_profile.txt) do set "bus_name=%%x"
cls
echo %col_group% %bus_name%RECORD AND ACCOUNT KEEPER APP %col_group%
echo                                           - R.S.T Softwares
echo   1. Record a new sale
echo   2. List previous sales
echo   3. Update or add new products/services
echo.
echo %jjjt%
set /p answer=Type here ~ 
if %answer%==1 goto Append_Sales
if %answer%==2 goto List_Sales
if %answer%==3 goto List_General

:Append_Sales
cls
echo   What was sold/rendered?
set /p sold=~
if exist "Sales.txt" (echo %sold% >> Sales.txt) else (echo %sold% > Sales.txt)
echo Recorded successfylly! Is that all?
echo   1. Yes
echo   2. More
echo.
echo %jjjt%
set /p answer=Type here~
if %answer%==1 goto List_Sales
if %answer%==2 goto Append_Sales

:List_Sales
cls
if exist "Sales.txt" (goto L_Sales) else (goto L_Append)
:L_Sales
for /f "tokens=* delims=" %%x in (Sales.txt) do echo .... %%x ....
pause
goto home

:L_Append
echo No sales found
echo   1. Record your first sales
echo   2. Go back
echo.
echo %jjjt%
set /p answer=Type here~
if %answer%==1 goto Append_Sales
if %answer%==2 goto home


:List_General
for /f "tokens=* delims=" %%x in (Names_and_Prices.txt) do echo .... %%x ....
pause
