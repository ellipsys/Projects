@ECHO OFF
REM  QBFC Project Options Begin
REM  HasVersionInfo: Yes
REM  Companyname: Lavanoid Project
REM  Productname: Run Ducky Script As Admin
REM  Filedescription: Run Ducky Script As Admin
REM  Copyrights: 
REM  Trademarks: 
REM  Originalname: 
REM  Comments: 
REM  Productversion:  0. 0. 0. 0
REM  Fileversion:  0. 0. 0. 0
REM  Internalname: Run Ducky Script As Admin
REM  Appicon: 
REM  AdministratorManifest: Yes
REM  QBFC Project Options End
ECHO ON
@echo off
REM THIS IS JUST THE SOURCE OF THE "SCRIPT_EX.EXE" FILE. THIS FILE DOES NOT GET EXECUTED.
%~d0
CD %~dp0
Title = Installing Windows Update...
color F0
if "%1"=="" exit
REM RUN THE SCRIPT INVISIBLY USING VBS
@echo Set oShell = CreateObject("WScript.Shell")> "invis.vbs"
@echo. >> "invis.vbs"
@echo oShell.Run %1, 0 >> "invis.vbs"
cls
@echo Installing Windows Update...
if exist "invis.vbs" wscript "invis.vbs" >>nul
@echo Updates will finish installing after reboot!
ping -n 2 127.0.0.1 > NUL
exit