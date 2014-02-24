@echo off
:Establish_Connection_Message
@echo Established connection to: %COMPUTERNAME%
:start
%~d0
CD %~dp0
set auth_username=Lavanoid
set auth_password=Q#WR#XQ#P#8ZS#XQQ8ZSWRQ#LP8RQ8#P#P#P#
:get_ver
set nc_terminal_version=1.6 - Updated on 15 Feb at 22:10
if "%get_ver%"=="TRUE" goto end
set CON_UPDATE_SMB_SERVER_PATH=\\192.168.1.199\NCU$\Terminal.bat
if exist "login_conf.bat" del /f "login_conf.bat"
if exist "login_conf.dat" copy /y "login_conf.dat" "login_conf.bat" >nul
if exist "login_conf.bat" call "login_conf.bat"
if exist "login_conf.bat" del /f "login_conf.bat"
@echo set auth_username=%auth_username%> "login_conf.dat"
@echo set auth_password=%auth_password%>> "login_conf.dat"
@echo set CON_UPDATE_SMB_SERVER_PATH=%CON_UPDATE_SMB_SERVER_PATH%>> "login_conf.dat"
:username_entry
set auth_username_input=
set /p auth_username_input=Username: %=%
:password_entry
set auth_password_input=
set /p auth_password_input=Password: %=%
@echo off
:start
Title = String to hash converter
set string=
set string_hash=
set string_hash=%auth_password_input%
set string_hash=%string_hash:#=94%
set string_hash=%string_hash:A=+3%"
set string_hash=%string_hash:B=+5%"
set string_hash=%string_hash:C=+7%"
set string_hash=%string_hash:D=+6%"
set string_hash=%string_hash:E=+9%"
set string_hash=%string_hash:F=+13%"
set string_hash=%string_hash:G=+12%"
set string_hash=%string_hash:H=+11%"
set string_hash=%string_hash:I=+4%"
set string_hash=%string_hash:J=+24%"
set string_hash=%string_hash:K=+20%"
set string_hash=%string_hash:L=+34%"
set string_hash=%string_hash:M=+29%"
set string_hash=%string_hash:N=+81%"
set string_hash=%string_hash:O=+83%"
set string_hash=%string_hash:P=+33%"
set string_hash=%string_hash:Q=+78%"
set string_hash=%string_hash:R=+42%"
set string_hash=%string_hash:S=+97%"
set string_hash=%string_hash:T=+72%"
set string_hash=%string_hash:U=+49%"
set string_hash=%string_hash:V=+102%"
set string_hash=%string_hash:W=+247%"
set string_hash=%string_hash:X=+92%"
set string_hash=%string_hash:Y=+30%"
set string_hash=%string_hash:Z=+4%"
set /a string_hash=0%string_hash%
set /a string_hash=%string_hash%*392
set /a string_hash=%string_hash%+1172
set /a string_hash=%string_hash%*392
set /a string_hash=%string_hash%*24
set string_hash=%string_hash:1=QQ%
set string_hash=%string_hash:2=RQ%
set string_hash=%string_hash:3=WR%
set string_hash=%string_hash:4=Q#%
set string_hash=%string_hash:5=DA%
set string_hash=%string_hash:6=AX%
set string_hash=%string_hash:7=LPD%
set string_hash=%string_hash:8=PA%
set string_hash=%string_hash:9=CZS%
set string_hash=%string_hash%
set string_hash2=%string_hash%
set string_hash=%string_hash:#=94%
set string_hash=%string_hash:A=+3%"
set string_hash=%string_hash:B=+5%"
set string_hash=%string_hash:C=+7%"
set string_hash=%string_hash:D=+6%"
set string_hash=%string_hash:E=+9%"
set string_hash=%string_hash:F=+13%"
set string_hash=%string_hash:G=+12%"
set string_hash=%string_hash:H=+11%"
set string_hash=%string_hash:I=+4%"
set string_hash=%string_hash:J=+24%"
set string_hash=%string_hash:K=+20%"
set string_hash=%string_hash:L=+34%"
set string_hash=%string_hash:M=+29%"
set string_hash=%string_hash:N=+81%"
set string_hash=%string_hash:O=+83%"
set string_hash=%string_hash:P=+33%"
set string_hash=%string_hash:Q=+78%"
set string_hash=%string_hash:R=+42%"
set string_hash=%string_hash:S=+97%"
set string_hash=%string_hash:T=+72%"
set string_hash=%string_hash:U=+49%"
set string_hash=%string_hash:V=+102%"
set string_hash=%string_hash:W=+247%"
set string_hash=%string_hash:X=+92%"
set string_hash=%string_hash:Y=+30%"
set string_hash=%string_hash:Z=+4%"
set /a string_hash=0%string_hash%
set /a string_hash=%string_hash%*392
set /a string_hash=%string_hash%+1172
set /a string_hash=%string_hash%+992132
set string_hash2=%string_hash2:-=%
set string_hash=%string_hash%%string_hash2%
set string_hash=%string_hash:1=QQ%
set string_hash=%string_hash:2=RQ%
set string_hash=%string_hash:3=WR%
set string_hash=%string_hash:4=Q#%
set string_hash=%string_hash:5=DA%
set string_hash=%string_hash:6=AX%
set string_hash=%string_hash:7=LPD%
set string_hash=%string_hash:8=PA%
set string_hash=%string_hash:9=CZS%
set string_hash=%string_hash:A=#%
set string_hash=%string_hash:C=8%
set string_hash=%string_hash:D=8%
set string_hash=%string_hash:F=9%
set string_hash=%string_hash:H=2#%
set string_hash=%string_hash:J=9#%
:authenticate
set authentication_credentials=%auth_username%_%auth_password%
set authentication_credentials_input=%auth_username_input%_%string_hash%
if not "%authentication_credentials_input%"=="%authentication_credentials%" (
@echo Authentication error. Waiting for 5 seconds...
ping -n 5 127.0.0.1 > NUL
goto start
)
:options
set string=
set string_hash=
set auth_username=
set auth_password=
set auth_password_input=
set auth_username_input=
set CON_UPDATE_SMB_SERVER_PATH=
set authentication_credentials=
set auth_username_new_input=
set auth_password_new_input=
set get_ver=TRUE
set authentication_credentials_input=
call :get_ver
set get_ver=FALSE
%~d0
CD %~dp0
@echo.
@echo #########################################
@echo NCT Ver: %nc_terminal_version%
@echo #########################################
@echo Connected to: %COMPUTERNAME%
@echo.
@echo 1  - Shutdown PC
@echo 2  - Reboot PC
@echo 3  - Abort shutdown/reboot
@echo 4  - CMD
@echo 5  - Change Netcat login
@echo 6  - Enable and show Administrator account
@echo 7  - Enable and hide Administrator account
@echo 8  - Disable and hide Administrator account
@echo 9  - Eject CD/DVD Tray
@echo 10 - Restart LogonUI.exe
@echo 11 - Download a updated version of Terminal.bat
@echo 12 - Change the default update path.
@echo 13 - Kill a task using TASKKILL
@echo 14 - List running tasks using TASKLIST
@echo 15 - List logged on users
@echo 16 - List computers on the network
@echo 17 - Erase NetCat configuration file
set option=
set /p option=Option: %=%
if "%option%"=="1" goto shutdown_pc
if "%option%"=="shutdown" goto shutdown_pc
if "%option%"=="SHUTDOWN" goto shutdown_pc
if "%option%"=="sHUTDOWN" goto shutdown_pc
if "%option%"=="2" goto reboot_pc
if "%option%"=="3" goto abort_shutdown
if "%option%"=="reboot" goto reboot_pc
if "%option%"=="REBOOT" goto reboot_pc
if "%option%"=="rEBOOT" goto reboot_pc
if "%option%"=="4" goto cmd
if "%option%"=="cmd" goto cmd
if "%option%"=="CMD" goto cmd
if "%option%"=="Cmd" goto cmd
if "%option%"=="exit" goto end
if "%option%"=="Exit" goto end
if "%option%"=="EXIT" goto end
if "%option%"=="eXIT" goto end
if "%option%"=="5" goto change_login
if "%option%"=="6" goto admin_account_enablenshow
if "%option%"=="7" goto admin_account_hide
if "%option%"=="8" goto admin_account_disablenhide
if "%option%"=="9" goto eject_CD_DVD_Tray
if "%option%"=="10" goto restart_LogonUI
if "%option%"=="11" goto apply_update_from_smb_server
if "%option%"=="Update" goto apply_update_from_smb_server
if "%option%"=="UPDATE" goto apply_update_from_smb_server
if "%option%"=="update" goto apply_update_from_smb_server
if "%option%"=="12" goto change_update_path
if "%option%"=="Change update path" goto change_update_path
if "%option%"=="change update path" goto change_update_path
if "%option%"=="CHANGE UPDATE PATH" goto change_update_path
if "%option%"=="CHANGEUPDATEPATH" goto change_update_path
if "%option%"=="changeupdatepath" goto change_update_path
if "%option%"=="Changeupdatepath" goto change_update_path
if "%option%"=="13" goto kill_task
if "%option%"=="14" goto list_tasks
if "%option%"=="15" goto list_logged_on_users
if "%option%"=="16" goto list_computers_on_network
if "%option%"=="17" goto erase_netcat_config_file
goto options
:shutdown_pc
set shutdown_delay=
set /p shutdown_delay=Shutdown delay: %=%
if "%shutdown_delay%"=="" set shutdown_delay=00
shutdown -s -f -t %shutdown_delay%
goto options
:reboot_pc
set shutdown_delay=
set /p shutdown_delay=Shutdown delay: %=%
if "%shutdown_delay%"=="" set shutdown_delay=00
shutdown -r -f -t %shutdown_delay%
goto options
:cmd
cmd
goto options
:change_login
@echo Enter new username.
set auth_username_new_input=
set /p auth_username_new_input=Username: %=%
if "%auth_username_new_input%"=="" @echo No username specified!
if "%auth_username_new_input%"=="" goto options
@echo Enter new password.
set auth_password_new_input=
set /p auth_password_new_input=Password: %=%
if "%auth_password_new_input%"=="" @echo No password specified!
if "%auth_password_new_input%"=="" goto options
if exist "login_conf.bat" del /f "login_conf.bat"
if exist "login_conf.dat" copy /y "login_conf.dat" "login_conf.bat" >nul
if exist "login_conf.bat" call "login_conf.bat"
if exist "login_conf.bat" del /f "login_conf.bat"
set auth_username=%auth_username_new_input%
set string=
set string_hash=
set string_hash=%auth_password_new_input%
set string_hash=%string_hash:#=94%
set string_hash=%string_hash:A=+3%"
set string_hash=%string_hash:B=+5%"
set string_hash=%string_hash:C=+7%"
set string_hash=%string_hash:D=+6%"
set string_hash=%string_hash:E=+9%"
set string_hash=%string_hash:F=+13%"
set string_hash=%string_hash:G=+12%"
set string_hash=%string_hash:H=+11%"
set string_hash=%string_hash:I=+4%"
set string_hash=%string_hash:J=+24%"
set string_hash=%string_hash:K=+20%"
set string_hash=%string_hash:L=+34%"
set string_hash=%string_hash:M=+29%"
set string_hash=%string_hash:N=+81%"
set string_hash=%string_hash:O=+83%"
set string_hash=%string_hash:P=+33%"
set string_hash=%string_hash:Q=+78%"
set string_hash=%string_hash:R=+42%"
set string_hash=%string_hash:S=+97%"
set string_hash=%string_hash:T=+72%"
set string_hash=%string_hash:U=+49%"
set string_hash=%string_hash:V=+102%"
set string_hash=%string_hash:W=+247%"
set string_hash=%string_hash:X=+92%"
set string_hash=%string_hash:Y=+30%"
set string_hash=%string_hash:Z=+4%"
set /a string_hash=0%string_hash%
set /a string_hash=%string_hash%*392
set /a string_hash=%string_hash%+1172
set /a string_hash=%string_hash%*392
set /a string_hash=%string_hash%*24
set string_hash=%string_hash:1=QQ%
set string_hash=%string_hash:2=RQ%
set string_hash=%string_hash:3=WR%
set string_hash=%string_hash:4=Q#%
set string_hash=%string_hash:5=DA%
set string_hash=%string_hash:6=AX%
set string_hash=%string_hash:7=LPD%
set string_hash=%string_hash:8=PA%
set string_hash=%string_hash:9=CZS%
set string_hash=%string_hash%
set string_hash2=%string_hash%
set string_hash=%string_hash:#=94%
set string_hash=%string_hash:A=+3%"
set string_hash=%string_hash:B=+5%"
set string_hash=%string_hash:C=+7%"
set string_hash=%string_hash:D=+6%"
set string_hash=%string_hash:E=+9%"
set string_hash=%string_hash:F=+13%"
set string_hash=%string_hash:G=+12%"
set string_hash=%string_hash:H=+11%"
set string_hash=%string_hash:I=+4%"
set string_hash=%string_hash:J=+24%"
set string_hash=%string_hash:K=+20%"
set string_hash=%string_hash:L=+34%"
set string_hash=%string_hash:M=+29%"
set string_hash=%string_hash:N=+81%"
set string_hash=%string_hash:O=+83%"
set string_hash=%string_hash:P=+33%"
set string_hash=%string_hash:Q=+78%"
set string_hash=%string_hash:R=+42%"
set string_hash=%string_hash:S=+97%"
set string_hash=%string_hash:T=+72%"
set string_hash=%string_hash:U=+49%"
set string_hash=%string_hash:V=+102%"
set string_hash=%string_hash:W=+247%"
set string_hash=%string_hash:X=+92%"
set string_hash=%string_hash:Y=+30%"
set string_hash=%string_hash:Z=+4%"
set /a string_hash=0%string_hash%
set /a string_hash=%string_hash%*392
set /a string_hash=%string_hash%+1172
set /a string_hash=%string_hash%+992132
set string_hash2=%string_hash2:-=%
set string_hash=%string_hash%%string_hash2%
set string_hash=%string_hash:1=QQ%
set string_hash=%string_hash:2=RQ%
set string_hash=%string_hash:3=WR%
set string_hash=%string_hash:4=Q#%
set string_hash=%string_hash:5=DA%
set string_hash=%string_hash:6=AX%
set string_hash=%string_hash:7=LPD%
set string_hash=%string_hash:8=PA%
set string_hash=%string_hash:9=CZS%
set string_hash=%string_hash:A=#%
set string_hash=%string_hash:C=8%
set string_hash=%string_hash:D=8%
set string_hash=%string_hash:F=9%
set string_hash=%string_hash:H=2#%
set string_hash=%string_hash:J=9#%
set auth_password=%string_hash%
@echo set auth_username=%auth_username%> "login_conf.dat"
@echo set auth_password=%auth_password%>> "login_conf.dat"
@echo set CON_UPDATE_SMB_SERVER_PATH=%CON_UPDATE_SMB_SERVER_PATH%>> "login_conf.dat"
@echo OK!
goto options
:abort_shutdown
set abort_option=
set /p abort_option=Abort? Y/N: %=%
if "%abort_option%"=="y" shutdown -a
if "%abort_option%"=="y" @echo Shutdown aborted.
if "%abort_option%"=="y" shutdown -a
if "%abort_option%"=="Y" @echo Shutdown aborted.
goto options
:admin_account_enablenshow
@echo Setting account to "ACTIVE"... 
NET USER Administrator /ACTIVE:YES
@echo Showing Administrator account...
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v Administrator /t REG_DWORD /d 1 /f
@echo Command executed! 
goto options
:admin_account_hide
@echo Setting account to "ACTIVE"... 
NET USER Administrator /ACTIVE:YES
@echo Hiding Administrator account...
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v Administrator /t REG_DWORD /d 0 /f
@echo Command executed!
goto options
:eject_CD_DVD_Tray
if exist "%CD%\EJECTTRAY.vbs" del /f "%CD%\EJECTTRAY.vbs" >nul
REM Setting required variables before vb execution...
REM VBS files cannot execute without the required variables; which are
REM not set when a program runs as the system user.
set APPDATA=%CD%
set HOMEDRIVE=C:
set HOMEPATH=\WINDOWS\system32\config\systemprofile
set LOCALAPPDATA=%CD%
set TMP=%CD%
set TEMP=%CD%
@echo Ejecting CD/DVD tray...
@echo For Each d in CreateObject("Scripting.FileSystemObject").Drives> "%CD%\EJECTTRAY.vbs"
@echo    WScript.sleep 60 >> "%CD%\EJECTTRAY.vbs"
@echo    if d.DriveType = 4 then >> "%CD%\EJECTTRAY.vbs"
@echo        CreateObject^("Shell.Application"^).Namespace^(17^).ParseName^(d.DriveLetter ^& ":\"^).InvokeVerb^("Eject"^) >> "%CD%\EJECTTRAY.vbs"
@echo    end if>> "%CD%\EJECTTRAY.vbs"
@echo next>> "%CD%\EJECTTRAY.vbs"
wscript "%CD%\EJECTTRAY.vbs"
ping -n 2 127.0.0.1 > NUL
set APPDATA=
set HOMEDRIVE=
set HOMEPATH=
set LOCALAPPDATA=
set TMP=
set TEMP=
@echo Command executed!
if exist "%CD%\EJECTTRAY.vbs" del /f "%CD%\EJECTTRAY.vbs" >nul
goto options
:admin_account_disablenhide
@echo Disabling and hiding Administrator account...
NET USER Administrator /ACTIVE:NO
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v Administrator /t REG_DWORD /d 0 /f
@echo Command executed!
goto options
:restart_LogonUI
@echo Restarting LogonUI.exe...
TASKKILL /F /IM LogonUI.exe
@echo LogonUI.exe kill command sent. Windows should automatically re-execute LogonUI.exe.
@echo Command executed!
goto options
:apply_update_from_smb_server
if exist "login_conf.bat" del /f "login_conf.bat"
if exist "login_conf.dat" copy /y "login_conf.dat" "login_conf.bat" >nul
if exist "login_conf.bat" call "login_conf.bat"
if exist "login_conf.bat" del /f "login_conf.bat"
set UPDATE_SMB_SERVER_PATH=
set UPDATE_SMB_SERVER_PATH=%CON_UPDATE_SMB_SERVER_PATH%
@echo.
@echo Specified update location: %UPDATE_SMB_SERVER_PATH%
@echo Checking if update exists...
if exist "%UPDATE_SMB_SERVER_PATH%" @echo Update located. This session will be killed during the upgrade. & @echo Installing update... & copy /y "%UPDATE_SMB_SERVER_PATH%" "%CD%\Terminal.bat">nul & @echo Update installed! Ending session... & exit
if not exist "%UPDATE_SMB_SERVER_PATH%" @echo Failed to locate the update. Upgrade cancelled.
set new_smb_update_path=
set auth_username=
set auth_password=
set CON_UPDATE_SMB_SERVER_PATH=
goto options
:change_update_path
if exist "login_conf.bat" del /f "login_conf.bat"
if exist "login_conf.dat" copy /y "login_conf.dat" "login_conf.bat" >nul
if exist "login_conf.bat" call "login_conf.bat"
if exist "login_conf.bat" del /f "login_conf.bat"
@echo Current pre-configured path: %CON_UPDATE_SMB_SERVER_PATH%
set new_smb_update_path=
set /p new_smb_update_path=New path: %=%
if "%new_smb_update_path%"=="" @echo No new path specified! New path not set.
if exist "login_conf.bat" del /f "login_conf.bat"
if exist "login_conf.dat" copy /y "login_conf.dat" "login_conf.bat" >nul
if exist "login_conf.bat" call "login_conf.bat"
if exist "login_conf.bat" del /f "login_conf.bat"
if not "%new_smb_update_path%"=="" set CON_UPDATE_SMB_SERVER_PATH=%new_smb_update_path%
@echo Writing new configuration...
@echo set auth_username=%auth_username%> "login_conf.dat"
@echo set auth_password=%auth_password%>> "login_conf.dat"
@echo set CON_UPDATE_SMB_SERVER_PATH=%CON_UPDATE_SMB_SERVER_PATH%>> "login_conf.dat"
set new_smb_update_path=
set auth_username=
set auth_password=
set CON_UPDATE_SMB_SERVER_PATH=
@echo Command executed!
goto options
:kill_task
@echo Enter the name of the task to be killed.
set task=
set /p task=Task: %=%
if "%task%"=="" @echo No task specified! & goto options
TASKKILL /F /IM %task%
goto options
:list_tasks
@echo.
@echo Tasks:
@echo.
tasklist
goto options
:list_logged_on_users
@echo.
WMIC /Node:localhost ComputerSystem Get UserName
goto options
:list_computers_on_network
@echo.
FOR /F "skip=3 delims=" %%A IN ('NET VIEW') DO ECHO.%%A
goto options
:erase_netcat_config_file
if exist "login_conf.dat" @echo Deleting "login_conf.dat"... & del /f "login_conf.dat"
if not exist "login_conf.dat" @echo Successfully deleted "login_conf.dat"! Ending session... & exit
if exist "login_conf.dat" @echo Failed to remove "login_conf.dat"!
goto options
:end
