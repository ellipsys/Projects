@echo off
:start
set onehundredpercent=false
set generated_inputtest=
set generated_input=
@echo How many files do you want generated?
set /p generated_input=Total: %=%
@echo Checking if input=numeric value...
set /a generated_inputtest=%generated_input%+1
if "%generated_inputtest%"=="0" cls
if "%generated_inputtest%"=="0" @echo No valid input entered.
if "%generated_inputtest%"=="0" goto start
if "%generated_inputtest%"=="1" cls
if "%generated_inputtest%"=="1" @echo No valid input entered.
if "%generated_inputtest%"=="1" goto start
@echo Ok!
@echo Where should the files be stored? DONT ENTER A SLASH AT THE END!
@echo E.g. C:\Spam Files
set spam_directory=
set /p spam_directory=Dir: %=%
if "%spam_directory%"=="" @echo No input entered. Using directory "spam_files"
if "%spam_directory%"=="" set spam_directory=spam_files
if "%spam_directory%"==" " @echo No input entered. Using directory "spam_files"
if "%spam_directory%"==" " set spam_directory=spam_files
if "%spam_directory%"=="  " @echo No input entered. Using directory "spam_files"
if "%spam_directory%"=="  " set spam_directory=spam_files
if "%spam_directory%"=="   " @echo No input entered. Using directory "spam_files"
if "%spam_directory%"=="   " set spam_directory=spam_files
set generated=0
set total=%generated_input%
set /a atotal=%total%/100
set /a agenerated=%generated%/%atotal%
if "%agenerated%"=="100" set onehundredpercent=true
if "%onehundredpercent%"=="true" set agenerated=100
Title = File Spammer: %agenerated%%% ,%generated%/%total%
if not exist "%spam_directory%" mkdir "%spam_directory%"
if not exist "%spam_directory%" @echo DIRECTORY ERROR!
if not exist "%spam_directory%" pause >nul
if not exist "%spam_directory%" goto exit
@echo Creating files...
:spam
@echo. > "%spam_directory%\%RANDOM%.tmp"
set /a generated=%generated%+1
set /a agenerated=%generated%/%atotal%
if "%agenerated%"=="100" set onehundredpercent=true
if "%onehundredpercent%"=="true" set agenerated=100
Title = File Spammer: %agenerated%%% ,%generated%/%total%
if "%generated%"=="%total%" goto finished
goto spam
:finished
@echo Proccess complete!
@echo Delete spam data? Y/N
set /p delete_spam_data=Option: %=%
if "%delete_spam_data%"=="y" @echo Deleting data...
if "%delete_spam_data%"=="y" del /f "%spam_directory%\*.tmp"
if "%delete_spam_data%"=="Y" @echo Deleting data...
if "%delete_spam_data%"=="Y" del /f "%spam_directory%\*.tmp"
@echo OK!
goto start
:exit
