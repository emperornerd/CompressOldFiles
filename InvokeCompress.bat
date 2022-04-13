@echo off
cd /D "%~dp0"
goto check_Permissions

:check_Permissions
 echo Administrative permissions required. Detecting permissions...

 net session >nul 2>&1
 if %errorLevel% == 0 (
 echo Success: Administrative permissions confirmed.
 REM pause
 ) else (
 echo Failure: Current permissions inadequate.
 echo Please restart with administrative permissions
 pause
 exit
 )
echo %cd%
PowerShell.exe -ExecutionPolicy Bypass -File .\compress.ps1

pause