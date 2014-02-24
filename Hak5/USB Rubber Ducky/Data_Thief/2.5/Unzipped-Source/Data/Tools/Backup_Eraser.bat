@echo off
:read_backups
%~d0
CD %~dp0
cd..
if not exist "Backups" @echo No backups found
if not exist "Backups" pause
if not exist "Backups" goto end
@echo Backups ---------------------------
dir /A:D "Backups" /B
REM CD to 'Backups' so the shift key can be used to select backups.
CD Backups
@echo -----------------------------------
@echo What backup do you want erase?
set backup=
set /p backup=Backup: %=%
cd..
if not exist "Backups\%backup%" @echo "Backups\%backup%" not found.
if not exist "Backups\%backup%" goto read_backups
@echo Are your sure you want to erase the backup "%backup%"?
set sure=
set /p sure=Y/N: %=%
if "%sure%"=="Y" goto erase_backup
if "%sure%"=="y" goto erase_backup
@echo Operation aborted.
goto read_backups
:erase_backup
@echo Erasing "Backups\%backup%"...
RD /S /Q "Backups\%backup%"
if not exist "Backups\%backup%" @echo [PASS] Successfully erased "Backups\%backup%".
if exist "Backups\%backup%" @echo [FAIL] Unable to successfully remove "Backups\%backup%"!
goto read_backups
:end
