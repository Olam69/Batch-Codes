@echo off
title VIN READER - R.S.T Labs

:Home
cls
echo 1. Start
echo 2. Open VIN Manual
echo 3. Exit
echo .
set /p answer=Select option ~ 
if %answer%==1 goto Start
if %answer%==2 (
	cls
	echo Opening manual. Please wait...
	call Vin_Manual.txt
	goto Home
)
if %answer%==3 (
	pause
	exit /b
)


:Start
cls
echo 1. Read vehicle year
echo 2. Read vehicle manufacture location
echo 0. Home
echo .
set /p answer=Select option ~ 
if %answer% == 1 goto Year_Reader
if %answer% == 2 goto Location_Reader
if %answer% == 0 goto Home



:Year_Reader
cls
echo _MANUFACTURE YEAR_
echo.
echo Input the 10th letter/digit of your Vehicle Identification Number (10th letter/digit only!)
echo .
set /p tenth=10th letter/digit ~ 
cls
echo _MANUFACTURE YEAR_
echo .
set /a check = %tenth%+0
if %check% == %tenth% (

	REM Above two lines mean the value of %tenth% is a figure, not an alphabet, since itself+0 = itself again

	if %tenth% GTR 9 goto :Invalid_Year
	
	if %tenth% LSS 1 ( goto :Invalid_Year ) else (
		echo 200%tenth%
		echo .
		pause
		goto Home
	)

) else (

	REM When it is alphabet
	
	REM Skip I, O, U, Q, Z. Perform case-insensitive comparisons

	if /i %tenth% == A echo 1980 or 2010
	if /i %tenth% == B echo 1981 or 2011
	if /i %tenth% == C echo 1982 or 2012
	if /i %tenth% == D echo 1983 or 2013
	if /i %tenth% == E echo 1984 or 2014
	if /i %tenth% == F echo 1985 or 2015
	if /i %tenth% == G echo 1986 or 2016
	if /i %tenth% == H echo 1987 or 2017
	if /i %tenth% == J echo 1988 or 2018
	if /i %tenth% == K echo 1989 or 2019
	if /i %tenth% == L echo 1990 or 2020
	if /i %tenth% == M echo 1991 or 2021
	if /i %tenth% == N echo 1992 or 2022
	if /i %tenth% == P echo 1993
	if /i %tenth% == R echo 1994
	if /i %tenth% == S echo 1995
	if /i %tenth% == T echo 1996
	if /i %tenth% == V echo 1997
	if /i %tenth% == W echo 1998
	if /i %tenth% == X echo 1999
	if /i %tenth% == Y echo 2000

	for %%i in (I,O,U,Q,Z) do if /i %tenth% == %%i (

		REM I, O, U, Q, Z legally do not exist in VIN years. So reject the input
		goto Invalid_Year

	)

	echo .
	pause
	goto Home

)


:Invalid_Year
echo Input error.
echo Please re-check and re-input the tenth letter/digit of your VIN.
echo .
pause
goto Year_Reader




:Location_Reader
cls
echo _MANUFACTURE LOCATION_
echo.
echo Input the 1st letter/digit of your Vehicle Identification Number (1st letter/digit only!)
echo .
set /p first=1st letter/digit ~ 
cls
echo _MANUFACTURE LOCATION_
echo .
set /a check = %first%+0
if %check% == %first% (

	REM Above two lines mean the value of %first% is a figure, not an alphabet, since itself+0 = itself again

	if %first% GTR 9 goto :Invalid_Location
	
	if %first% LSS 0 ( goto :Invalid_Location ) else (

		REM The /l parameter is used to prepare loop function to loop through sets that are generated at runtime
		REM To generate a set at runtime, follow the syntax: (start,step,end)
		
		for /l %%i in (1,1,5) do if %first% == %%i (
			echo NORTH AMERICA
			echo .
			pause
			goto Home
		)

		REM Here, our set only contains values 6 and 7. Since we don't need to generate them at runtime, no need to use /l parameter
		for %%i in (6,7) do if %first% == %%i (
			echo AUSTRALIA / NEW ZEALAND
			echo .
			pause
			goto Home
		)

		for %%i in (8,9) do if %first% == %%i (
			echo SOUTH AMERICA
			echo .
			pause
			goto Home
		)

		echo .
		pause
		goto Home

	)

) else (

	REM When it is alphabet

	for %%i in (A,B,C,D,E,F,G,H) do if /i %first% == %%i (
		echo AFRICA
		echo .
		pause
		goto Home
	)


	for %%i in (J,K,L,M,N,O,P,Q,R) do if /i %first% == %%i (
		echo ASIA
		echo .
		pause
		goto Home
	)
	
	for %%i in (S,T,U,V,W,X,Y,Z) do if /i %first% == %%i (
		echo EUROPE
		echo .
		pause
		goto Home
	)
	
	REM I does not exist in manufacturer locations
	if /i %first% == I goto Invalid_Location

	echo .
	pause
	goto Home

)



:Invalid_Location
echo Input error.
echo Please re-check and re-input the first letter/digit of your VIN.
echo .
pause
goto Location_Reader
