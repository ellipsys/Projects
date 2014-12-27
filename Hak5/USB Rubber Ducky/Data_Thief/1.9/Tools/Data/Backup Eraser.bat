@echo off
:start
Title = Backup Eraser Tool
set backup_directory=Backups
if not exist "%backup_directory%" mkdir "%backup_directory%"
if not exist "%backup_directory%" @echo Failed to create the directory "%backup_directory%"
if not exist "%backup_directory%" pause >nul
if not exist "%backup_directory%" exit
set original_CD=%CD%
cd "%backup_directory%"
:backuplist
@echo Backups --------------------------------
dir /A:D /B
@echo ----------------------------------------
set backup=
set /p backup=Backup: %=%
if "%backup%"=="" goto backuplist
if not exist "%CD%\%backup%" @echo Unable to locate "%CD%\%backup%".
if not exist "%CD%\%backup%" goto backuplist
@echo Erasing data...
RD /S /Q "%backup%"
@echo Command executed.
cd "%original_CD%"
pause >nul
goto start