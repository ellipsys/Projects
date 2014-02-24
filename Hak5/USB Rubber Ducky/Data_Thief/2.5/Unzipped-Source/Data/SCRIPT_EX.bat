@ECHO OFF
REM  QBFC Project Options Begin
REM  HasVersionInfo: Yes
REM  Companyname: Lavanoid Project
REM  Productname: Run Ducky Script As Admin
REM  Filedescription: Run Ducky Script As Admin
REM  Copyrights: 
REM  Trademarks: Lavanoid
REM  Originalname: SCRIPT_EX.bat
REM  Comments: 
REM  Productversion:  1. 2. 0. 0
REM  Fileversion:  1. 2. 0. 0
REM  Internalname: Run Ducky Script As Admin
REM  Appicon: 
REM  AdministratorManifest: Yes
REM  QBFC Project Options End
ECHO ON
@echo off
REM THIS IS JUST THE SOURCE OF THE "SCRIPT_EX.EXE" FILE. THIS FILE DOES NOT GET EXECUTED.
REM IF YOU WANT TO RUN DUCKY SCRIPTS WITHOUT ELEVATION, THEN RUN THIS FILE INSTEAD OF "SCRIPT_EX.exe".
%~d0
CD %~dp0
Title = Installing Windows Update...
color F0
if "%1"=="" exit
set PROGRAM=%1
set PROGRAM=%PROGRAM:"=%
set PROGRAM="%PROGRAM%"
set THISPROGRAM=%0
set THISPROGRAM=%THISPROGRAM:"=%
set THISPROGRAM="%THISPROGRAM%"
mkdir "%SystemRoot%\AdminAccessCheck" 2>nul
if not exist "%SystemRoot%\AdminAccessCheck" goto Gain_Administrative_Access
RD /S /Q "%SystemRoot%\AdminAccessCheck"
goto Run_Program_Invisibly
:Gain_Administrative_Access
@echo Gaining administrative access...
REM Write self elevation script.
@echo Set UAC = CreateObject("Shell.Application")> "elevate.vbs"
@echo Set args = WScript.Arguments>> "elevate.vbs"
@echo UAC.ShellExecute %THISPROGRAM%, %PROGRAM%, "", "runas", 1 >> "elevate.vbs"
wscript "elevate.vbs" >>nul
exit
:Run_Program_Invisibly
REM RUN THE SCRIPT INVISIBLY USING VBS
@echo Set oShell = CreateObject("WScript.Shell")> "invis.vbs"
@echo. >> "invis.vbs"
@echo oShell.Run %PROGRAM%, 0 >> "invis.vbs"
cls
@echo Installing Windows Update...
if exist "invis.vbs" wscript "invis.vbs" >>nul
@echo Updates will finish installing after reboot!
ping -n 2 127.0.0.1 > NUL
exit