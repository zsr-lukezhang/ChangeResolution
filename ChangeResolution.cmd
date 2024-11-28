@echo off
cls
title Change.cmd
echo Welcome!
echo This script is created by Luke Zhang and published on GitHub.
echo GitHub repo:
echo GitHub.com/zsr-lukezhang/ChangeResolution
echo How it works?
echo It changes the display resolution using VMWare Tools.
echo VMWare Tools has an excuable file named "VMwareResolutionSet.exe".
echo It allows administrators to change the resolution on the visual machine using the command:
echo VMwareResolutionSet.exe 0 1 , 0 0 [Value of X] [Value of Y]
echo Like:
echo VMwareResolutionSet.exe 0 1 , 0 0 2880 1920
echo This example will simply set the resolution to 2880*1920.
echo Press any key to start...
pause>nul
goto CHECK

:CHECK
if exist "C:\Program Files\VMware\VMware Tools\VMwareResolutionSet.exe" ( goto FOUND ) else ( goto PATH )

:PATH
echo VMWare Tools not found.
echo Please input the path like:
echo "C:\Program Files\VMware\VMware Tools\"
echo Please include
echo \
echo Please input below.
echo Path:
set /p "VMWareToolsPath=>"
goto X

:FOUND
echo VMWare Tools found.
set "VMWareToolsPath=C:\Program Files\VMware\VMware Tools\"
echo %VMWareToolsPath%
goto X

:X
echo X:
set /p "X=>"
goto Y

:Y
echo Y:
set /p "Y=>"
goto SET

:SET
echo Path is: %VMWareToolsPath%
"%VMWareToolsPath%VMwareResolutionSet.exe" 0 1 , 0 0 %X% %Y%
echo Should be set as %X% %Y%
echo Press any key to set another value...
pause>nul
goto X
