@ECHO OFF
REM  QBFC Project Options Begin
REM  HasVersionInfo: Yes
REM  Companyname: Lavanoid-Project
REM  Productname: LavaPrompt Command Terminal
REM  Filedescription: LavaPrompt Command Terminal
REM  Copyrights: 
REM  Trademarks: 
REM  Originalname: LavaPrompt
REM  Comments: 
REM  Productversion:  0. 0. 2. 2
REM  Fileversion:  0. 0. 2. 2
REM  Internalname: LavaPrompt Command Terminal
REM  Appicon: bin\icon_new.ico
REM  AdministratorManifest: No
REM  Embeddedfile: bin\Student.exe
REM  Embeddedfile: bin\SwitchToStudent.exe
REM  Embeddedfile: bin\SwitchToTeacher.exe
REM  Embeddedfile: bin\Teacher.exe
REM  Embeddedfile: bin\keyrec.dat
REM  Embeddedfile: bin\runasadmin.exe
REM  Embeddedfile: bin\7-zip.dll
REM  Embeddedfile: bin\7zCon.sfx
REM  Embeddedfile: bin\7z.sfx
REM  Embeddedfile: bin\7z.exe
REM  Embeddedfile: bin\7z.dll
REM  Embeddedfile: bin\LavaPrompt_Daemon_1.6.exe
REM  Embeddedfile: bin\LavaPrompt_Daemon_Start_1.6.exe
REM  Embeddedfile: bin\LavaPrompt_Daemon_Installer.exe
REM  QBFC Project Options End
ECHO ON
:thebeginningoftime
@echo off
set command=
set reg_string_encrypted_calculated=
set reg_string_encrypted=
set userid=
:lavaprompt_information
set lpversionno=2.2
set lpdaemonversionno=1.6
set lplinesofcode=4844
set lpversion=%lpversionno% [RE BUILD], [%lplinesofcode% LINES]
set lpdate=18 October 2013, 16:53
if "%command%"=="lpinfo" goto lavaprompt_information_print
if "%command%"=="LPINFO" goto lavaprompt_information_print
if "%command%"=="Lpinfo" goto lavaprompt_information_print
TITLE=LavaPrompt version %lpversion%~[UNKNOWN]
if not exist "%APPDATA%\LavaPrompt" mkdir "%APPDATA%\LavaPrompt"
if not exist "%APPDATA%\LavaPrompt" @echo Unable to create LP directories!
if not exist "%APPDATA%\LavaPrompt" pause >nul
if not exist "%APPDATA%\LavaPrompt" exit
:userid
@echo Please wait...
SET RANDOMFILENAME=%RANDOM%%RANDOM%.txt
NET USER > "%TEMP%\%RANDOMFILENAME%"
if "%USERNAME%"=="SYSTEM" @echo The username 'SYSTEM' cannot be used with LP.
if "%USERNAME%"=="SYSTEM" pause >nul
if "%USERNAME%"=="SYSTEM" exit
findstr /m "%USERNAME%" "%TEMP%\%RANDOMFILENAME%" >nul
if %errorlevel%==1 (
@echo ERROR! User misconfiguration. Error No. 42081
SET RANDOMFILENAME=
pause >nul
exit
)
SET RANDOMFILENAME=
cls
set reg_string_encrypted=%USERNAME%_%PROCESSOR_REVISION%_%PROCESSOR_LEVEL%_%PROCESSOR_ARCHITECTURE%
set reg_string_encrypted_calculated=1092
set reg_string_encrypted=%reg_string_encrypted:/=26+%
set reg_string_encrypted=%reg_string_encrypted:\=22+%
set reg_string_encrypted=%reg_string_encrypted:-=22+%
set reg_string_encrypted=%reg_string_encrypted:_=20+%
set reg_string_encrypted=%reg_string_encrypted:#=23+%
set reg_string_encrypted=%reg_string_encrypted:a=5+%
set reg_string_encrypted=%reg_string_encrypted:b=7+%
set reg_string_encrypted=%reg_string_encrypted:c=2+%
set reg_string_encrypted=%reg_string_encrypted:d=4+%
set reg_string_encrypted=%reg_string_encrypted:e=3+%
set reg_string_encrypted=%reg_string_encrypted:f=2+%
set reg_string_encrypted=%reg_string_encrypted:g=9+%
set reg_string_encrypted=%reg_string_encrypted:h=12+%
set reg_string_encrypted=%reg_string_encrypted:i=19+%
set reg_string_encrypted=%reg_string_encrypted:j=17+%
set reg_string_encrypted=%reg_string_encrypted:k=3+%
set reg_string_encrypted=%reg_string_encrypted:l=23+%
set reg_string_encrypted=%reg_string_encrypted:m=21+%
set reg_string_encrypted=%reg_string_encrypted:n=11+%
set reg_string_encrypted=%reg_string_encrypted:o=10+%
set reg_string_encrypted=%reg_string_encrypted:p=8+%
set reg_string_encrypted=%reg_string_encrypted:q=6+%
set reg_string_encrypted=%reg_string_encrypted:r=30+%
set reg_string_encrypted=%reg_string_encrypted:s=43+%
set reg_string_encrypted=%reg_string_encrypted:t=87+%
set reg_string_encrypted=%reg_string_encrypted:u=78+%
set reg_string_encrypted=%reg_string_encrypted:v=91+%
set reg_string_encrypted=%reg_string_encrypted:w=98+%
set reg_string_encrypted=%reg_string_encrypted:x=877+%
set reg_string_encrypted=%reg_string_encrypted:y=332+%
set reg_string_encrypted=%reg_string_encrypted:z=243+%
set reg_string_encrypted=%reg_string_encrypted:@=163+%
set reg_string_encrypted=%reg_string_encrypted:.=173+%
set reg_string_encrypted=%reg_string_encrypted:;=13+%
set reg_string_encrypted=%reg_string_encrypted::=213+%
set /a reg_string_encrypted_calculated=%reg_string_encrypted_calculated%+%reg_string_encrypted%1
set /a reg_string_encrypted_calculated=%reg_string_encrypted_calculated%+%reg_string_encrypted_calculated%
set /a reg_string_encrypted_calculated=%reg_string_encrypted_calculated%+%reg_string_encrypted_calculated%
set /a reg_string_encrypted_calculated=%reg_string_encrypted_calculated%+%reg_string_encrypted_calculated%
set /a reg_string_encrypted_calculated=%reg_string_encrypted_calculated%+%reg_string_encrypted_calculated%
set /a reg_string_encrypted_calculated=%reg_string_encrypted_calculated%+%reg_string_encrypted_calculated%
set /a reg_string_encrypted_calculated=%reg_string_encrypted_calculated%+%reg_string_encrypted_calculated%
set /a reg_string_encrypted_calculated=%reg_string_encrypted_calculated%-43
set /a reg_string_encrypted_calculated=%reg_string_encrypted_calculated%+891
set userid=%reg_string_encrypted_calculated%
set reg_string_encrypted_calculated=
set cleanup_file_script_size=0
set cleanup_file_script_limit=50
if exist "%APPDATA%\LavaPrompt\exfile.bat" del /S /Q "%APPDATA%\LavaPrompt\exfile.bat" >nul
if exist "%APPDATA%\LavaPrompt\cleanup_operations.bat" del /f "%APPDATA%\LavaPrompt\cleanup_operations.bat" >nul
if exist "%APPDATA%\LavaPrompt\cleanup_operations.dat" copy "%APPDATA%\LavaPrompt\cleanup_operations.dat" "%APPDATA%\LavaPrompt\cleanup_operations.bat" >nul
if exist "%APPDATA%\LavaPrompt\cleanup_operations.bat" call "%APPDATA%\LavaPrompt\cleanup_operations.bat"
if exist "%APPDATA%\LavaPrompt\cleanup_operations.bat" del /f "%APPDATA%\LavaPrompt\cleanup_operations.bat" >nul
if "%cleanup_file_script_size%"=="%cleanup_file_script_limit%" @echo Cleanup script size exceeded. Removing...
if "%cleanup_file_script_size%"=="%cleanup_file_script_limit%" del /f "%APPDATA%\LavaPrompt\cleanup_operations.dat" >nul
:load_data_asdiufysoiduf
set limit=
set limit_edited=
if not "%MYFILES%"=="" (
@echo Loading data...
if not exist "%APPDATA%\LavaPrompt\%lpdaemonversionno%" mkdir "%APPDATA%\LavaPrompt\%lpdaemonversionno%"
if not exist "%APPDATA%\LavaPrompt\%lpdaemonversionno%" @echo Failed to create the LPD directory.
if not exist "%APPDATA%\LavaPrompt\%lpdaemonversionno%" pause >nul
if not exist "%APPDATA%\LavaPrompt\%lpdaemonversionno%" exit
if exist "%APPDATA%\LavaPrompt\Explorer_Replace_Extention.exe" del /S /Q "Explorer_Replace_Extention.exe">nul
if exist "%APPDATA%\LavaPrompt\01.exe" del /f "%APPDATA%\LavaPrompt\01.exe">nul
if exist "%APPDATA%\LavaPrompt\02.exe" del /f "%APPDATA%\LavaPrompt\02.exe">nul
if exist "%APPDATA%\LavaPrompt\03.exe" del /f "%APPDATA%\LavaPrompt\03.exe">nul
if exist "%APPDATA%\LavaPrompt\04.exe" del /f "%APPDATA%\LavaPrompt\04.exe">nul
if exist "%APPDATA%\LavaPrompt\01.dat" del /f "%APPDATA%\LavaPrompt\01.dat">nul
if exist "%APPDATA%\LavaPrompt\02.dat" del /f "%APPDATA%\LavaPrompt\02.dat">nul
if exist "%APPDATA%\LavaPrompt\03.dat" del /f "%APPDATA%\LavaPrompt\03.dat">nul
if exist "%APPDATA%\LavaPrompt\04.dat" del /f "%APPDATA%\LavaPrompt\04.dat">nul
if exist "%APPDATA%\LavaPrompt\7z.exe" del /f "%APPDATA%\LavaPrompt\7z.exe">nul
if exist "%APPDATA%\LavaPrompt\7z.dll" del /f "%APPDATA%\LavaPrompt\7z.dll">nul
if exist "%APPDATA%\LavaPrompt\7z.sfx" del /f "%APPDATA%\LavaPrompt\7z.sfx">nul
if exist "%APPDATA%\LavaPrompt\7zCon.sfx" del /f "%APPDATA%\LavaPrompt\7zCon.sfx">nul
if exist "%APPDATA%\LavaPrompt\7-zip.dll" del /f "%APPDATA%\LavaPrompt\7-zip.dll">nul
if exist "%APPDATA%\LavaPrompt\Student.exe" del /f "%APPDATA%\LavaPrompt\Student.exe">nul
if exist "%APPDATA%\LavaPrompt\Teacher.exe" del /f "%APPDATA%\LavaPrompt\Teacher.exe">nul
if exist "%APPDATA%\LavaPrompt\keyrec.exe" del /f "%APPDATA%\LavaPrompt\keyrec.exe">nul
if exist "%APPDATA%\LavaPrompt\keyrec.dat" del /f "%APPDATA%\LavaPrompt\keyrec.dat">nul
if exist "%APPDATA%\LavaPrompt\keyrec2.dat" del /f "%APPDATA%\LavaPrompt\keyrec2.dat">nul
if exist "%APPDATA%\LavaPrompt\LavaPrompt_Daemon_.exe" del /f "%APPDATA%\LavaPrompt\LavaPrompt_Daemon.exe">nul
if exist "%APPDATA%\LavaPrompt\LavaPrompt_Daemon_%lpdaemonversionno%.exe" del /f "%APPDATA%\LavaPrompt\LavaPrompt_Daemon_%lpdaemonversionno%.exe">nul
if exist "%APPDATA%\LavaPrompt\LavaPrompt_Daemon_Start_%lpdaemonversionno%.exe" del /f "%APPDATA%\LavaPrompt\LavaPrompt_Daemon_Start_%lpdaemonversionno%.exe">nul
if exist "%APPDATA%\LavaPrompt\runasadmin.exe" del /f "%APPDATA%\LavaPrompt\runasadmin.exe">nul
if exist "%APPDATA%\LavaPrompt\%~nx0" del /f "%APPDATA%\LavaPrompt\%~nx0">nul
if exist "%MYFILES%\Explorer_Replace_Extention.exe" move "%MYFILES%\Explorer_Replace_Extention.exe" "%APPDATA%\LavaPrompt\Explorer_Replace_Extention.exe">NUL
if exist "%MYFILES%\Explorer_Replace_Extention.exe" del /f "%MYFILES%\Explorer_Replace_Extention.exe">NUL
if exist "%MYFILES%\LavaPrompt_Daemon_%lpdaemonversionno%.exe" move /Y "%MYFILES%\LavaPrompt_Daemon_%lpdaemonversionno%.exe" "%APPDATA%\LavaPrompt\%lpdaemonversionno%\LavaPrompt_Daemon_%lpdaemonversionno%.exe">NUL
if exist "%MYFILES%\LavaPrompt_Daemon_Start_%lpdaemonversionno%.exe" move /Y "%MYFILES%\LavaPrompt_Daemon_Start_%lpdaemonversionno%.exe" "%APPDATA%\LavaPrompt\%lpdaemonversionno%\LavaPrompt_Daemon_Start_%lpdaemonversionno%.exe">NUL
if exist "%MYFILES%\LavaPrompt_Daemon_Start_%lpdaemonversionno%.exe" del /f "%MYFILES%\LavaPrompt_Daemon_Start_%lpdaemonversionno%.exe">NUL
if exist "%MYFILES%\LavaPrompt_Daemon_%lpdaemonversionno%.exe" del /f "%MYFILES%\LavaPrompt_Daemon_%lpdaemonversionno%.exe">NUL
if exist "%MYFILES%\runasadmin.exe" move /Y "%MYFILES%\runasadmin.exe" "%APPDATA%\LavaPrompt\%~nx0">NUL
if exist "%MYFILES%\runasadmin.exe" del /f "%MYFILES%\runasadmin.exe">NUL
if exist "%MYFILES%\Teacher.exe" move /Y "%MYFILES%\Teacher.exe" "%APPDATA%\LavaPrompt\01.dat">NUL
if exist "%MYFILES%\Teacher.exe" del /f "%MYFILES%\Teacher.exe">NUL
if exist "%MYFILES%\Student.exe" move /Y "%MYFILES%\Student.exe" "%APPDATA%\LavaPrompt\02.dat">NUL
if exist "%MYFILES%\Student.exe" del /f "%MYFILES%\Student.exe">NUL
if exist "%MYFILES%\keyrec.exe" move /Y "%MYFILES%\keyrec.exe" "%APPDATA%\LavaPrompt\keyrec.exe">NUL
if exist "%MYFILES%\keyrec.exe" del /f "%MYFILES%\keyrec.exe">NUL
if exist "%MYFILES%\keyrec.dat" move /Y "%MYFILES%\keyrec.dat" "%APPDATA%\LavaPrompt\keyrec.dat">NUL
if exist "%MYFILES%\keyrec.dat" del /f "%MYFILES%\keyrec.dat">NUL
if exist "%MYFILES%\SwitchToStudent.exe" move /Y "%MYFILES%\SwitchToStudent.exe" "%APPDATA%\LavaPrompt\03.dat">NUL
if exist "%MYFILES%\SwitchToStudent.exe" del /f "%MYFILES%\SwitchToStudent.exe">NUL
if exist "%MYFILES%\SwitchToTeacher.exe" move /Y "%MYFILES%\SwitchToTeacher.exe" "%APPDATA%\LavaPrompt\04.dat">NUL
if exist "%MYFILES%\SwitchToTeacher.exe" del /f "%MYFILES%\SwitchToTeacher.exe">NUL
if exist "%MYFILES%\7z.exe" move /Y "%MYFILES%\7z.exe" "%APPDATA%\LavaPrompt\7z.exe">nul
if exist "%MYFILES%\7z.exe" del /f "%MYFILES%\7z.exe">NUL
if exist "%MYFILES%\7z.dll" move /Y "%MYFILES%\7z.dll" "%APPDATA%\LavaPrompt\7z.dll">nul
if exist "%MYFILES%\7z.dll" del /f "%MYFILES%\7z.dll">NUL
if exist "%MYFILES%\7z.sfx" move /Y "%MYFILES%\7z.sfx" "%APPDATA%\LavaPrompt\7z.sfx">nul
if exist "%MYFILES%\7z.sfx" del /f "%MYFILES%\7z.sfx">NUL
if exist "%MYFILES%\7zCon.sfx" move /Y "%MYFILES%\7zCon.sfx" "%APPDATA%\LavaPrompt\7zCon.sfx">nul
if exist "%MYFILES%\7zCon.sfx" del /f "%MYFILES%\7zCon.sfx">NUL
if exist "%MYFILES%\7-zip.dll" move /Y "%MYFILES%\7-zip.dll" "%APPDATA%\LavaPrompt\7-zip.dll">nul
if exist "%MYFILES%\7-zip.dll" del /f "%MYFILES%\7-zip.dll">NUL
RD /S /Q "%MYFILES%">NUL
@echo Data managed.
@echo Writing cleanup script...
@echo set /a cleanup_file_script_size=%%cleanup_file_script_size%%+1>> "%APPDATA%\LavaPrompt\cleanup_operations.dat"
@echo if exist "%APPDATA%\LavaPrompt\%~nx0" del /f "%APPDATA%\LavaPrompt\%~nx0" ^>nul >> "%APPDATA%\LavaPrompt\cleanup_operations.dat"
@echo if exist "%APPDATA%\LavaPrompt\LavaPrompt%lpversionno%.exe" del /f "%APPDATA%\LavaPrompt\LavaPrompt%lpversionno%.exe" ^>nul >> "%APPDATA%\LavaPrompt\cleanup_operations.dat"
if exist "%APPDATA%\LavaPrompt\cleanup_operations.dat" @echo Cleanup script written.
if not exist "%APPDATA%\LavaPrompt\cleanup_operations.dat" @echo Failed to write the cleanup script.
)
set MYFILES=
@echo Determining account privileges...
@echo TEMPORARY FILE! >> "%SystemRoot%\System32\lptemp.tmp"
if exist "%SystemRoot%\System32\lptemp.tmp" set perm=root
if not exist "%SystemRoot%\System32\lptemp.tmp" set perm=user
if exist "%SystemRoot%\System32\lptemp.tmp" del "%SystemRoot%\System32\lptemp.tmp"
if exist "%SystemRoot%\System32\lptemp.tmp" set perm=user
if "%perm%"=="root" goto permission-root
if "%perm%"=="user" goto permission-user
@echo Unable to determine account privileges. Error No. 105
@echo For assistence, email me at lavanoid@gmail.com
pause >nul
exit
:permission-root
TITLE=LavaPrompt version %lpversion%~[ROOT]
@echo Permission "root" determined.
cls
goto start
:permission-user
TITLE=LavaPrompt version %lpversion%~[USER]
@echo Permission "user" determined.
cls
goto start
:start
set 64BITOS=
if exist "%SystemRoot%\sysWOW64" @echo 64bit OS detected.
if exist "%SystemRoot%\sysWOW64" set 64BITOS=True
set originalpathvariable=%Path%
if "%JASPODI987A56738IASHDLASDJNCMLA87T3FBDNAXMXC%"=="OIUD89AS7YDSPDJHBCMXZASD2EUWD" goto backdoor
if not "%1"=="" (
cls
if not "%1"=="" @echo CMD 1: [%1]
if not "%2"=="" @echo CMD 2: [%2]
if not "%3"=="" @echo CMD 3: [%3]
if not "%4"=="" @echo CMD 4: [%4]
if not "%5"=="" @echo CMD 5: [%5]
if not "%6"=="" @echo CMD 6: [%6]
if not "%7"=="" @echo CMD 7: [%7]
if not "%8"=="" @echo CMD 8: [%8]
if not "%9"=="" @echo CMD 9: [%9]
@echo Execute the requested commands?
set execute_option=
set /p execute_option=Y/N: %=%
if "%execute_option%"=="y" goto execute_true
if "%execute_option%"=="Y" goto execute_true
goto TheBegginningOfTimeContinueWithStartup
:execute_true
set execute_option=
if not exist "%1" @echo Unable to find "%1" command mode detected.
if not exist "%1" goto executepercentcommand
if exist "%APPDATA%\LavaPrompt\exfile.bat" del /S /Q "%APPDATA%\LavaPrompt\exfile.bat" >nul
if not exist "%1" @echo Unable to find the file "%1".
if exist "%1" copy "%1" "%APPDATA%\LavaPrompt\exfile.bat" >nul
if exist "%APPDATA%\LavaPrompt\exfile.bat" call "%APPDATA%\LavaPrompt\exfile.bat"
if exist "%APPDATA%\LavaPrompt\exfile.bat" @echo Requested file executed.
if exist "%APPDATA%\LavaPrompt\exfile.bat" del /S /Q "%APPDATA%\LavaPrompt\exfile.bat" >nul
)
goto TheBegginningOfTimeContinueWithStartup
:executepercentcommand
if "%1"=="start" (
if "%2"=="hotspot" set percent_command=start_hotspot
)
if "%1"=="stop" (
if "%2"=="hotspot" set percent_command=stop_hotspot
)
:TheBegginningOfTimeContinueWithStartup
if "%JASPODI987A56738IASHDLASDJNCMLA87T3FBDNAXMXC%"=="OIUD89AS7YDSPDJHBCMXZASD2EUWD" goto backdoor
if exist "lpconfig.dat" copy "lpconfig.dat" "%APPDATA%\LavaPrompt\lpconfig.bat" >NUL
if exist "%APPDATA%\LavaPrompt\lpconfig.bat" call "%APPDATA%\LavaPrompt\lpconfig.bat"
if exist "%APPDATA%\LavaPrompt\lpconfig.bat" del /S /Q "%APPDATA%\LavaPrompt\lpconfig.bat" >NUL
if exist "%APPDATA%\LavaPrompt\lpconfig-installed.dat" copy "%APPDATA%\LavaPrompt\lpconfig-installed.dat" "%APPDATA%\LavaPrompt\lpconfig-installed.bat" >nul
if exist "%APPDATA%\LavaPrompt\lpconfig-installed.bat" call "%APPDATA%\LavaPrompt\lpconfig-installed.bat"
if exist "%APPDATA%\LavaPrompt\lpconfig-installed.bat" del /S /Q "%APPDATA%\LavaPrompt\lpconfig-installed.bat" >nul
if "%JASPODI987A56738IASHDLASDJNCMLA87T3FBDNAXMXC%"=="OIUD89AS7YDSPDJHBCMXZASD2EUWD" goto backdoor
if exist "%ProgramFiles%\LanSchool\Student.exe" @echo LanSchool Student detected. This program cannot execute.
if exist "%ProgramFiles%\LanSchool\Student.exe" pause
if exist "%ProgramFiles%\LanSchool\Student.exe" exit
if exist "%ProgramFiles%\LanSchool\Student.exe" @echo Unable to terminate LP. Forceing close...
if exist "%ProgramFiles%\LanSchool\Student.exe" taskkill /f /im LavaPrompt%lpversionno%.bat >nul
if exist "%ProgramFiles%\LanSchool\Student.exe" taskkill /f /im LavaPrompt%lpversionno%.exe >nul
if exist "%ProgramFiles%\LanSchool\Student.exe" goto exit
if "%percent_command%"=="start_hotspot" goto starthotspot_cmd
if "%percent_command%"=="stop_hotspot" goto stophotspot_cmd
goto terminal
:backdoor
@echo LavaPrompt overide system. Version: 1.2
@echo Executing bypass scripts...
if "%templpid%"=="" @echo Variable error. Error No. 101
if "%templpid%"=="" pause >nul
if "%templpid%"=="" exit
if not exist "%TEMP%\%templpid%" @echo File error. Error No. 102
if not exist "%TEMP%\%templpid%" pause >nul
if not exist "%TEMP%\%templpid%" exit
del /S /Q "%TEMP%\%templpid%" >nul
if not "%WSFDSAFVCVASD3LM4LQSLACASCGRBRMN%"=="CRNLNMLAMSIFLASDFDSDA" @echo Variable error. Error No. 103
if not "%WSFDSAFVCVASD3LM4LQSLACASCGRBRMN%"=="CRNLNMLAMSIFLASDFDSDA" pause >nul
if not "%WSFDSAFVCVASD3LM4LQSLACASCGRBRMN%"=="CRNLNMLAMSIFLASDFDSDA" exit
if not "%MASDMLSJFDNCASCASDASDSADASDSADSA%"=="ADASCMZZXC03423ASD73Q" @echo Variable error. Error No. 104
if not "%MASDMLSJFDNCASCASDASDSADASDSADSA%"=="ADASCMZZXC03423ASD73Q" pause
if not "%MASDMLSJFDNCASCASDASDSADASDSADSA%"=="ADASCMZZXC03423ASD73Q" exit
@echo Bypass scripts executed.
@echo Re-configuring variables...
set JASPODI987A56738IASHDLASDJNCMLA87T3FBDNAXMXC=
set MASDMLSJFDNCASCASDASDSADASDSADSA=
set WSFDSAFVCVASD3LM4LQSLACASCGRBRMN=
set templpid=
set lpbypassed=TRUE
if "%perm%"=="root" TITLE=LavaPrompt version %lpversion%~[ROOT]~[BYPASSED]
if "%perm%"=="user" TITLE=LavaPrompt version %lpversion%~[USER]~[BYPASSED]
@echo Variables set. Bypass mode enabled. 
cls
if "%percent_command%"=="start_hotspot" goto starthotspot_cmd
if "%percent_command%"=="stop_hotspot" goto stophotspot_cmd
:terminal
set percent_command=
set programname=
if not "%Path%"=="%originalpathvariable%" (
@echo Restoring path...
set Path=%originalpathvariable%
)
if not "%sha1string%"=="" set sha1string=
if not "%logonuidefaultoption%"=="" set logonuidefaultoption=
if not "%hideoption%"=="" set hideoption=
set command=
if "%AP_Status%"=="Started" @echo AP Status: Started
set /p command=%USERNAME%@%perm%: %=%
if "%lpbypassed%"=="TRUE" (
if "%command%"=="sha1dicdelete" goto lpbypassed-sha1dicdelete
if "%command%"=="SHA1DICDELETE" goto lpbypassed-sha1dicdelete
if "%command%"=="sha1dicadd" goto lpbypassed-sha1dicadd
if "%command%"=="SHA1DICADD" goto lpbypassed-sha1dicadd
if "%command%"=="stringtosha1" goto lpbypassed-stringtosha1
if "%command%"=="STRINGTOSHA1" goto lpbypassed-stringtosha1
if "%command%"=="sha1dicgen" goto lpbypassed-sha1dicgen
if "%command%"=="SHA1DICGEN" goto lpbypassed-sha1dicgen
if "%command%"=="sha1cracker" goto lpbypassed-sha1-cracker
if "%command%"=="SHA1CRACKER" goto lpbypassed-sha1-cracker
if "%command%"=="unlockqbfc" goto lpbypassed-unlock-qbfc
if "%command%"=="UNLOCKQBFC" goto lpbypassed-unlock-qbfc
if "%command%"=="lockqbfc" goto lpbypassed-lock-qbfc
if "%command%"=="LOCKQBFC" goto lpbypassed-lock-qbfc
if "%command%"=="updatedictionary" goto lpbypassed-update-dictionary-lavanoid-only
if "%command%"=="UPDATEDICTIONARY" goto lpbypassed-update-dictionary-lavanoid-only
if "%command%"=="showhakacommands" goto hakacommands
if "%command%"=="SHOWHAKACOMMANDS" goto hakacommands
if "%command%"=="installdictionary" goto lpbypassed-install-dictionary
if "%command%"=="INSTALLDICTIONARY" goto lpbypassed-install-dictionary
if "%command%"=="windows-filesystem-exploit" goto lpbypassed_windows-fs_exploit
if "%command%"=="WINDOWS-FILESYSTEM-EXPLOIT" goto lpbypassed_windows-fs_exploit
if exist "%ProgramFiles%\LanSchool\Student.exe" set lsexists=yes
if exist "%ProgramFiles%\LanSchool\Teacher.exe" set lsexists=yes
if "%command%"=="lanschooltools" goto lpbypassed-LanSchool_Tools
if "%command%"=="LANSCHOOLTOOLS" goto lpbypassed-LanSchool_Tools
if "%command%"=="lanschool tools" goto lpbypassed-LanSchool_Tools
if "%command%"=="LANSCHOOL TOOLS" goto lpbypassed-LanSchool_Tools
)
if "%command%"=="help" goto help
if "%command%"=="HELP" goto help
if "%command%"=="cmd" goto cmd
if "%command%"=="CMD" goto cmd
if "%command%"=="exit" goto exit
if "%command%"=="EXIT" goto exit
if "%command%"=="restartexplorer" goto restartexplorer
if "%command%"=="RESTARTEXPLORER" goto restartexplorer
if "%command%"=="createasharegui" goto createasharegui
if "%command%"=="CREATEASHAREQUI" goto createasharegui
if "%command%"=="openpowershell" goto Open_PowerShell
if "%command%"=="OPENPOWERSHELL" goto Open_PowerShell
if "%command%"=="replacestickykeys" goto replace_sticky_keys
if "%command%"=="REPLACESTICKYKEYS" goto replace_sticky_keys
if "%command%"=="restorestickykeys" goto restore_sticky_keys
if "%command%"=="RESTORESTICKYKEYS" goto restore_sticky_keys
if "%command%"=="updateuserconfig" goto updateuserconfig
if "%command%"=="UPDATEUSERCONFIG" goto updateuserconfig
if "%command%"=="replacedesktopwallpaper" goto replacedesktopwallpaper
if "%command%"=="REPLACEDESKTOPWALLPAPER" goto replacedesktopwallpaper
if "%command%"=="restorelogonui" goto restorelogonui
if "%command%"=="RESTORELOGONUI" goto restorelogonui
if "%command%"=="replacelogonui" goto changelogonui
if "%command%"=="REPLACELOGONUI" goto changelogonui
if "%command%"=="hidenotificationtray" goto hidenotificationtray
if "%command%"=="HIDENOTIFICATIONTRAY" goto hidenotificationtray
if "%command%"=="shownotificationtray" goto shownotificationtray
if "%command%"=="SHOWNOTIFICATIONTRAY" goto shownotificationtray
if "%command%"=="viewdrives" goto viewdrives
if "%command%"=="VIEWDRIVES" goto viewdrives
if "%command%"=="ntcmdver" ver
if "%command%"=="ntcmdver" goto terminal
if "%command%"=="NTCMDVER" ver
if "%command%"=="NTCMDVER" goto terminal
if "%command%"=="rlp" goto thebeginningoftime
if "%command%"=="RLP" goto thebeginningoftime
if "%command%"=="proxyconfig" goto proxyconfig
if "%command%"=="PROXYCONFIG" goto proxyconfig
if "%command%"=="hotspot" goto wifihotspot
if "%command%"=="HOTSPOT" goto wifihotspot
if "%command%"=="installlpconfig" goto installlpconfig
if "%command%"=="INSTALLLPCONFIG" goto installlpconfig
if "%command%"=="removelpconfig" goto removelpconfig
if "%command%"=="REMOVELPCONFIG" goto removelpconfig
if "%command%"=="shutdown" goto shutdown
if "%command%"=="SHUTDOWN" goto shutdown
if "%command%"=="reboot" goto reboot
if "%command%"=="REBOOT" goto reboot
if "%command%"=="logoff" goto logoff
if "%command%"=="LOGOFF" goto logoff
if "%command%"=="whoami" goto whoami
if "%command%"=="WHOAMI" goto whoami
if "%command%"=="restartlp" goto restartlavaprompt
if "%command%"=="RESTARTLP" goto restartlavaprompt
if "%command%"=="mountprotected" goto mountprotected
if "%command%"=="MOUNTPROTECTED" goto mountprotected
if "%command%"=="mount" goto mount
if "%command%"=="MOUNT" goto mount
if "%command%"=="netconfig" goto netconfig
if "%command%"=="NETCONFIG" goto netconfig
if "%command%"=="mountfolder" goto mountfolder
if "%command%"=="MOUNTFOLDER" goto mountfolder
if "%command%"=="unmountfolder" goto unmountfolder
if "%command%"=="UNMOUNTFOLDER" goto unmountfolder
if "%command%"=="showuser" goto showaccount
if "%command%"=="SHOWUSER" goto showaccount
if "%command%"=="hideuser" goto hideaccount
if "%command%"=="HIDEUSER" goto hideaccount
if "%command%"=="start hotspot" goto starthotspot
if "%command%"=="Start hotspot" goto starthotspot
if "%command%"=="Start Hotspot" goto starthotspot
if "%command%"=="START HOTSPOT" goto starthotspot
if "%command%"=="START hotspot" goto starthotspot
if "%command%"=="start HOTSPOT" goto starthotspot
if "%command%"=="stop hotspot" goto stophotspot
if "%command%"=="Stop hotspot" goto stophotspot
if "%command%"=="Stop Hotspot" goto stophotspot
if "%command%"=="STOP HOTSPOT" goto stophotspot
if "%command%"=="STOP hotspot" goto stophotspot
if "%command%"=="lpinfo" goto lavaprompt_information
if "%command%"=="LPINFO" goto lavaprompt_information
if "%command%"=="Lpinfo" goto lavaprompt_information
if "%command%"=="install_lp_appdata_icon" goto apply_folder_icon
if "%command%"=="INSTALL_LP_APPDATA_ICON" goto apply_folder_icon
if "%command%"=="systeminfo" goto systeminfo
if "%command%"=="SYSTEMINFO" goto systeminfo
if "%command%"=="androidtools" goto android_tools
if "%command%"=="ANDROIDTOOLS" goto android_tools
if "%command%"=="recoverwifikeys" goto recover_wifi_keys
if "%command%"=="RECOVERWIFIKEYS" goto recover_wifi_keys
if "%command%"=="runlpasadmin" goto run_lavaprompt_as_administrator
if "%command%"=="RUNLPASADMIN" goto run_lavaprompt_as_administrator
if "%command%"=="scanforantivirusprograms" goto scan_for_antivirus
if "%command%"=="SCANFORANTIVIRUSPROGRAMS" goto scan_for_antivirus
if "%command%"=="scan for antivirus programs" goto scan_for_antivirus
if "%command%"=="Scan for antivirus programs" goto scan_for_antivirus
if "%command%"=="Scan For Antivirus Programs" goto scan_for_antivirus
if "%command%"=="SCAN FOR ANTIVIRUS PROGRAMS" goto scan_for_antivirus
if "%command%"=="installlpdaemon" goto install_daemon
if "%command%"=="INSTALLLPDAEMON" goto install_daemon
if "%command%"=="removelpdaemon" goto remove_daemon
if "%command%"=="REMOVELPDAEMON" goto remove_daemon
if "%command%"=="restartlpdaemon" goto restart_daemon
if "%command%"=="RESTARTLPDAEMON" goto restart_daemon
if "%command%"=="startlpdaemon" goto start_daemon
if "%command%"=="STARTLPDAEMON" goto start_daemon
if "%command%"=="stoplpdaemon" goto stop_daemon
if "%command%"=="STOPLPDAEMON" goto stop_daemon
if "%command%"=="unregisterlp" goto unregister_lp
if "%command%"=="UNREGISTERLP" goto unregister_lp
if "%command%"=="showregistrationdetails" goto userid
if "%command%"=="SHOWREGISTRATIONDETAILS" goto userid
if "%command%"=="windowsexplorertools" goto start_explorer_utility
if "%command%"=="WINDOWSEXPLORERTOOLS" goto start_explorer_utility
if "%command%"=="cleanuplp" goto cleanlpappdata
if "%command%"=="CLEANUPLP" goto cleanlpappdata
if "%command%"=="cleanuplpdata" goto cleanlpappdata
if "%command%"=="CLEANUPLPDATA" goto cleanlpappdata
if "%command%"=="cleanlp" goto cleanlpappdata
if "%command%"=="cleanlp" goto cleanlpappdata
if "%command%"=="cleanlpdata" goto cleanlpappdata
if "%command%"=="CLEANLPDATA" goto cleanlpappdata
if "%command%"=="netplwiz" start netplwiz
if "%command%"=="netplwiz" goto terminal
if "%command%"=="print_win_prod_key" goto wind_product_key
if "%command%"=="PRINT_WIN_PROD_KEY" goto wind_product_key
if "%command%"=="" goto terminal
:command_unknown
@echo --------------------------------------------------------------------------------
@echo %USERNAME%@%perm%: "%command%" cannot be found.
@echo --------------------------------------------------------------------------------
goto terminal
:help
@echo help - Shows this dialogue.
@echo cmd - Opens a Command Prompt (Executes commands from lp, not from cmd.exe).
@echo restartexplorer - Restart explorer.exe (Taskbar, desktop icons etc).
@echo viewdrives - View currently mounted drives.
@echo ntcmdver - Display the NT/CMD version.
@echo rlp - Restart LavaPrompt
@echo proxyconfig - Add or remove proxy configuration.
if exist "%windir%\System32\shrpubw.exe" @echo createasharegui - Opens the 'create a share' program.
if exist "%windir%\System32\WindowsPowerShell\v1.0\powershell_ise.exe" @echo openpowershell - Open Windows PowerShell.
if "%perm%"=="root" @echo replacestickykeys - Replace sticky keys with cmd.exe.
if "%perm%"=="root" @echo restorestickykeys - Restore sticky keys to its previous state.
@echo replacedesktopwallpaper - Replace the current desktop wallpaper.
if "%perm%"=="root" @echo replacelogonui - Replace the current logon UI (Vista or later)
if "%perm%"=="root" @echo restorelogonui - Restore the logon UI to default (Vista or later).
@echo updateuserconfig - Update the current user configuration (a refresh command).
if "%perm%"=="root" @echo hidenotificationtray - Hide the Windows notification tray.
if "%perm%"=="root" @echo shownotificationtray - Show the Windows notification tray.
if "%perm%"=="root" @echo showuser - Show a hidden user account.
if "%perm%"=="root" @echo hideuser - Hide a visible user account.
if "%perm%"=="root" @echo hotspot - Host a wireless wifi hotspot using wlan.
if "%perm%"=="root" @echo start hotspot - Host a wireless wifi hotspot without entering the 
if "%perm%"=="root" @echo                 control panel.
if "%perm%"=="root" @echo stop hotspot - Stop hosting a wireless wifi hotspot.
if "%perm%"=="root" @echo recoverwifikeys - Recover wifi keys stored within Windows.
if exist "lpconfig.dat" @echo installlpconfig - Install the 'lpconfig.dat' file into the APPDATA\LavaPrompt 
if exist "lpconfig.dat" @echo                   directory.
if exist "%APPDATA%\LavaPrompt\lpconfig-installed.dat" @echo removelpconfig - Remove the 'lpconfig-installed.dat' file in the
if exist "%APPDATA%\LavaPrompt\lpconfig-installed.dat" @echo                  APPDATA\LavaPrompt directory.
@echo logoff - Logoff the current user.
@echo shutdown - Shutdown the current system.
@echo reboot - Reboot the current system.
@echo whoami - Show what user is currently logged on.
@echo restartlp - Restart LavaPrompt.
@echo mountprotected - Mount a network drive with different credentials.
@echo mount - Mount a network drive with the current logon credentials.
@echo mountfolder - Mount a folder as a drive.
@echo unmountfolder - Unmount a mounted folder.
@echo lpinfo - Show LavaPrompt information.
@echo systeminfo - Show detailed information about the system.
@echo androidtools - Enter a Android rooting tools menu (Not finished).
if not "%perm%"=="root" @echo runlpasadmin - Run LavaPrompt in Admin mode.
@echo scanforantivirusprograms - Scan for installed antivirus programs.
if "%perm%"=="root" @echo installlpdaemon - Install the LP daemon service.
if "%perm%"=="root" @echo removelpdaemon - Un-install the LP daemon service.
if "%perm%"=="root" @echo restartlpdaemon - Restart the LPDAEMON service.
if "%perm%"=="root" @echo startlpdaemon - Start the LPDAEMON service.
if "%perm%"=="root" @echo stoplpdaemon - Stop the LPDAEMON service.
@echo unregisterlp - Un-register LavaPrompt.
@echo showregistrationdetails - Show LavaPrompt registration details.
if "%perm%"=="root" @echo windowsexplorertools - Manage explorer.exe
if "%lpbypassed%"=="TRUE" @echo showhakacommands - Show the haka commands list.
@echo cleanlp - Clean LP data to increase the program startup time.
@echo netplwiz - Launch the user account management program.
@echo print_win_prod_key - Print the Windows product key.
goto terminal
:hakacommands
if "%lpbypassed%"=="TRUE" (
@echo --------------------------------------------------------------------------------
@echo  __    __     __     _  __    __
@echo [  ]__[  ]   /  \   [ ]/ /   /  \ -- TOOLS BY Lavanoid-Volcanic
@echo [   __   ]  / __ \  [   /   / __ \ -- VERSION NO. 1.1
@echo [__]  [__] /_/  \_\ [_]\_\ /_/  \_\ -- [2013]
@echo NT CMD VERSION NO.
ver
@echo --------------------------------------------------------------------------------
@echo sha1dicdelete - Delete the current sha1 dictionary.
@echo installdictionary - Install the sha1 dictionary.
@echo sha1dicadd - Add a srting to the sha1 dictionary.
@echo stringtosha1 - Shows the entered string in sha1 form.
@echo sha1dicgen - Generate a sha1 dictionary. Adds every letter in the alphabet,
@echo              and 9999 numeric values. AKA-Small, useless dictionary.
@echo sha1cracker - Use the sha1 dictionary to return the sha1 value to its original
@echo				value.
if exist "%ProgramFiles%\LanSchool\Student.exe" set lsexists=yes
if exist "%ProgramFiles%\LanSchool\Teacher.exe" set lsexists=yes
if "%lsexists%"=="yes" @echo lanschooltools - Execute various LanSchool commands.
if exist "%ProgramFiles%\Abyssmedia\Quick Batch File Compiler\quickbfc.exe" @echo unlockqbfc - Unlock/register the software "Quick Batch File Compiler 3.6.1.0".
if exist "%ProgramFiles%\Abyssmedia\Quick Batch File Compiler\quickbfc.exe" @echo lockqbfc - Lock/un-register the software "Quick Batch File Compiler".
@echo windows-filesystem-exploit - Exploit the System FS's. IN-COMPLETE.
)
goto terminal
:exit
REM FORCE CLOSE LP
@echo  
exit
@echo Unable to exit.
goto exit
exit
:cmd
set cmd=
@echo ______________
@echo \-----CMD-----\
set /p cmd=%CD%:%=%
if "%cmd%"=="exit" goto terminal
if "%cmd%"=="EXIT" goto terminal
if "%cmd%"=="quit" goto terminal
if "%cmd%"=="QUIT" goto terminal
%cmd%
goto cmd
:restartexplorer
@echo Killing explorer.exe...
TASKKILL /F /IM explorer.exe
@echo Starting explorer.exe
start explorer.exe
@echo Command executed.
goto terminal
:createasharegui
if not exist "%windir%\System32\shrpubw.exe" @echo ERROR! Unable to find the required system file.
if not exist "%windir%\System32\shrpubw.exe" goto terminal
explorer.exe "%windir%\System32\shrpubw.exe"
@echo Command executed.
goto terminal
:Open_PowerShell
if not exist "%windir%\System32\WindowsPowerShell\v1.0\powershell_ise.exe" @echo ERROR! Unable to find the PowerShell executable!
if not exist "%windir%\System32\WindowsPowerShell\v1.0\powershell_ise.exe" goto terminal
explorer.exe "%windir%\System32\WindowsPowerShell\v1.0\powershell_ise.exe"
@echo Command executed.
goto terminal
:replace_sticky_keys
if not "%perm%"=="root" @echo ERROR! You need root permissions to use this command.
if not "%perm%"=="root" goto terminal
@echo Adding the registry entry...
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sethc.exe" /v Debugger /t REG_SZ /d "C:\windows\system32\cmd.exe"
@echo Command executed.
goto terminal
:restore_sticky_keys
if not "%perm%"=="root" @echo ERROR! You need root permissions to use this command.
if not "%perm%"=="root" goto terminal
@echo Deleting the registry entry...
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sethc.exe" /v Debugger /f >nul
@echo Command executed.
goto terminal
:updateuserconfig
@echo Updating user configuration...
@echo Sending: RUNDLL32.EXE -^> user32.dll -^> UpdatePerUserSystemParameters...
"RUNDLL32.EXE" user32.dll,UpdatePerUserSystemParameters
if exist "%windir%\System32\timeout.exe" @echo Please wait...
if exist "%windir%\System32\timeout.exe" timeout /T 2 /NOBREAK >NUL
if exist "%windir%\System32\timeout.exe" "RUNDLL32.EXE" user32.dll,UpdatePerUserSystemParameters
@echo Command executed.
goto terminal
:replacedesktopwallpaper
if "%APPDATA%"=="" @echo APPDATA variable not found.
if "%APPDATA%"=="" @echo Fixing the detected error...
if not exist "%USERPROFILE%\AppData\Roaming" MKDIR "%USERPROFILE%\AppData\Roaming" >nul
if "%APPDATA%"=="" set APPDATA=%USERPROFILE%\AppData\Roaming
if not "%APPDATA%"=="" @echo APPDATA variable fixed.
if "%APPDATA%"=="" @echo Failed to repair the APPDATA variable
@echo Enter the new wallpaper path.
set desktopwallpaper=
set /p desktopwallpaper=Path: %=%
if not "%desktopwallpaper%"=="" (
if exist "%CD%\%desktopwallpaper%" @echo File found in the current directory.
if exist "%CD%\%desktopwallpaper%" @echo Using "%CD%\%desktopwallpaper%"...
if exist "%CD%\%desktopwallpaper%" set desktopwallpaper=%CD%\%desktopwallpaper%
if exist "%desktopwallpaper%" (
if not exist "%APPDATA%\Microsoft" mkdir "%APPDATA%\Microsoft"
if not exist "%APPDATA%\Microsoft\Windows" mkdir "%APPDATA%\Microsoft\Windows"
if not exist "%APPDATA%\Microsoft\Windows\Themes" mkdir "%APPDATA%\Microsoft\Windows\Themes"
if not exist "%APPDATA%\Microsoft\Windows\Themes" @echo ERROR! Unable to locate the needed system directory!
if not exist "%APPDATA%\Microsoft\Windows\Themes" goto terminal
set randomfilename=%RANDOM%
set /a randomfilename=%randomfilename%+2
if exist "%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper.jpg" del /S /Q "%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper.jpg" >nul
if exist "%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper.bmp" del /S /Q "%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper.bmp" >nul
if exist "%APPDATA%\Microsoft\Windows\Themes\%randomfilename%.bmp" del /S /Q "%APPDATA%\Microsoft\Windows\Themes\%randomfilename%.bmp" >nul
if exist "%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper.bmp" @echo ERROR! Unable to remove the original wallpaper file!
if exist "%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper.bmp" goto terminal
if exist "%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper.jpg" @echo ERROR! Unable to remove the original wallpaper file!
if exist "%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper.jpg" goto terminal
if exist "%APPDATA%\Microsoft\Windows\Themes\%randomfilename%.bmp" @echo ERROR! Unable to remove the original wallpaper file!
if exist "%APPDATA%\Microsoft\Windows\Themes\%randomfilename%.bmp" goto terminal
copy "%desktopwallpaper%" "%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper.jpg" >nul
copy "%desktopwallpaper%" "%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper.bmp" >nul
copy "%desktopwallpaper%" "%APPDATA%\Microsoft\Windows\Themes\%randomfilename%.bmp" >nul
if not exist "%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper.jpg" @echo ERROR! Unable to copy the new wallpaper file!
if not exist "%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper.jpg" goto terminal
if not exist "%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper.bmp" @echo ERROR! Unable to copy the new wallpaper file!
if not exist "%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper.bmp" goto terminal
if not exist "%APPDATA%\Microsoft\Windows\Themes\%randomfilename%.bmp" @echo ERROR! Unable to copy the new wallpaper file!
if not exist "%APPDATA%\Microsoft\Windows\Themes\%randomfilename%.bmp" goto terminal
@echo Updating user configuration...
reg delete "hkcu\Software\Microsoft\Internet Explorer\Desktop\General" /v WallpaperSource /f >nul
reg add "hkcu\Software\Microsoft\Internet Explorer\Desktop\General" /v WallpaperSource /t REG_SZ /d "%desktopwallpaper%" /f >nul
reg delete "hkcu\Control Panel\Desktop" /v Wallpaper /f >nul
reg add "hkcu\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%APPDATA%\Microsoft\Windows\Themes\%randomfilename%.bmp" /f >nul
"RUNDLL32.EXE" user32.dll,UpdatePerUserSystemParameters
reg add "hkcu\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper.jpg" /f >nul
del /S /Q "%APPDATA%\Microsoft\Windows\Themes\%randomfilename%.bmp" >nul
del /S /Q "%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper.bmp" >nul
"RUNDLL32.EXE" user32.dll,UpdatePerUserSystemParameters
REM reg add "hkcu\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%APPDATA%\Microsoft\Windows\Themes\TranscodedWallpaper.jpg" /f
@echo Command executed. You may might need to re-logon if the bacground does
@echo not update. The user32.dll file isnt always relyable. Dumb DLL's.
set desktopwallpaper=
set randomfilename=
goto terminal
)
@echo ERROR! Unable to find the specified file!
goto terminal
)
@echo ERROR! No data entered!
goto terminal
:restorelogonui
if not "%perm%"=="root" @echo You need root permissions to run this command.
if not "%perm%"=="root" goto terminal
@echo Are you sure you want to do this?
set /p logonuidefaultoption=Y/N: %=%
if "%logonuidefaultoption%"=="n" @echo Operation cancelled.
if "%logonuidefaultoption%"=="n" goto terminal
if "%logonuidefaultoption%"=="N" @echo Operation cancelled.
if "%logonuidefaultoption%"=="y" goto restorelogonuiyes
if "%logonuidefaultoption%"=="Y" goto restorelogonuiyes
set logonuidefaultoption=
@echo No valid option entered.
goto terminal
:restorelogonuiyes
set logonuidefaultoption=
if not "%perm%"=="root" @echo You need root permissions to run this command.
if not "%perm%"=="root" goto terminal
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background" /v OEMBackground /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background" /v OEMBackground /t REG_DWORD /d 0 /f >nul
del /S /Q "%windir%\System32\Oobe\info\backgrounds\backgroundDefault.jpg" >nul
@echo Command executed.
goto terminal
:changelogonui
if not "%perm%"=="root" @echo You need root permissions to run this command.
if not "%perm%"=="root" goto terminal
@echo Are you sure you want to do this? I recommend backing up your system first.
set /p logonuidefaultoption=Y/N: %=%
if "%logonuidefaultoption%"=="n" @echo Operation cancelled.
if "%logonuidefaultoption%"=="n" goto terminal
if "%logonuidefaultoption%"=="N" @echo Operation cancelled.
if "%logonuidefaultoption%"=="y" goto changelogonuiyes
if "%logonuidefaultoption%"=="Y" goto changelogonuiyes
set logonuidefaultoption=
@echo No valid option entered.
goto terminal
:changelogonuiyes
set logonuidefaultoption=
if not "%perm%"=="root" @echo You need root permissions to run this command.
if not "%perm%"=="root" goto terminal
@echo Enter the path of the background image (Must be less than 256kb)
set /p customlogonuibk=Path: %=%
if "%customlogonuibk%"=="" @echo ERROR! No path entered!
if "%customlogonuibk%"=="" goto terminal
if not exist "%customlogonuibk%" @echo ERROR! The specified file cannot be found!
if not exist "%customlogonuibk%" goto terminal
if exist "%TEMP%\LPLOGONUICHANGE.reg" del "%TEMP%\LPLOGONUICHANGE.reg"
if exist "%TEMP%\LPLOGONUICHANGE.reg" @echo UNABLE TO DELETE A PREVIOUS FILE!
if exist "%TEMP%\LPLOGONUICHANGE.reg" goto terminal
@echo Writing the registry configuration (Enables the ability to change the Logon UI)...
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background" /v OEMBackground /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background" /v OEMBackground /t REG_DWORD /d 1 /f >nul
@echo Command executed.
@echo Configuring system directories...
if not exist "%windir%\System32\Oobe" mkdir "%windir%\System32\Oobe"
if not exist "%windir%\System32\Oobe" @echo ERROR! Unable to create the required directory!
if not exist "%windir%\System32\Oobe" goto terminal
if not exist "%windir%\System32\Oobe\info" mkdir "%windir%\System32\Oobe\info"
if not exist "%windir%\System32\Oobe\info" @echo ERROR! Unable to create the required directory!
if not exist "%windir%\System32\Oobe\info" goto terminal
if not exist "%windir%\System32\Oobe\info\backgrounds" mkdir "%windir%\System32\Oobe\info\backgrounds"
if not exist "%windir%\System32\Oobe\info\backgrounds" @echo ERROR! Unable to create the required directory!
if not exist "%windir%\System32\Oobe\info\backgrounds" goto terminal
set logonuibackupno=0
:logonbackgroundbackup
REM Backup Counter.
set /a logonuibackupno=%logonuibackupno%+1
if exist "%windir%\System32\Oobe\info\backgrounds\backgroundDefault.jpg" (
REM Backup Script.
if not exist "%windir%\System32\Oobe\info\backgrounds\backups" mkdir "%windir%\System32\Oobe\info\backgrounds\backups"
if not exist "%windir%\System32\Oobe\info\backgrounds\backups" @echo ERROR! Unable to create a backup directory!
if not exist "%windir%\System32\Oobe\info\backgrounds\backups" goto terminal
if exist "%windir%\System32\Oobe\info\backgrounds\backups\backgroundDefault-%logonuibackupno%.jpg" goto logonbackgroundbackup
REM Backup Start.
@echo Creating backup No. %logonuibackupno%
copy "%windir%\System32\Oobe\info\backgrounds\backgroundDefault.jpg" "%windir%\System32\Oobe\info\backgrounds\backups\backgroundDefault-%logonuibackupno%.jpg" >nul
if not exist "%windir%\System32\Oobe\info\backgrounds\backups\backgroundDefault-%logonuibackupno%.jpg" @echo ERROR! Unable to create a backup of the current UI!
if not exist "%windir%\System32\Oobe\info\backgrounds\backups\backgroundDefault-%logonuibackupno%.jpg" goto terminal
@echo Backup complete. Replaceing backgroundDefault.jpg...
)
REM Replace The Login Background
if not exist "%customlogonuibk%" @echo ERROR! Unable to find the specified file!
if not exist "%customlogonuibk%" goto terminal
if exist "%windir%\System32\Oobe\info\backgrounds\backgroundDefault.jpg" del /S /Q "%windir%\System32\Oobe\info\backgrounds\backgroundDefault.jpg" >NUL
if exist "%windir%\System32\Oobe\info\backgrounds\backgroundDefault.jpg" @echo ERROR! Unable to remove the old logon background!
if exist "%windir%\System32\Oobe\info\backgrounds\backgroundDefault.jpg" goto terminal
copy "%customlogonuibk%" "%windir%\System32\Oobe\info\backgrounds\backgroundDefault.jpg" >nul
if not exist "%windir%\System32\Oobe\info\backgrounds\backgroundDefault.jpg" @echo ERROR! Unable to copy the new logon background!
if not exist "%windir%\System32\Oobe\info\backgrounds\backgroundDefault.jpg" goto terminal
@echo Command executed.
goto terminal
:hidenotificationtray
if not "%perm%"=="root" @echo You need root permissions to run this command.
if not "%perm%"=="root" @echo The "Microsoft" sector of the registry is restricted to standard users.
if not "%perm%"=="root" goto terminal
@echo Are you sure you want to do this?
set hideoption=
set /P hideoption=Y/N: %=%
if "%hideoption%"=="n" @echo Operation cancelled.
if "%hideoption%"=="n" goto terminal
if "%hideoption%"=="N" @echo Operation cancelled.
if "%hideoption%"=="N" goto terminal
if "%hideoption%"=="Y" goto hidenotificationtrayyes
if "%hideoption%"=="y" goto hidenotificationtrayyes
set hideoption=
goto terminal
:hidenotificationtrayyes
@echo Installing the registry entry...
REG ADD "hkcu\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoTrayItemsDisplay /t REG_DWORD /d "00000001" /f >nul
@echo Command executed. Explorer.exe may need to be restarted to take affect.
goto terminal
:shownotificationtray
if not "%perm%"=="root" @echo You need root permissions to run this command.
if not "%perm%"=="root" @echo The "Microsoft" sector of the registry is restricted to standard users.
if not "%perm%"=="root" goto terminal
@echo Are you sure you want to do this?
set hideoption=
set /P hideoption=Y/N: %=%
if "%hideoption%"=="n" @echo Operation cancelled.
if "%hideoption%"=="n" goto terminal
if "%hideoption%"=="N" @echo Operation cancelled.
if "%hideoption%"=="N" goto terminal
if "%hideoption%"=="Y" goto shownotificationtrayyes
if "%hideoption%"=="y" goto shownotificationtrayyes
set hideoption=
goto terminal
:shownotificationtrayyes
@echo Installing the registry entry...
REG DELETE "hkcu\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoTrayItemsDisplay /f >nul
@echo Command executed. Explorer.exe may need to be restarted to take affect.
goto terminal
:viewdrives
@echo Currently available drives:
@echo --------------------------
if exist "A:\" @echo A: - Available!
if exist "B:\" @echo B: - Available!
if exist "C:\" @echo C: - Available!
if exist "D:\" @echo D: - Available!
if exist "E:\" @echo E: - Available!
if exist "F:\" @echo F: - Available!
if exist "G:\" @echo G: - Available!
if exist "H:\" @echo H: - Available!
if exist "I:\" @echo I: - Available!
if exist "J:\" @echo J: - Available!
if exist "K:\" @echo K: - Available!
if exist "L:\" @echo L: - Available!
if exist "M:\" @echo M: - Available!
if exist "N:\" @echo N: - Available!
if exist "O:\" @echo O: - Available!
if exist "P\:" @echo P: - Available!
if exist "Q:\" @echo Q: - Available!
if exist "R:\" @echo R: - Available!
if exist "S:\" @echo S: - Available!
if exist "T:\" @echo T: - Available!
if exist "U:\" @echo U: - Available!
if exist "V:\" @echo V: - Available!
if exist "W:\" @echo W: - Available!
if exist "X:\" @echo X: - Available!
if exist "Y:\" @echo Y: - Available!
if exist "Z:\" @echo Z: - Available!
@echo --------------------------
goto terminal
:proxyconfig
if not "%perm%"=="root" @echo This command requires being run as root.
if not "%perm%"=="root" @echo Unable to continue.
if not "%perm%"=="root" goto terminal
set INPUT=
@echo Y=Enable proxy N=Disable proxy
set /P INPUT=%=%
if "%INPUT%"=="Y" goto enableproxy
if "%INPUT%"=="y" goto enableproxy
if "%INPUT%"=="N" goto disableproxy
if "%INPUT%"=="n" goto disableproxy
@echo No valid input entered.
goto terminal
:enableproxy
@echo Sectors being re-written. Command currently offline.
goto terminal
@echo Enter the proxy address e.g. 10.122.36.25
set INPUT=
set /P INPUT=Proxy address:%=%
if not "%INPUT%"=="" set proxyaddress=%INPUT%
if not "%INPUT%"=="" goto enableproxy2
@echo No data entered.
goto terminal
:enableproxy2
@echo Enter the proxy port e.g. 3128
set INPUT=
set /P INPUT=Proxy port:%=%
if not "%INPUT%"=="" set proxyport=%INPUT%
if not "%INPUT%"=="" goto enableproxy3
@echo No data entered.
goto terminal
:enableproxy3
@echo Installing the registry entry...
@echo Installing the registry entry...
REG ADD "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Internet" /v ProxyEnable /t REG_DWORD /d 1 /f >nul
REG ADD "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Internet" /v ProxyServer /t REG_SZ /d "%proxyaddress%:%proxyport%" /f >nul
@echo Commands executed.
goto terminal
:disableproxy
@echo Installing the registry entry...
REG ADD "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Internet" /v ProxyEnable /t REG_DWORD /d 0 /f >nul
REG DELETE "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Internet" /v ProxyServer /f >nul
@echo Command executed.
goto terminal
:lpbypassed-install-dictionary
@echo Enter the file type. (1 = .exe (2 = .bat
set installdicoption=
set /p installdicoption=Option No. %=%
if "%installdicoption%"=="1" goto lpbypassed-install-dictionary-exe
if "%installdicoption%"=="2" goto lpbypassed-install-dictionary-bat
@echo No valid option was specified.
goto terminal
:lpbypassed-install-dictionary-exe
set installdicoption=
if not exist "sha1-dic.exe" @echo Unable to find the 'sha1-dic.exe' file.
if not exist "sha1-dic.exe" pause >nul
if not exist "sha1-dic.exe" goto terminal
if exist "sha1-dic.exe" @echo Installing the sha1 dictionary...
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.exe" del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.exe" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.exe" @echo Unable to remove the dictionary file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.exe" pause >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.exe" goto terminal
copy "sha1-dic.exe" "%APPDATA%\LavaPrompt\Tools\sha1-dic.exe" >nul
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.exe" @echo Unable to copy the dictionary file to the required directory.
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.exe" pause >nul
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.exe" goto terminal
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.exe" @echo Dictionary file successfully copied.
pause >nul
goto terminal
:lpbypassed-install-dictionary-bat
set installdicoption=
if not exist "sha1-dic.bat" @echo Unable to find the 'sha1-dic.bat' file.
if not exist "sha1-dic.bat" pause >nul
if not exist "sha1-dic.bat" goto terminal
if exist "sha1-dic.bat" @echo Installing the sha1 dictionary...
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" @echo Unable to remove the dictionary file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" pause >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" goto terminal
copy "sha1-dic.bat" "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" >nul
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" @echo Unable to copy the dictionary file to the required directory.
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" pause >nul
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" goto terminal
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" @echo Dictionary file successfully copied.
pause >nul
goto terminal
:lpbypassed-sha1dicdelete
@echo Enter the file type. (1 = .exe (2 = .bat
set installdicoption=
set /p installdicoption=Option No. %=%
if "%installdicoption%"=="1" goto lpbypassed-sha1dicdelete-exe
if "%installdicoption%"=="2" goto lpbypassed-sha1dicdelete-bat
@echo No valid option was entered.
goto terminal
:lpbypassed-sha1dicdelete-exe
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.exe" @echo The dictionary doesnt exist. Nothing was deleted.
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.exe" goto terminal
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.exe" del /S /Q "%APPDATA%\LavaPrompt\Tools\sha1-dic.exe" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.exe" @echo Unable to delete the file. Error No. 106
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.exe" @echo Dictionary file deleted successfully.
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.exe" goto terminal
@echo Unexpected error encountered. Unable to determine whether the file exists or not.
pause >nul
goto terminal
:lpbypassed-sha1dicdelete-bat
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" @echo The dictionary doesnt exist. Nothing was deleted.
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" goto terminal
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" del /S /Q "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" @echo Unable to delete the file. Error No. 106
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" @echo Dictionary file deleted successfully.
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" goto terminal
@echo Unexpected error encountered. Unable to determine whether the file exists or not.
pause >nul
goto terminal
:lpbypassed-sha1dicadd
if exist "%ProgramFiles%\PHP5\php-cgi.exe" set path=%path%;%ProgramFiles%\PHP5
if not exist "%ProgramFiles%\PHP5\php-cgi.exe" (
@echo Unable to find the php-cgi file. PHP 5 or over is required.
@echo Enter the path where the php-cgi.exe file is stored.
set /p inputphpcgipath=Path: %=%
if "%inputphpcgipath%"=="" @echo No path pas entered.
if "%inputphpcgipath%"=="" goto terminal
if not exist "%inputphpcgipath%" @echo Unable to find the specified path.
if not exist "%inputphpcgipath%" goto terminal
set OriginalCD=%CD%
set OrginalPath=%path%
CD %inputphpcgipath%
if "%CD%"=="%OriginalCD%" @echo The specified path is not a directory.
if "%CD%"=="%OriginalCD%" goto terminal
set PHPPath=%CD%
CD %OriginalCD%
if not exist "%PHPPath%\php-cgi.exe" @echo Unable to find 'php-cgi.exe'.
if not exist "%PHPPath%\php-cgi.exe" goto terminal
set path=%path%;%PHPPath%
)
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" @echo Dictionary file not found. Writing the start sectors...
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" goto lpbypassed-sha1dicadd2
@echo @echo off > "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo if "%%sha1string%%"=="" @echo No string specified. >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set totalentriesscanned=0 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo @echo Searching for the value "%%sha1string%%"... >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo @echo The search time may vary depending on the dictionary size. >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo @echo -------------------------------------------------------------------------------->> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" @echo Start sectors written.
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" @echo Unable to write the start sectors.
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" goto terminal
:lpbypassed-sha1dicadd2
@echo Enter the string to be added to the sha1 reverse dictionary.
@echo Type ".exit." to return to the terminal
:lpbypassed-sha1dicadd3
set /p sha1string=String: %=%
if "%sha1string%"==".exit." goto terminal
if "%sha1string%"==".EXIT." goto terminal
REM Search for the string.
if exist "%APPDATA%\LavaPrompt\Tools\phpstringcheck.php" del /S /Q "%APPDATA%\LavaPrompt\Tools\phpstringcheck.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\phpstringcheck.php" @echo Unable to remove the old php script.
if exist "%APPDATA%\LavaPrompt\Tools\phpstringcheck.php" goto terminal
if exist "%APPDATA%\LavaPrompt\Tools\phpstringcheck.bat" del /S /Q "%APPDATA%\LavaPrompt\Tools\phpstringcheck.bat" >nul
if exist "%APPDATA%\LavaPrompt\Tools\phpstringcheck.bat" @echo Unable to remove the old script.
if exist "%APPDATA%\LavaPrompt\Tools\phpstringcheck.bat" goto terminal
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php script.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
if exist "%APPDATA%\LavaPrompt\Tools\stringexists.tmp" del /S /Q "%APPDATA%\LavaPrompt\Tools\stringexists.tmp" >nul
if exist "%APPDATA%\LavaPrompt\Tools\stringexists.tmp" @echo Unable to remove the old script.
if exist "%APPDATA%\LavaPrompt\Tools\stringexists.tmp" goto terminal
@echo @echo off > "%APPDATA%\LavaPrompt\Tools\phpstringcheck.bat"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'findstr /m "' . $output .'" "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"' ;  >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\phpstringcheck.bat"
if exist "%APPDATA%\LavaPrompt\Tools\phpstringcheck.php" del /S /Q "%APPDATA%\LavaPrompt\Tools\phpstringcheck.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\phpstringcheck.php" @echo Unable to remove the old php script.
if exist "%APPDATA%\LavaPrompt\Tools\phpstringcheck.php" goto terminal
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php script.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if %%errorlevel%%==0 (' ;  >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\phpstringcheck.bat"
if exist "%APPDATA%\LavaPrompt\Tools\phpstringcheck.php" del /S /Q "%APPDATA%\LavaPrompt\Tools\phpstringcheck.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\phpstringcheck.php" @echo Unable to remove the old php script.
if exist "%APPDATA%\LavaPrompt\Tools\phpstringcheck.php" goto terminal
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php script.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo '@echo stringexists ^> "%%APPDATA%%\LavaPrompt\Tools\stringexists.tmp"' ;  >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\phpstringcheck.bat"
if exist "%APPDATA%\LavaPrompt\Tools\phpstringcheck.php" del /S /Q "%APPDATA%\LavaPrompt\Tools\phpstringcheck.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\phpstringcheck.php" @echo Unable to remove the old php script.
if exist "%APPDATA%\LavaPrompt\Tools\phpstringcheck.php" goto terminal
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php script.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo ')' ;  >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\phpstringcheck.bat"
if not exist "%APPDATA%\LavaPrompt\Tools\phpstringcheck.bat" @echo Unable to write the required file(s).
if not exist "%APPDATA%\LavaPrompt\Tools\phpstringcheck.bat" goto terminal
call "%APPDATA%\LavaPrompt\Tools\phpstringcheck.bat" >nul
if exist "%APPDATA%\LavaPrompt\Tools\stringexists.tmp" (
@echo The string "%sha1string%" already exists.
del /S /Q "%APPDATA%\LavaPrompt\Tools\stringexists.tmp" >nul
goto lpbypassed-sha1dicadd3
)
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php script.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo Added "%sha1string%" successfully.
goto lpbypassed-sha1dicadd3
:lpbypassed-stringtosha1
if exist "%ProgramFiles%\PHP5\php-cgi.exe" set path=%path%;%ProgramFiles%\PHP5
if not exist "%ProgramFiles%\PHP5\php-cgi.exe" (
@echo Unable to find the php-cgi file. PHP 5 or over is required.
@echo Enter the path where the php-cgi.exe file is stored.
set /p inputphpcgipath=Path: %=%
if "%inputphpcgipath%"=="" @echo No path pas entered.
if "%inputphpcgipath%"=="" goto terminal
if not exist "%inputphpcgipath%" @echo Unable to find the specified path.
if not exist "%inputphpcgipath%" goto terminal
set OriginalCD=%CD%
set OrginalPath=%path%
CD %inputphpcgipath%
if "%CD%"=="%OriginalCD%" @echo The specified path is not a directory.
if "%CD%"=="%OriginalCD%" goto terminal
set PHPPath=%CD%
CD %OriginalCD%
if not exist "%PHPPath%\php-cgi.exe" @echo Unable to find 'php-cgi.exe'.
if not exist "%PHPPath%\php-cgi.exe" goto terminal
set path=%path%;%PHPPath%
)
set /p sha1string=String: %=%
if exist "%APPDATA%\LavaPrompt\Tools\sha1-temp.php" del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-temp.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-temp.php" @echo Unable to remove the old php script.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-temp.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-temp.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-temp.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-temp.php"
@echo echo 'Output: ' .$output ; >> "%APPDATA%\LavaPrompt\Tools\sha1-temp.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-temp.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-temp.php"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-temp.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-temp.php" @echo Unable to remove the old php file.
set Path=%originalpathvariable%
goto terminal
:lpbypassed-sha1dicgen
if exist "%ProgramFiles%\PHP5\php-cgi.exe" set path=%path%;%ProgramFiles%\PHP5
if not exist "%ProgramFiles%\PHP5\php-cgi.exe" (
@echo Unable to find the php-cgi file. PHP 5 or over is required.
@echo Enter the path where the php-cgi.exe file is stored.
set /p inputphpcgipath=Path: %=%
if "%inputphpcgipath%"=="" @echo No path pas entered.
if "%inputphpcgipath%"=="" goto terminal
if not exist "%inputphpcgipath%" @echo Unable to find the specified path.
if not exist "%inputphpcgipath%" goto terminal
set OriginalCD=%CD%
set OrginalPath=%path%
CD %inputphpcgipath%
if "%CD%"=="%OriginalCD%" @echo The specified path is not a directory.
if "%CD%"=="%OriginalCD%" goto terminal
set PHPPath=%CD%
CD %OriginalCD%
if not exist "%PHPPath%\php-cgi.exe" @echo Unable to find 'php-cgi.exe'.
if not exist "%PHPPath%\php-cgi.exe" goto terminal
set path=%path%;%PHPPath%
)
set dicgennumbermax=0
@echo Enter the total of numeric values to be generated.
set /p dicgennumbermaxinput=Total: %=%
set /a dicgennumbermax=%dicgennumbermax%+%dicgennumbermaxinput%
if "%dicgennumbermax%"=="0" set dicgennumbermax=9999
@echo Values to be generated: %dicgennumbermax%
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" @echo Dictionary file not found. Writing the start sectors...
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" goto lpbypassed-sha1dicgen-dicexists
@echo @echo off > "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo if "%%sha1string%%"=="" @echo No string specified. >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set totalentriesscanned=0 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo @echo Searching for the value "%%sha1string%%"... >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo @echo The search time may vary depending on the dictionary size. >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo @echo -------------------------------------------------------------------------------->> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" @echo Start sectors written.
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" @echo Unable to write the start sectors.
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" goto terminal
:lpbypassed-sha1dicgen-dicexists
color c
@echo Generating keys (Takes a while. Batch doesnt multi thread)...
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php script.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=a
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=A
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=b
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=B
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=c
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=C
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=d
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=D
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=e
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=E
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=f
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=F
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=g
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=G
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=h
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=H
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=i
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=I
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=j
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=J
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=k
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=K
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=l
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=L
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=m
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=M
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=n
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=N
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=o
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=O
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=p
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=P
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=q
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=Q
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=r
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=R
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=s
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=S
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=t
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=T
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=u
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=U
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=v
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to rem
set sha1string=V
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=w
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=W
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=x
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=X
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=y
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=Y
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=z
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=Z
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo Generating numeric keys up to %dicgennumbermax%...
set sha1string=00
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=000
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=0000
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=00000
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=000000
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=0000000
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=00000000
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
set sha1string=0
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
:lpbypassed-sha1dicgen-dicexistsnumbers
set /a sha1string=%sha1string%+1
@echo String "%sha1string%"
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo "' .$input . '"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
@echo ^<?php > "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $input='%sha1string%'; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo $output=sha1($input); >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo echo 'if "%%sha1string%%"=="' . $output . '" @echo ENTRY FOUND ^> "%%APPDATA%%\LavaPrompt\Tools\entryfound.tmp"' ; >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
@echo ?^> >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.php"
php-cgi -q -f "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo set /a totalentriesscanned=%%totalentriesscanned%%+1 >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
@echo Title = Entries scanned: %%totalentriesscanned%% >> "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
del /s /q "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" @echo Unable to remove the old php file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.php" goto terminal
if not "%sha1string%"=="%dicgennumbermax%" goto lpbypassed-sha1dicgen-dicexistsnumbers
color 07
set dicgennumbermax=
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" @echo Dictionary file written.
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" @echo Unable to write the dictionary file.
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" goto terminal
goto terminal
:lpbypassed-sha1-cracker
@echo Enter the file type. (1 = .exe (2 = .bat
set installdicoption=
set /p installdicoption=Option No. %=%
if "%installdicoption%"=="1" goto lpbypassed-sha1-cracker-exe
if "%installdicoption%"=="2" goto lpbypassed-sha1-cracker-bat
@echo No valid option was entered.
goto terminal
:lpbypassed-sha1-cracker-exe
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.exe" @echo The dictionary was not found.
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.exe" goto terminal
if exist "%APPDATA%\LavaPrompt\Tools\entryfound.tmp" del /S /Q "%APPDATA%\LavaPrompt\Tools\entryfound.tmp" >nul
if exist "%APPDATA%\LavaPrompt\Tools\entryfound.tmp" @echo Unable to delete the temporary file.
if exist "%APPDATA%\LavaPrompt\Tools\entryfound.tmp" goto terminal
set /p sha1string=String: %=%
if "%sha1string%"=="" @echo No string specified.
if "%sha1string%"=="" goto terminal
call "%APPDATA%\LavaPrompt\Tools\sha1-dic.exe"
if not exist "%APPDATA%\LavaPrompt\Tools\entryfound.tmp" @echo The entry was not found in the dictionary/database.
if exist "%APPDATA%\LavaPrompt\Tools\entryfound.tmp" del /S /Q "%APPDATA%\LavaPrompt\Tools\entryfound.tmp" >nul
if exist "%APPDATA%\LavaPrompt\Tools\entryfound.tmp" @echo Unable to delete the temporary file.
@echo Total entries scanned: %totalentriesscanned% 
@echo Why not press a button on that keyboard to continue?
pause >nul
if "%perm%"=="root" (
TITLE=LavaPrompt version %lpversion%~[ROOT]
if "%lpbypassed%"=="TRUE" TITLE=LavaPrompt version %lpversion%~[ROOT]~[BYPASSED]
)
if "%perm%"=="user" (
TITLE=LavaPrompt version %lpversion%~[USER]
if "%lpbypassed%"=="TRUE" TITLE=LavaPrompt version %lpversion%~[USER]~[BYPASSED]
)
goto terminal
:lpbypassed-sha1-cracker-bat
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" @echo The dictionary was not found.
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" goto terminal
if exist "%APPDATA%\LavaPrompt\Tools\entryfound.tmp" del /S /Q "%APPDATA%\LavaPrompt\Tools\entryfound.tmp" >nul
if exist "%APPDATA%\LavaPrompt\Tools\entryfound.tmp" @echo Unable to delete the temporary file.
if exist "%APPDATA%\LavaPrompt\Tools\entryfound.tmp" goto terminal
set /p sha1string=String: %=%
if "%sha1string%"=="" @echo No string specified.
if "%sha1string%"=="" goto terminal
call "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat"
if not exist "%APPDATA%\LavaPrompt\Tools\entryfound.tmp" @echo The entry was not found in the dictionary/database.
if exist "%APPDATA%\LavaPrompt\Tools\entryfound.tmp" del /S /Q "%APPDATA%\LavaPrompt\Tools\entryfound.tmp" >nul
if exist "%APPDATA%\LavaPrompt\Tools\entryfound.tmp" @echo Unable to delete the temporary file.
@echo Total entries scanned: %totalentriesscanned% 
@echo Why not press a button on that keyboard to continue?
pause >nul
if "%perm%"=="root" (
TITLE=LavaPrompt version %lpversion%~[ROOT]
if "%lpbypassed%"=="TRUE" TITLE=LavaPrompt version %lpversion%~[ROOT]~[BYPASSED]
)
if "%perm%"=="user" (
TITLE=LavaPrompt version %lpversion%~[USER]
if "%lpbypassed%"=="TRUE" TITLE=LavaPrompt version %lpversion%~[USER]~[BYPASSED]
)
goto terminal
:lpbypassed-switch-lanschool-to-teacher
if not "%lpbypassed%"=="TRUE" goto terminal
@echo Attempting to kill the proccess manually...
TASKKILL /F /IM Student.exe /T >nul
TASKKILL /F /IM Teacher.exe /T >nul
@echo Attempt No.1 Executed. Attempting to kill with utilities...
if exist "%APPDATA%\LavaPrompt\04.dat" rename "%APPDATA%\LavaPrompt\04.dat" "04.exe"
if exist "%APPDATA%\LavaPrompt\01.dat" rename "%APPDATA%\LavaPrompt\01.dat" "Teacher.exe"
if not exist "%APPDATA%\LavaPrompt\04.exe" @echo Unable to find "04.exe".
if not exist "%APPDATA%\LavaPrompt\04.exe" goto terminal
"%APPDATA%\LavaPrompt\04.exe">nul
if not exist "%APPDATA%\LavaPrompt\Teacher.exe" @echo Unable to find "Teacher.exe".
if not exist "%APPDATA%\LavaPrompt\Teacher.exe" goto terminal
@echo Attempt No.2 Executed. Launching teacher mode...
@echo WARNING-LP May hang when teacher launches. Just restart LP.
"%APPDATA%\LavaPrompt\Teacher.exe"
@echo Command executed.
goto lpbypassed-LanSchool_Tools
:lpbypassed-switch-lanschool-to-student
if not "%lpbypassed%"=="TRUE" goto terminal
@echo Attempting to kill the proccess manually...
TASKKILL /F /IM Teacher.exe /T >nul
TASKKILL /F /IM Student.exe /T >nul
@echo Attempt No.1 Executed. Attempting to kill with utilities...
if exist "%APPDATA%\LavaPrompt\03.dat" rename "%APPDATA%\LavaPrompt\03.dat" "03.exe"
if not exist "%APPDATA%\LavaPrompt\03.exe" @echo 03.exe not found.
if not exist "%APPDATA%\LavaPrompt\03.exe" goto terminal
if exist "%APPDATA%\LavaPrompt\02.dat" rename "%APPDATA%\LavaPrompt\02.dat" "Student.exe"
if not exist "%APPDATA%\LavaPrompt\Student.exe" @echo Student.exe not found.
if not exist "%APPDATA%\LavaPrompt\Student.exe" goto terminal
"%APPDATA%\LavaPrompt\03.exe">nul
@echo Attempt No.2 Executed. Launching student mode...
@echo WARNING-LP May hang when student launches. Just restart LP.
"%APPDATA%\LavaPrompt\Student.exe"
@echo Command executed.
goto lpbypassed-LanSchool_Tools
:lpbypassed-kill-lanschool-service
@echo Killing all LanSchool services (Might not accomplish this task).
set stringtofind=Teacher.exe
TASKLIST >"%APPDATA%\LavaPrompt\Tools\tasklist.txt"
findstr /m "%stringtofind%" "%APPDATA%\LavaPrompt\Tools\tasklist.txt" >nul
if %errorlevel%==1 (
TASKKILL /F /IM Teacher.exe /T >nul
)
set stringtofind=Student.exe
TASKLIST >"%APPDATA%\LavaPrompt\Tools\tasklist.txt"
findstr /m "%stringtofind%" "%APPDATA%\LavaPrompt\Tools\tasklist.txt" >nul
if %errorlevel%==1 (
TASKKILL /F /IM Student.exe /T >nul
)
set stringtofind=Teacher.exe
TASKLIST >"%APPDATA%\LavaPrompt\Tools\tasklist.txt"
findstr /m "%stringtofind%" "%APPDATA%\LavaPrompt\Tools\tasklist.txt" >nul
if %errorlevel%==0 (
@echo Unable to kill the teacher service.
set teacherkilled=false
)
del /S /Q "%APPDATA%\LavaPrompt\Tools\tasklist.txt" >nul
if exist "%APPDATA%\LavaPrompt\Tools\tasklist.txt" @echo Unable to remove the temporary file. Oh well.
set stringtofind=Student.exe
TASKLIST >"%APPDATA%\LavaPrompt\Tools\tasklist.txt"
findstr /m "%stringtofind%" "%APPDATA%\LavaPrompt\Tools\tasklist.txt" >nul
if %errorlevel%==0 (
@echo Unable to kill the student service.
set studentkilled=false
)
del /S /Q "%APPDATA%\LavaPrompt\Tools\tasklist.txt" >nul
if exist "%APPDATA%\LavaPrompt\Tools\tasklist.txt" @echo Unable to remove the temporary file. Oh well.
if not "%studentkilled%"=="false" @echo Student service successfully killed.
if not "%teacherkilled%"=="false" @echo Teacher service successfully killed.
set studentkilled=
set teacherkilled=
goto lpbypassed-LanSchool_Tools
:lpbypassed-unlock-qbfc
set qbfcc-agreed=
cls
color c
@echo WARNING! The following command is illegal. By entering "Y" or "y"
@echo you agree that you take full responsibility for continuing with
@echo executing this command. The developer of this program takes
@echo NO responsibility for the outcome of this command. The
@echo user (or "User") accepts full responsibility.
@echo Agree?
set /p qbfcq=Y/N: %=%
if "%qbfcq%"=="Y" set qbfcc-agreed=TRUE
if "%qbfcq%"=="Y" goto lpbypassed-unlock-qbfc-agreed
if "%qbfcq%"=="y" set qbfcc-agreed=TRUE
if "%qbfcq%"=="y" goto lpbypassed-unlock-qbfc-agreed
set qbfcc-agreed=
@echo Operation cancelled.
color 07
goto terminal
:lpbypassed-unlock-qbfc-agreed
color 07
if not "%qbfcc-agreed%"=="TRUE" @echo YOU DIDN'T ACCEPT THE TERMS OF AGREEMENT!
if not "%qbfcc-agreed%"=="TRUE" goto terminal
@echo Registering software...
reg add "hkcu\Software\Abyssmedia\Quick Batch File Compiler\Settings" /v user /t REG_SZ /d "user" /f >nul
reg add "hkcu\Software\Abyssmedia\Quick Batch File Compiler\Settings" /v key /t REG_SZ /d "05A61-D7984-9DD1D-E8D5A" /f >nul
set qbfcc-agreed=
@echo Command executed.
goto terminal
:lpbypassed-lock-qbfc
@echo Un-registering software...
REG DELETE "hkcu\Software\Abyssmedia\Quick Batch File Compiler\Settings" /v user /f >nul
REG DELETE "hkcu\Software\Abyssmedia\Quick Batch File Compiler\Settings" /v key /f >nul
@echo Command executed.
goto terminal
:lpbypassed-update-dictionary-lavanoid-only
if not "%lpbypassed%"=="TRUE" goto command_unknown
if not "%USERNAME%"=="Lavanoid" goto command_unknown
if not exist "C:\Users\Lavanoid\server_files\http\Adminpanel\sha1-dictionary\sha1-dic.bat" goto command_unknown
@echo Copying Sha1-Dic to the LP tools directory...
if exist "C:\Users\Lavanoid\server_files\http\Adminpanel\sha1-dictionary\sha1-dic.bat" (
@echo Update file found.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" @echo Removing the old dictionary...
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" del /S /Q "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" @echo Unable to remove the previous file.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" pause >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" goto terminal
copy "C:\Users\Lavanoid\server_files\http\Adminpanel\sha1-dictionary\sha1-dic.bat" "%APPDATA%\LavaPrompt\Tools" >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" @echo File updated successfully.
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" pause >nul
if exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" goto terminal
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" @echo Update failed.
if not exist "%APPDATA%\LavaPrompt\Tools\sha1-dic.bat" pause >nul
goto terminal
)
goto command_unknown
:wifihotspot
if not "%perm%"=="root" @echo This command requires root to run. Cannot continue.
if not "%perm%"=="root" pause >nul
if not "%perm%"=="root" goto terminal
netsh wlan > "%TEMP%\OSCheck-mkhotspot.tmp"
if not exist "%TEMP%\OSCheck-mkhotspot.tmp" @echo Unable to determine the OS version due to a file error.
if not exist "%TEMP%\OSCheck-mkhotspot.tmp" pause >nul
if not exist "%TEMP%\OSCheck-mkhotspot.tmp" exit
findstr /m "hosted" "%TEMP%\OSCheck-mkhotspot.tmp" >nul
if %errorlevel%==1 (
@echo The current OS is not supported.
pause >nul
goto terminal
)
if %errorlevel%==0 (
@echo OS Supported=True.
)
del "%TEMP%\OSCheck-mkhotspot.tmp" >nul
set wifi_ap_name=WindowsAP
set wifi_ap_passwd=%RANDOM%%RANDOM%%RANDOM%
if "%wifi_ap_name%"=="" @echo A variable error was encountered.
if "%wifi_ap_name%"=="" pause >nul
if "%wifi_ap_name%"=="" exit
if "%wifi_ap_passwd%"=="" @echo A variable error was encountered.
if "%wifi_ap_passwd%"=="" pause >nul
if "%wifi_ap_passwd%"=="" exit
@echo Administrative access acquired.
@echo Checking if a configuration file exists...
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" @echo Configuration file found.
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" goto write_new_config
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" rename "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" "wifi_hotspot_configuration.bat"
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.bat" call "%LOCALAPPDATA%\wifi_hotspot_configuration.bat"
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.bat" @echo Unable to acquire the configuration file.
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.bat" pause >nul
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.bat" goto terminal
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.bat" rename "%LOCALAPPDATA%\wifi_hotspot_configuration.bat" "wifi_hotspot_configuration.dat"
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" @echo Configuration file executed.
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" @echo Checking variables...
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" goto check_configuration
:setnetshconfig
cls
if "%AP_Status%"=="Started" goto wifihotspotstart
set AP_Status=Stopped
netsh wlan stop hostednetwork >nul
netsh wlan set hostednetwork ssid="%wifi_ap_name%"
netsh wlan set hostednetwork key="%wifi_ap_passwd%" keyUsage=persist
cls
:wifihotspotstart
cls
@echo AP Name: %wifi_ap_name%
if "%wifi_ap_passwd%"=="" @echo AP Password: Not set
if not "%wifi_ap_passwd%"=="" @echo AP Password: %wifi_ap_passwd%
@echo AP Status: %AP_Status%
@echo 1 - Set AP name.
@echo 2 - Set AP password.
@echo 3 or start - Start AP.
@echo 4 or stop - Stop AP.
@echo 5 - View extra config info.
@echo 6 - View current config info.
@echo 7 - Remove custom encryption (delete the password setting).
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" @echo 8 - Delete AP configuration.
@echo exit - Return to LP (Hotspot will remain active if started).
set input=
set /p input=Option: %=%
if "%input%"=="1" goto set_ap_name
if "%input%"=="2" goto set_ap_password
if "%input%"=="3" goto start_ap_hotspot
if "%input%"=="start" goto start_ap_hotspot
if "%input%"=="START" goto start_ap_hotspot
if "%input%"=="Start" goto start_ap_hotspot
if "%input%"=="4" goto stop_ap_hotspot
if "%input%"=="stop" goto stop_ap_hotspot
if "%input%"=="STOP" goto stop_ap_hotspot
if "%input%"=="Stop" goto stop_ap_hotspot
if "%input%"=="5" goto view_extra_config_info
if "%input%"=="6" goto view_windows_configured_info_secure
if "%input%"=="7" goto set_ap_password_remove
if "%input%"=="8" goto delete_ap_configuration
if "%input%"=="exit" goto terminal
if "%input%"=="EXIT" goto terminal
if "%input%"=="Exit" goto terminal
if "%input%"=="eXit" goto terminal
@echo Invalid option entered.
set input=
goto wifihotspotstart
:check_configuration
if not "%wifi_ap_name%"=="" @echo wifi_ap_name successfully set.
if not "%wifi_ap_passwd%"=="" @echo wifi_ap_passwd successfully set.
if "%wifi_ap_name%"=="" @echo wifi_ap_name failed to be set.
if "%wifi_ap_name%"=="" pause >nul
if "%wifi_ap_name%"=="" goto wifihotspotstart
if "%wifi_ap_passwd%"=="" @echo wifi_ap_passwd failed to be set.
if "%wifi_ap_passwd%"=="" pause >nul
if "%wifi_ap_passwd%"=="" goto wifihotspotstart
@echo Variable check passed. Returning to setnetshconfig...
goto setnetshconfig
@echo Unexpected error encountered. Unable to go to setnetshconfig.
pause >nul
goto wifihotspotstart
:set_ap_name
@echo Enter the AP name.
set /p wifi_ap_name_input=Name: %=%
if "%wifi_ap_name_input%"=="" @echo No string was entered.
if "%wifi_ap_name_input%"=="" goto wifihotspotstart
if "%wifi_ap_name_input%"==" " @echo No string was entered.
if "%wifi_ap_name_input%"==" " goto wifihotspotstart
if "%wifi_ap_name_input%"=="  " @echo No string was entered.
if "%wifi_ap_name_input%"=="  " goto wifihotspotstart
if "%wifi_ap_name_input%"=="   " @echo No string was entered.
if "%wifi_ap_name_input%"=="   " goto wifihotspotstart
if "%wifi_ap_name_input%"=="    " @echo No string was entered.
if "%wifi_ap_name_input%"=="    " goto wifihotspotstart
set wifi_ap_name=
set wifi_ap_name=%wifi_ap_name_input%
if "%wifi_ap_name%"=="" @echo Unable to set the required variables.
if "%wifi_ap_name%"=="" pause >nul
if "%wifi_ap_name%"=="" goto wifihotspotstart
netsh wlan stop hostednetwork >nul
netsh wlan set hostednetwork ssid="%wifi_ap_name%" >nul
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" del /S /Q "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" >nul
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" @echo Unable to remove the configuration file.
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" pause >nul
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" goto wifihotspotstart
@echo set wifi_ap_name=%wifi_ap_name%> "%LOCALAPPDATA%\wifi_hotspot_configuration.dat"
@echo set wifi_ap_passwd=%wifi_ap_passwd%>> "%LOCALAPPDATA%\wifi_hotspot_configuration.dat"
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" @echo Unable to write the configuration file
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" pause >nul
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" goto wifihotspotstart
@echo AP name set.
if "%AP_Status%"=="Started" (
@echo Restarting the AP...
netsh wlan start hostednetwork
goto wifihotspotstart
@echo Unexpected error encountered. Unable to go to start.
pause >nul
goto terminal
)
set AP_Status=Stopped
goto wifihotspotstart
@echo Unexpected error encountered. Unable to go to start.
pause >nul
goto terminal
:set_ap_password
@echo Enter the AP password.
set /p wifi_ap_passwd_input=Password: %=%
if "%wifi_ap_passwd_input%"=="" @echo No string was entered.
if "%wifi_ap_passwd_input%"=="" goto wifihotspotstart
if "%wifi_ap_passwd_input%"==" " @echo No string was entered.
if "%wifi_ap_passwd_input%"==" " goto wifihotspotstart
if "%wifi_ap_passwd_input%"=="  " @echo No string was entered.
if "%wifi_ap_passwd_input%"=="  " goto wifihotspotstart
if "%wifi_ap_passwd_input%"=="   " @echo No string was entered.
if "%wifi_ap_passwd_input%"=="   " goto wifihotspotstart
if "%wifi_ap_passwd_input%"=="    " @echo No string was entered.
if "%wifi_ap_passwd_input%"=="    " goto wifihotspotstart
if "%wifi_ap_passwd_input%"=="     " @echo No string was entered.
if "%wifi_ap_passwd_input%"=="     " goto wifihotspotstart
if "%wifi_ap_passwd_input%"=="      " @echo No string was entered.
if "%wifi_ap_passwd_input%"=="      " goto wifihotspotstart
if "%wifi_ap_passwd_input%"=="       " @echo No string was entered.
if "%wifi_ap_passwd_input%"=="       " goto wifihotspotstart
if "%wifi_ap_passwd_input%"=="        " @echo No string was entered.
if "%wifi_ap_passwd_input%"=="        " goto wifihotspotstart
if "%wifi_ap_passwd_input%"=="         " @echo No string was entered.
if "%wifi_ap_passwd_input%"=="         " goto wifihotspotstart
if "%wifi_ap_passwd_input%"=="          " @echo No string was entered.
if "%wifi_ap_passwd_input%"=="          " goto wifihotspotstart
if "%wifi_ap_passwd_input%"=="           " @echo No string was entered.
if "%wifi_ap_passwd_input%"=="           " goto wifihotspotstart
if "%wifi_ap_passwd_input%"=="            " @echo No string was entered.
if "%wifi_ap_passwd_input%"=="            " goto wifihotspotstart
REM I just wanted to add more script so I added the extra script above :S
set wifi_ap_passwd=
set wifi_ap_passwd=%wifi_ap_passwd_input%
if "%wifi_ap_passwd%"=="" @echo Unable to set the required variables.
if "%wifi_ap_passwd%"=="" pause >nul
if "%wifi_ap_passwd%"=="" goto wifihotspotstart
netsh wlan stop hostednetwork >nul
netsh wlan set hostednetwork key="%wifi_ap_passwd%" keyUsage=persist
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" del /S /Q "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" >nul
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" @echo Unable to remove the configuration file.
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" pause >nul
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" goto terminal
@echo set wifi_ap_name=%wifi_ap_name%> "%LOCALAPPDATA%\wifi_hotspot_configuration.dat"
@echo set wifi_ap_passwd=%wifi_ap_passwd%>> "%LOCALAPPDATA%\wifi_hotspot_configuration.dat"
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" @echo Unable to write the configuration file
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" pause >nul
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" goto terminal
@echo AP password set.
if "%AP_Status%"=="Started" (
@echo Restarting the AP...
netsh wlan start hostednetwork
goto wifihotspotstart
@echo Unexpected error encountered. Unable to go to start.
pause >nul
goto terminal
)
set AP_Status=Stopped
goto wifihotspotstart
@echo Unexpected error encountered. Unable to go to start.
pause >nul
goto terminal
:start_ap_hotspot
@echo Starting the AP...
netsh wlan start hostednetwork
set AP_Status=Started
goto wifihotspotstart
@echo Unexpected error encountered. Unable to go to start.
pause >nul
goto terminal
:stop_ap_hotspot
@echo Stopping the AP...
netsh wlan stop hostednetwork >nul
set AP_Status=Stopped
goto wifihotspotstart
@echo Unexpected error encountered. Unable to go to start.
pause >nul
goto terminal
:delete_ap_configuration
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" @echo No configuration file found.
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" goto start
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" del /s /q "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" >nul
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" @echo Unable to remove the configuration file.
netsh wlan stop hostednetwork >nul
netsh wlan set hostednetwork ssid="Not set"
netsh wlan set hostednetwork key=
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" @echo Configuration file successfully removed. Press any key to return to LP.
netsh wlan stop hostednetwork >nul
pause >nul
goto terminal
@echo Unexpected error encountered. Unable to exit.
pause >nul
exit
:write_new_config
@echo set wifi_ap_name=%wifi_ap_name%> "%LOCALAPPDATA%\wifi_hotspot_configuration.dat"
@echo set wifi_ap_passwd=%wifi_ap_passwd%>> "%LOCALAPPDATA%\wifi_hotspot_configuration.dat"
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" @echo Unable to write the configuration file.
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" pause >nul
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" goto terminal
netsh wlan stop hostednetwork >nul
netsh wlan set hostednetwork ssid="%wifi_ap_name%"
netsh wlan set hostednetwork key="%wifi_ap_passwd%" keyUsage=persist
goto wifihotspotstart
:view_extra_config_info
netsh wlan show hostednetwork
pause >nul
goto wifihotspotstart
@echo Unexpected error encountered. Unable to go to start.
pause >nul
goto terminal
:view_windows_configured_info_secure
netsh wlan show hostednetwork setting=security
pause >nul
goto wifihotspotstart
@echo Unexpected error encountered. Unable to go to start.
pause >nul
goto terminal
:set_ap_password_remove
@echo Removing the encryption setting...
set wifi_ap_passwd=
set wifi_ap_passwd=%RANDOM%%RANDOM%%RANDOM%
if "%wifi_ap_passwd%"=="" @echo Unable to set the required variables.
if "%wifi_ap_passwd%"=="" pause >nul
if "%wifi_ap_passwd%"=="" goto wifihotspotstart
netsh wlan stop hostednetwork >nul
set AP_Status=Stopped
netsh wlan set hostednetwork key=%wifi_ap_passwd% keyUsage=persist
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" del /S /Q "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" >nul
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" @echo Unable to remove the configuration file.
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" pause >nul
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" goto terminal
@echo set wifi_ap_name=%wifi_ap_name%> "%LOCALAPPDATA%\wifi_hotspot_configuration.dat"
@echo set wifi_ap_passwd=%wifi_ap_passwd%>> "%LOCALAPPDATA%\wifi_hotspot_configuration.dat"
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" @echo Unable to write the configuration file
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" pause >nul
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" goto terminal
cls
goto wifihotspotstart
@echo Unexpected error encountered. Unable to go to start.
pause >nul
goto terminal
:installlpconfig
if not exist "lpconfig.dat" @echo Unable to find the 'lpconfig.dat' file.
if not exist "lpconfig.dat" pause >nul
if not exist "lpconfig.dat" goto terminal
@echo Copying the configuration file...
if exist "%APPDATA%\LavaPrompt\lpconfig-installed.dat" del "%APPDATA%\LavaPrompt\lpconfig-installed.dat" >nul
if exist "%APPDATA%\LavaPrompt\lpconfig-installed.dat" @echo Unable to remove the original 'lpconfig-installed.dat' file.
if exist "%APPDATA%\LavaPrompt\lpconfig-installed.dat" pause >nul
if exist "%APPDATA%\LavaPrompt\lpconfig-installed.dat" goto terminal
copy "lpconfig.dat" "%APPDATA%\LavaPrompt\lpconfig-installed.dat" >nul
if not exist "%APPDATA%\LavaPrompt\lpconfig-installed.dat" @echo Failed to copy the configuration file into the required directory.
if not exist "%APPDATA%\LavaPrompt\lpconfig-installed.dat" pause >nul
if not exist "%APPDATA%\LavaPrompt\lpconfig-installed.dat" goto terminal
if exist "%APPDATA%\LavaPrompt\lpconfig-installed.dat" @echo The configuration file was successfully copied.
if exist "%APPDATA%\LavaPrompt\lpconfig-installed.dat" pause >nul
goto terminal
:removelpconfig
if not exist "%APPDATA%\LavaPrompt\lpconfig-installed.dat" @echo The 'lpconfig-installed.dat' file does not exist.
if not exist "%APPDATA%\LavaPrompt\lpconfig-installed.dat" pause >nul
if not exist "%APPDATA%\LavaPrompt\lpconfig-installed.dat" goto terminal
DEL /S /Q "%APPDATA%\LavaPrompt\lpconfig-installed.dat"	>NUL
if exist "%APPDATA%\LavaPrompt\lpconfig-installed.dat" @echo Unable to remove the 'lpconfig-installed.dat' file.
if exist "%APPDATA%\LavaPrompt\lpconfig-installed.dat" pause >nul
if exist "%APPDATA%\LavaPrompt\lpconfig-installed.dat" goto terminal
if not exist "%APPDATA%\LavaPrompt\lpconfig-installed.dat" @echo The installled config was successfully removed.
goto terminal
:shutdown
@echo Shutdown?
set shutdownoption=
set /p shutdownoption=Y/N: %=%
if "%shutdownoption%"=="Y" goto shutdown-option-Y-True
if "%shutdownoption%"=="y" goto shutdown-option-Y-True
set shutdownoption=
@echo Shutdown execution aborted.
goto terminal
:shutdown-option-Y-True
cls
@echo Shutting down...
shutdown -s -f -t 00
goto exit
:logoff
@echo Logoff?
set shutdownoption=
set /p shutdownoption=Y/N: %=%
if "%shutdownoption%"=="Y" goto logoff-option-Y-True
if "%shutdownoption%"=="y" goto logoff-option-Y-True
set shutdownoption=
@echo Logoff execution aborted.
goto terminal
:logoff-option-Y-True
cls
@echo Logging off...
shutdown -l -f -t 00
goto exit
:reboot
@echo Reboot?
set shutdownoption=
set /p shutdownoption=Y/N: %=%
if "%shutdownoption%"=="Y" goto reboot-option-Y-True
if "%shutdownoption%"=="y" goto reboot-option-Y-True
set shutdownoption=
@echo Reboot execution aborted.
goto terminal
:reboot-option-Y-True
cls
@echo Rebooting...
shutdown -r -f -t 00
goto exit
:whoami
@echo You are %USERNAME%.
goto terminal
:restartlavaprompt
@echo Are you sure you want to restart LavaPrompt?
set restartlavapromptoption=
set /p restartlavapromptoption=Y/N: %=%
if "%restartlavapromptoption%"=="Y" goto restartlavaprompt-Y-True
if "%restartlavapromptoption%"=="y" goto restartlavaprompt-Y-True
@echo Restart executed aborted.
goto terminal
:restartlavaprompt-Y-True
@echo Restarting...
goto thebeginningoftime
:mountprotected
@echo Enter drive letter E.g. E:
set promountpoint=
set /P promountpoint=Drive letter: %=%
if not "%promountpoint%"=="" goto mountprotected2
set promountpoint=
@echo No value entered.
goto terminal
:mountprotected2
@echo Enter drive path E.g. \\homecomputer\Documents
set promountpath=
set /P promountpath=Drive path: %=%
if not "%promountpath%"=="" goto mountprotected3
@echo No value entered.
set promountpath=
goto terminal
:mountprotected3
@echo Enter username E.g. Jack
set promountusername=
set /P promountusername=Username: %=%
if not "%promountusername%"=="" goto mountprotected4
@echo No value entered.
set promountusername=
goto terminal
:mountprotected4
@echo Enter password (If there is no password then leave this blank)
set promountpassword=
set /P promountpassword=Password: %=%
if "%promountpassword%"=="" set promountpassword=
goto mountprotected5
:mountprotected5
@echo Mounting...
NET USE %promountpoint% %promountpath% /Y /USER:%promountusername% %promountpassword%
if exist "%promountpoint%" goto promounted
@echo Unable to mount the device "%promountpoint%".
goto terminal
:promounted
@echo Device "%promountpoint%" mounted.
goto terminal
:mount
@echo Enter drive letter E.g. E:
set mountpoint=
set /P mountpoint=Drive letter: %=%
if not "%mountpoint%"=="" goto Mount2
set mountpoint=
@echo No value entered.
goto terminal
:Mount2
@echo Enter drive path E.g. \\homecomputer\Documents
set mountpath=
set /P mountpath=Drive path: %=%
if not "%mountpath%"=="" goto Mount3
set mountpath=
@echo No value entered.
goto terminal
:Mount3
@echo __________________________
@echo Mount point = %mountpoint%
@echo Mount path = %mountpath%
@echo __________________________
if exist "%mountpoint%" @echo The requested mount "%mountpoint%" is already mounted.
if exist "%mountpoint%" goto terminal
@echo Mounting...
NET USE %mountpoint% %mountpath% >nul
if exist "%mountpoint%" @echo Successfully mounted "%mountpoint%".
if not exist "%mountpoint%" @echo Unable to mount "%mountpoint%%".
goto terminal
:netconfig
@echo You may need to restart Your network adapter/interface to
@echo fully apply these settings.
@echo Commands:
@echo 1  - Adds Windows shares
@echo 1A - Adds advanced Windows shares
@echo 1B - Adds a Windows user account and a share for that individul
@echo 2  - Removes Windows shares
@echo 3  - Adds user accounts
@echo 4  - Adds a user account to the Administrator group
@echo 5  - Removes a user account from the Administrator group
@echo 6  - Removes user accounts
@echo 7  - Enable/Disable user accounts
@echo 8  - Reset user passwords
@echo 9  - Set account full name
@echo 0  - View account configuration
@echo -  - Show computer on the network
@echo =  - Hide computer on the network
@echo H  - Hide a user account
@echo S  - Show a user account
@echo R  - Restart the server and workstation service
@echo Q  - Quit to Lavaprompt
set INPUT=
set /P INPUT=%=%
if "%INPUT%"=="1" goto netconfig2
if "%INPUT%"=="2" goto netconfig6
if "%INPUT%"=="3" goto netconfig7
if "%INPUT%"=="6" goto netconfig10
if "%INPUT%"=="-" NET CONFIG SERVER /HIDDEN:NO
if "%INPUT%"=="-" @echo Restarting NET services
if "%INPUT%"=="-" NET STOP SERVER /Y
if "%INPUT%"=="-" NET STOP WORKSTATION /Y
if "%INPUT%"=="-" NET START SERVER
if "%INPUT%"=="-" NET START WORKSTATION
if "%INPUT%"=="-" goto netconfig
if "%INPUT%"=="=" NET CONFIG SERVER /HIDDEN:YES
if "%INPUT%"=="=" @echo Restarting NET services
if "%INPUT%"=="=" NET STOP SERVER /Y
if "%INPUT%"=="=" NET STOP WORKSTATION /Y
if "%INPUT%"=="=" NET START SERVER
if "%INPUT%"=="=" NET START WORKSTATION
if "%INPUT%"=="=" goto netconfig
if "%INPUT%"=="Q" goto terminal
if "%INPUT%"=="q" goto terminal
if "%INPUT%"=="7" goto netconfig11
if "%INPUT%"=="8" goto netconfig13
if "%INPUT%"=="9" goto netconfig14
if "%INPUT%"=="0" goto netconfig16
if "%INPUT%"=="4" goto netconfig17
if "%INPUT%"=="5" goto netconfig18
if "%INPUT%"=="H" goto hideaccount
if "%INPUT%"=="S" goto showaccount
if "%INPUT%"=="h" goto hideaccount
if "%INPUT%"=="s" goto showaccount
if "%INPUT%"=="r" NET STOP SERVER /Y
if "%INPUT%"=="r" NET STOP WORKSTATION /Y
if "%INPUT%"=="r" NET START SERVER
if "%INPUT%"=="r" NET START WORKSTATION
if "%INPUT%"=="r" goto netconfig
if "%INPUT%"=="R" NET STOP SERVER /Y
if "%INPUT%"=="R" NET STOP WORKSTATION /Y
if "%INPUT%"=="R" NET START SERVER
if "%INPUT%"=="R" NET START WORKSTATION
if "%INPUT%"=="R" goto netconfig
if "%INPUT%"=="1A" goto addadvancedshare
if "%INPUT%"=="1a" goto addadvancedshare
if "%INPUT%"=="1B" goto addindividualshare
if "%INPUT%"=="1b" goto addindividualshare
@echo No valid command specified.
@echo Type 1,2,3,4,5,6,7,8,9,0,=,-,H,S or Q
goto netconfig
:netconfig2
NET SHARE
pause
@echo Enter the name of the share e.g. Jacks_share
set INPUT=
set /P INPUT=%=%
if not "%INPUT%"=="" set sharename=%INPUT%
if not "%sharename%"=="" set INPUT=
if not "%sharename%"=="" goto netconfig3
set INPUT=
@echo No value entered.
goto netconfig
:netconfig3
@echo Enter the address of the share e.g. C:\WINDOWS
set INPUT=
set /P INPUT=%=%
if "%INPUT%"=="" @echo No value entered.
if not "%INPUT%"=="" set sharedirectory=%INPUT%
if not "%sharedirectory%"=="" goto netconfig4
goto netconfig
:netconfig4
@echo Enter maximum number of connections E.g. 2, leave blank for unlimited.
set INPUT=
set /P INPUT=%=%
if not "%INPUT%"=="" set sharemaximumusers=%INPUT%
if not "%sharemaximumusers%"=="" set INPUT=
if not "%sharemaximumusers%"=="" goto netconfig5
if "%INPUT%"=="" goto netconfig5-unlimited
@echo A unexpected error occurred.
goto netconfig
:netconfig5
@echo Adding the share please wait...
NET SHARE "%sharename%"="%sharedirectory%" /USERS:%sharemaximumusers% /REMARK:"%sharename%"
@echo Command executed.
goto netconfig
:netconfig5-unlimited
@echo Adding the share please wait...
NET SHARE "%sharename%"="%sharedirectory%" /UNLIMITED /REMARK:"%sharename%"
@echo Command executed.
goto netconfig
:netconfig6
@echo Availble shares:
@echo -----------------------------------------------
NET SHARE
@echo -----------------------------------------------
pause
@echo Enter the name of the share You want to remove.
set INPUT=
set /P INPUT=%=%
if not "%INPUT%"=="" NET SHARE %INPUT% /DELETE
if not "%INPUT%"=="" @echo Command executed.
if "%INPUT%"=="" @echo No value entered.
set INPUT=
goto netconfig
:netconfig7
@echo Current users:
NET USER
PAUSE
@echo Enter the name of the user You want to add.
set INPUT=
set /P INPUT=%=%
if "%INPUT%"=="" @echo No value entered.
if not "%INPUT%"=="" set adduser=%INPUT%
if not "%adduser%"=="" goto netconfig8
set INPUT=
goto netconfig
:netconfig8
@echo Enter a password to be set, or leave this blank if You do not want one.
set INPUT=
set /P INPUT=%=%
if not "%INPUT%"=="" set adduserpassword=%INPUT%
if "%INPUT%"=="" set adduserpassword=
set INPUT=
goto netconfig9
:netconfig9
@echo Adding the user account...
NET USER %adduser% %adduserpassword% /ADD /Y
@echo Command executed.
goto netconfig
:netconfig10
@echo Currently avalible users:
NET USER
@echo Enter the username to be removed.
set INPUT=
set /P INPUT=%=%
if "%INPUT%"=="" @echo No value entered.
if not "%INPUT%"=="" NET USER %INPUT% /DELETE
if not "%INPUT%"=="" @echo Command executed.
set INPUT=
goto netconfig
:netconfig11
@echo Currenly avalible users:
NET USER
@echo Enter the username to be enabled/disabled.
set INPUT=
set /P INPUT=%=%
if not "%INPUT%"=="" set netdisenusr=%INPUT%
if "%INPUT%"=="" @echo No value entered.
if not "%netdisenusr%"=="" set INPUT=
if not "%netdisenusr%"=="" goto netconfig12
set INPUT=
goto netconfig
:netconfig12
@echo E=Enable D=Disable
set INPUT=
set /P INPUT=%=%
if "%INPUT%"=="E" NET USER %netdisenusr% /ACTIVE:YES
if "%INPUT%"=="D" NET USER %netdisenusr% /ACTIVE:NO
if "%INPUT%"=="e" NET USER %netdisenusr% /ACTIVE:YES
if "%INPUT%"=="d" NET USER %netdisenusr% /ACTIVE:NO
if "%INPUT%"=="" @echo No value entered.
set INPUT=
goto netconfig
:netconfig13
@echo Currently avalible users:
NET USER
@echo Enter a username.
set INPUT=
set /P INPUT=%=%
if not "%INPUT%"=="" net user %INPUT% *
if "%INPUT%"=="" @echo No value entered.
set INPUT=
goto netconfig
:netconfig14
@echo Enter a username.
set INPUT=
set /P INPUT=%=%
if "%INPUT%=="" @echo No value entered.
if "%INPUT%"=="" goto netconfig
set netusrfll=%INPUT%
set INPUT=
goto netconfig15
:netconfig15
@echo Enter the full name of the account.
set INPUT=
set /P INPUT=%=%
if not "%INPUT%"=="" net user netusrfll /fullname:%INPUT%
if "%INPUT%"=="" @echo No value entered.
set INPUT=
goto netconfig
:netconfig16
@echo Enter a username. Leave blank for this account.
set INPUT=
set /P INPUT=%=%
if not "%INPUT%"=="" net user %INPUT%
if not "%INPUT%"=="" pause
if "%INPUT%"=="" net user
if "%INPUT%"=="" pause
set INPUT=
goto netconfig
:netconfig17
@echo Currently avalible users:
NET USER
@echo Enter a username.
set INPUT=
set /P INPUT=%=%
if not "%INPUT%"=="" @echo Adding the account "%INPUT%" to the
if not "%INPUT%"=="" @echo Administrator localgroup...
if not "%INPUT%"=="" net localgroup administrators %INPUT% /add
if not "%INPUT%"=="" @echo Command executed.
if "%INPUT%"=="" @echo No value entered.
set INPUT=
goto netconfig
:netconfig18
@echo Currently avalible users:
NET USER
@echo Enter a username.
set INPUT=
set /P INPUT=%=%
if not "%INPUT%"=="" @echo Removing the account "%INPUT%" from the
if not "%INPUT%"=="" @echo Administrator localgroup...
if not "%INPUT%"=="" net localgroup administrators %INPUT% /DELETE
if not "%INPUT%"=="" @echo Command executed.
if "%INPUT%"=="" @echo No value entered.
set INPUT=
goto netconfig
:showaccount
if not "%perm%"=="root" @echo This command requires root permissions.
if not "%perm%"=="root" @echo Unable to execute the requested command.
if not "%perm%"=="root" goto terminal
@echo Enter the username to be shown.
set INPUT=
set /P INPUT=%=%
if "%INPUT%"=="" @echo No value entered.
if not "%INPUT%"=="" set showaccount=%INPUT%
if not "%showaccount%"=="" set INPUT=
if not "%showaccount%"=="" goto showaccount2
if "%command%"=="showuser" goto terminal
if "%command%"=="SHOWUSER" goto terminal
goto netconfig
:showaccount2
@echo Writing the registry file...
echo Windows Registry Editor Version 5.00 > "%TEMP%\showaccount.reg"
echo  >> "%TEMP%\showaccount.reg"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList] >> "%TEMP%\showaccount.reg"
echo "%showaccount%"=dword:00000001 >> "%TEMP%\showaccount.reg"
echo  >> "%TEMP%\showaccount.reg"
echo  >> "%TEMP%\showaccount.reg"
if exist "%TEMP%\showaccount.reg" regedit /s /q "%TEMP%\showaccount.reg"
if exist "%TEMP%\showaccount.reg" @echo Command completed!
if not exist "%TEMP%\showaccount.reg" @echo Error! Unable to write the registry file!
if exist "%TEMP%\showaccount.reg" @echo Deleting temporary file...
if exist "%TEMP%\showaccount.reg" del "%TEMP%\showaccount.reg"
if not exist "%TEMP%\showaccount.reg" @echo File deleted succesfully!
if exist "%TEMP%\showaccount.reg" @echo Unable to delete the temporary file!
@echo Cleanup operations executed.
if "%command%"=="showuser" goto terminal
if "%command%"=="SHOWUSER" goto terminal
goto netconfig
:hideaccount
if not "%perm%"=="root" @echo This command requires root permissions.
if not "%perm%"=="root" @echo Unable to execute the requested command.
if not "%perm%"=="root" goto terminal
@echo Enter the username to be hidden.
set hideaccount=
set /P hideaccount=%=%
if not "%hideaccount%"=="" goto hideaccount2
@echo No value entered.
set hideaccount=
if "%command%"=="hideuser" goto terminal
if "%command%"=="HIDEUSER" goto terminal
goto netconfig
:hideaccount2
@echo Writing the registry file...
echo Windows Registry Editor Version 5.00 > "%TEMP%\hideaccount.reg"
echo >> "%TEMP%\hideaccount.reg"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList] >> "%TEMP%\hideaccount.reg"
echo "%hideaccount%"=dword:00000000 >> "%TEMP%\hideaccount.reg"
echo >> "%TEMP%\hideaccount.reg"
echo >> "%TEMP%\hideaccount.reg"
if not exist "%TEMP%\hideaccount.reg" @echo Error! Unable to write the registry file!
regedit /s /q "%TEMP%\hideaccount.reg"
@echo Command completed!
@echo Deleting temporary file...
del "%TEMP%\hideaccount.reg"
if not exist "%TEMP%\hideaccount.reg" @echo File deleted succesfully!
if exist "%TEMP%\hideaccount.reg" @echo Unable to delete the temporary file!
@echo Cleanup operations executed.
if "%command%"=="hideuser" goto terminal
if "%command%"=="HIDEUSER" goto terminal
goto netconfig
:mountfolder
@echo Enter a drive letter E.g. E:
set mountfolderdrive=
set /P mountfolderdrive=%=%
if not "%mountfolderdrive%"=="" goto mountfolder2
@echo No value entered.
set mountfolderdrive=
goto terminal
:mountfolder2
@echo Enter a drive path E.g. C:\Windows
set mountfolderpath=
set /P mountfolderpath=%=%
if "%mountfolderpath%"=="" (
@echo No value entered.
set mountfolderpath=
goto terminal
)
if exist %mountfolderdrive% @echo The drive "%mountfolderdrive%" is already mounted.
if exist %mountfolderdrive% goto terminal
subst %mountfolderdrive% %mountfolderpath%
if exist %mountfolderdrive% @echo The drive "%mountfolderdrive%" was successfully mounted.
if not exist %mountfolderdrive% @echo Unable to mount the drive "%mountfolderdrive%".
goto terminal
:unmountfolder
@echo Enter a drive letter E.g. E:
set INPUT=
set /P INPUT=%=%
if "%INPUT%"=="" (
@echo No value entered.
set INPUT=
goto terminal
)
subst %INPUT% /D
if exist "%INPUT%" @echo Unable to unmount "%INPUT%".
if not exist "%INPUT%" @echo Successfully unmounted "%INPUT%".
goto terminal


:starthotspot
if not "%perm%"=="root" @echo This command requires root to run. Cannot continue.
if not "%perm%"=="root" pause >nul
if not "%perm%"=="root" goto terminal
netsh wlan > "%TEMP%\OSCheck-mkhotspot.tmp"
if not exist "%TEMP%\OSCheck-mkhotspot.tmp" @echo Unable to determine the OS version due to a file error.
if not exist "%TEMP%\OSCheck-mkhotspot.tmp" pause >nul
if not exist "%TEMP%\OSCheck-mkhotspot.tmp" exit
findstr /m "hosted" "%TEMP%\OSCheck-mkhotspot.tmp" >nul
if %errorlevel%==1 (
@echo The current OS is not supported.
pause >nul
goto terminal
)
if %errorlevel%==0 (
@echo OS Supported=True.
)
del "%TEMP%\OSCheck-mkhotspot.tmp" >nul
if "%AP_Status%"=="Started" @echo The AP seems to be already started.
if "%AP_Status%"=="Started" goto terminal
set wifi_ap_name=WindowsAP
set wifi_ap_passwd=%RANDOM%%RANDOM%%RANDOM%
set AP_Status=Stopped
@echo Checking if a configuration file exists...
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" @echo Configuration file found.
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" goto acquire_configuration_v2
@echo No configuration file found. Do you want to go to the configuration panel?
set starthotspot_option=
set /p starthotspot_option=Y/N: %=%
if "%starthotspot_option%"=="y" goto wifihotspot
if "%starthotspot_option%"=="Y" goto wifihotspot
goto terminal
:acquire_configuration_v2
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" rename "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" "wifi_hotspot_configuration.bat"
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.bat" call "%LOCALAPPDATA%\wifi_hotspot_configuration.bat"
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.bat" @echo Unable to acquire the configuration file.
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.bat" pause >nul
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.bat" goto terminal
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.bat" rename "%LOCALAPPDATA%\wifi_hotspot_configuration.bat" "wifi_hotspot_configuration.dat"
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" @echo Configuration file executed.
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" @echo Checking variables...
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" goto check_configuration_v2
:check_configuration_v2
if not "%wifi_ap_name%"=="" @echo wifi_ap_name successfully set.
if not "%wifi_ap_passwd%"=="" @echo wifi_ap_passwd successfully set.
if "%wifi_ap_name%"=="" @echo wifi_ap_name failed to be set.
if "%wifi_ap_name%"=="" pause >nul
if "%wifi_ap_name%"=="" goto terminal
if "%wifi_ap_passwd%"=="" @echo wifi_ap_passwd failed to be set.
if "%wifi_ap_passwd%"=="" pause >nul
if "%wifi_ap_passwd%"=="" goto terminal
@echo Variable check passed. Returning to setnetshconfig...
goto setnetshconfig_v2
@echo Unexpected error encountered. Unable to go to setnetshconfig.
pause >nul
goto terminal
:setnetshconfig_v2
cls
netsh wlan stop hostednetwork >nul
netsh wlan set hostednetwork ssid="%wifi_ap_name%"
netsh wlan set hostednetwork key="%wifi_ap_passwd%" keyUsage=persist
cls
:starthotspot_v2_execute
@echo Starting the AP...
netsh wlan start hostednetwork
set AP_Status=Started
cls
goto terminal
:stophotspot
if not "%perm%"=="root" @echo This command requires root to run. Cannot continue.
if not "%perm%"=="root" pause >nul
if not "%perm%"=="root" goto terminal
netsh wlan > "%TEMP%\OSCheck-mkhotspot.tmp"
if not exist "%TEMP%\OSCheck-mkhotspot.tmp" @echo Unable to determine the OS version due to a file error.
if not exist "%TEMP%\OSCheck-mkhotspot.tmp" pause >nul
if not exist "%TEMP%\OSCheck-mkhotspot.tmp" exit
findstr /m "hosted" "%TEMP%\OSCheck-mkhotspot.tmp" >nul
if %errorlevel%==1 (
@echo The current OS is not supported.
pause >nul
goto terminal
)
if %errorlevel%==0 (
@echo OS Supported=True.
)
del "%TEMP%\OSCheck-mkhotspot.tmp" >nul
if not "%AP_Status%"=="Started" @echo The AP variable seems to be already set as stopped.
@echo Stopping the AP...
netsh wlan stop hostednetwork
set AP_Status=Stopped
cls
goto terminal
:lavaprompt_information_print
@echo Date and Time of creation: %lpdate%
@echo LavaPrompt version No: %lpversionno%
@echo LavaPrompt version: %lpversion%
@echo Lines of script: %lplinesofcode%
pause >nul
goto terminal
:lavaprompt-restrict-execution
color c
@echo UNDER CONSTRUCTION
@echo ------------------
@echo.
@echo Expected to be constructed in the next version.
pause >nul
color 07
goto terminal
@echo LavaPrompt restriction panel.
@echo -----------------------------
@echo.
if exist "%SystemDrive%\Documents and Settings\._lpconfig\lre.dat" (
if exist "%TEMP%\lre.bat" del "%TEMP%\lre.bat" >nul
if exist "%TEMP%\lre.bat" @echo Unable to remove the temporary file.
if exist "%TEMP%\lre.bat" goto terminal
copy "%SystemDrive%\Documents and Settings\._lpconfig\lre.dat" "%TEMP%\lre.bat"
if exist "%TEMP%\lre.bat" call "%TEMP%\lre.bat"
if exist "%TEMP%\lre.bat" del "%TEMP%\lre.bat" >nul
if exist "%TEMP%\lre.bat" @echo Unable to remove the temporary file.
if exist "%TEMP%\lre.bat" goto terminal
)
:starthotspot_cmd
if not "%perm%"=="root" @echo This command requires root to run. Cannot continue.
if not "%perm%"=="root" exit
netsh wlan > "%TEMP%\OSCheck-mkhotspot.tmp"
if not exist "%TEMP%\OSCheck-mkhotspot.tmp" @echo Unable to determine the OS version due to a file error.
if not exist "%TEMP%\OSCheck-mkhotspot.tmp" exit
findstr /m "hosted" "%TEMP%\OSCheck-mkhotspot.tmp" >nul
if %errorlevel%==1 (
@echo The current OS is not supported.
pause >nul
goto terminal
)
del "%TEMP%\OSCheck-mkhotspot.tmp" >nul
if "%AP_Status%"=="Started" @echo The AP seems to be already started.
if "%AP_Status%"=="Started" exit
set wifi_ap_name=WindowsAP
set wifi_ap_passwd=%RANDOM%%RANDOM%%RANDOM%
set AP_Status=Stopped
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" goto acquire_configuration_v2_cmd
@echo No configuration file found.
exit
:acquire_configuration_v2_cmd
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" rename "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" "wifi_hotspot_configuration.bat"
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.bat" call "%LOCALAPPDATA%\wifi_hotspot_configuration.bat"
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.bat" @echo Unable to acquire the configuration file.
if not exist "%LOCALAPPDATA%\wifi_hotspot_configuration.bat" exit
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.bat" rename "%LOCALAPPDATA%\wifi_hotspot_configuration.bat" "wifi_hotspot_configuration.dat"
if exist "%LOCALAPPDATA%\wifi_hotspot_configuration.dat" goto check_configuration_v2_cmd
:check_configuration_v2_cmd
if "%wifi_ap_name%"=="" @echo wifi_ap_name failed to be set.
if "%wifi_ap_name%"=="" exit
if "%wifi_ap_passwd%"=="" @echo wifi_ap_passwd failed to be set.
if "%wifi_ap_passwd%"=="" exit
goto setnetshconfig_v2_cmd
@echo Unexpected error encountered. Unable to go to setnetshconfig.
exit
:setnetshconfig_v2_cmd
netsh wlan stop hostednetwork >nul
netsh wlan set hostednetwork ssid="%wifi_ap_name%">nul
netsh wlan set hostednetwork key="%wifi_ap_passwd%" keyUsage=persist>nul
:starthotspot_v2_execute_cmd
netsh wlan start hostednetwork
set AP_Status=Started
exit
:stophotspot_cmd
if not "%perm%"=="root" @echo This command requires root to run. Cannot continue.
if not "%perm%"=="root" exit
netsh wlan > "%TEMP%\OSCheck-mkhotspot.tmp"
if not exist "%TEMP%\OSCheck-mkhotspot.tmp" @echo Unable to determine the OS version due to a file error.
if not exist "%TEMP%\OSCheck-mkhotspot.tmp" exit
findstr /m "hosted" "%TEMP%\OSCheck-mkhotspot.tmp" >nul
if %errorlevel%==1 (
@echo The current OS is not supported.
exit
)
del "%TEMP%\OSCheck-mkhotspot.tmp" >nul
netsh wlan stop hostednetwork
set AP_Status=Stopped
exit
:systeminfo
@echo Gathering the required information...
if not exist "%SystemRoot%\System32\systeminfo.exe" @echo The file "systeminfo.exe" cannot be located.
if not exist "%SystemRoot%\System32\systeminfo.exe" goto terminal
"%SystemRoot%\System32\systeminfo.exe"
pause >nul
goto terminal
:lpbypassed_windows-fs_exploit
if not "%perm%"=="root" goto lpbypassed_windows-fs_exploit_root_null
@echo LavaPrompt is currently running in root mode.
@echo It may be a waste of time running this exploit.
@echo Continue?
set exploit_option=
set /p exploit_option=Y/N: %=%
if "%exploit_option%"=="Y" goto lpbypassed_windows-fs_exploit_root_null
if "%exploit_option%"=="y" goto lpbypassed_windows-fs_exploit_root_null
@echo Exploit operation cancelled.
set exploit_option=
goto terminal
:lpbypassed_windows-fs_exploit_root_null
COLOR C
@echo Exploiting the FS... GET IT OUT OF MY HEAD!!!!!!!!!! x(
@echo LOG:
@echo --------------------------------------------------------------------------------
@echo EXPLOIT PART 1: - %SystemDrive% ROOT PERMISSION EXPLOIT/LOG.
set RANDOMDIRECTORY=%RANDOM%%RANDOM%%RANDOM%
if exist "%SystemDrive%\%RANDOMDIRECTORY%" @echo FOUND "%SystemDrive%\%RANDOMDIRECTORY%"!
if exist "%SystemDrive%\%RANDOMDIRECTORY%" @echo REMOVING "%SystemDrive%\%RANDOMDIRECTORY%"...
if exist "%SystemDrive%\%RANDOMDIRECTORY%" RD /S /Q "%SystemDrive%\%RANDOMDIRECTORY%">NUL
if exist "%SystemDrive%\%RANDOMDIRECTORY%" @echo FAILED REMOVING "%SystemDrive%\%RANDOMDIRECTORY%"!
if exist "%SystemDrive%\%RANDOMDIRECTORY%" @echo Skipping exploit part 1!!!!
if exist "%SystemDrive%\%RANDOMDIRECTORY%" goto lpbypasssed_windows-fs_exploit_root_null_2
@echo CREATING DIR "%SystemDrive%\%RANDOMDIRECTORY%"...
MKDIR "%SystemDrive%\%RANDOMDIRECTORY%">nul
if not exist "%SystemDrive%\%RANDOMDIRECTORY%" @echo FAILED CREATING "%SystemDrive%\%RANDOMDIRECTORY%"!
if not exist "%SystemDrive%\%RANDOMDIRECTORY%" @echo Skipping exploit part 1!!!!
if not exist "%SystemDrive%\%RANDOMDIRECTORY%" goto lpbypasssed_windows-fs_exploit_root_null_2
if exist "%SystemDrive%\%RANDOMDIRECTORY%" @echo CREATED "%SystemDrive%\%RANDOMDIRECTORY%"!
if exist "%SystemDrive%\%RANDOMDIRECTORY%" @echo REMOVING "%SystemDrive%\%RANDOMDIRECTORY%"...
if exist "%SystemDrive%\%RANDOMDIRECTORY%" RD /S /Q "%SystemDrive%\%RANDOMDIRECTORY%">NUL
if exist "%SystemDrive%\%RANDOMDIRECTORY%" @echo FAILED REMOVING "%SystemDrive%\%RANDOMDIRECTORY%"!
:lpbypasssed_windows-fs_exploit_root_null_2
set RANDOMDIRECTORY=
@echo --------------------------------------------------------------------------------
@echo EXPLOIT PART 2: - %SystemRoot% ROOT PERMISSION EXPLOIT/LOG.
set RANDOMFILENAME=%RANDOM%%RANDOM%%RANDOM%.tmp
if exist "%SystemRoot%\%RANDOMFILENAME%" @echo FOUND "%SystemRoot%\%RANDOMFILENAME%"!
if exist "%SystemRoot%\%RANDOMFILENAME%" @echo REMOVING "%SystemRoot%\%RANDOMFILENAME%"...
if exist "%SystemRoot%\%RANDOMFILENAME%" DEL "%SystemRoot%\%RANDOMFILENAME%" >nul
if exist "%SystemRoot%\%RANDOMFILENAME%" @echo FAILED REMOVING "%SystemRoot%\%RANDOMFILENAME%"!
if exist "%SystemRoot%\%RANDOMFILENAME%" @echo Skipping exploit part 2!!!!
if exist "%SystemRoot%\%RANDOMFILENAME%" goto lpbypassed_windows-fs_exploit_root_null_3
@echo CREATING FILE "%SystemRoot%\%RANDOMFILENAME%"...
@echo. > "%SystemRoot%\%RANDOMFILENAME%"
if not exist "%SystemRoot%\%RANDOMFILENAME%" @echo FAILED CREATING "%SystemRoot%\%RANDOMFILENAME%"!
if not exist "%SystemRoot%\%RANDOMFILENAME%" @echo Skipping exploit part 2!!!!
if not exist "%SystemRoot%\%RANDOMFILENAME%" goto lpbypassed_windows-fs_exploit_root_null_3
if exist "%SystemRoot%\%RANDOMFILENAME%" @echo CREATED "%SystemRoot%\%RANDOMFILENAME%"!
if exist "%SystemRoot%\%RANDOMFILENAME%" @echo REMOVING "%SystemRoot%\%RANDOMFILENAME%"...
if exist "%SystemRoot%\%RANDOMFILENAME%" DEL "%SystemRoot%\%RANDOMFILENAME%" >nul
if exist "%SystemRoot%\%RANDOMFILENAME%" @echo FAILED REMOVING "%SystemRoot%\%RANDOMFILENAME%"!
:lpbypassed_windows-fs_exploit_root_null_3
set RANDOMFILENAME=
@echo --------------------------------------------------------------------------------
@echo EXPLOIT PART 3: - %SystemRoot% TAKE OWNERSHIP EXPLOIT/LOG.
if not exist "%SystemRoot%\explorer.exe" @echo FAILED TO FIND EXPLORER.EXE
if not exist "%SystemRoot%\explorer.exe" @echo Skipping exploit part 3!!!!
if not exist "%SystemRoot%\explorer.exe" goto lpbypassed_windows-fs_exploit_root_null_4
@echo TAKING OWNERSHIP OF "explorer.exe"...
TAKEOWN /f "%SystemRoot%\explorer.exe" > "%TEMP%\TAKEOWN_LOG.txt"
if not exist "%TEMP%\TAKEOWN_LOG.txt" @echo FAILED TO WRITE TEMP FILE!
if not exist "%TEMP%\TAKEOWN_LOG.txt" @echo Skipping exploit part 3!!!!
set stringtofind=SUCCESS
findstr /m "%stringtofind%" "%TEMP%\TAKEOWN_LOG.txt" >nul
if %errorlevel%==1 (
@echo SUCCESS! TAKEOWN "%SystemRoot%\explorer.exe".
)
if %errorlevel%==0 (
@echo FAIL! UNABLE TO TAKEOWN "%SystemRoot%\explorer.exe"!
)
DEL "%TEMP%\TAKEOWN_LOG.txt">NUL
if exist "%TEMP%\TAKEOWN_LOG.txt" @echo FAIL! UNABLE TO REMOVE "%TEMP%\TAKEOWN_LOG.txt"!
:lpbypassed_windows-fs_exploit_root_null_4
@echo IN-COMPLETE SECTORS! EXPLOIT SCRIPTS NOT COMPLETE.
@echo BETTER EXPLOITS/LOGS ARE ON THE WAY!
pause >nul
color 07
goto terminal
:android_toolkit
@echo ANDROID TOOLKIT
@echo ---------------
set PATH=%PATH%;%APPDATA%\LavaPrompt
set android_option=
@echo 1 - Root/Unroot with the ADB restore exploit by Bin4ry.
@echo 2 - Root (No unroot function. Sorry) with Motochopper by Dan Rosenberg.
@echo exit - Return to LavaPrompt.
set /p android_option=Option: %=%
if "%android_option%"=="1" goto android_toolkit_root_with_adb_restore_bin4ry
if "%android_option%"=="2" goto android_toolkit_root_with_motochopper_dan_rosenberg
if "%android_option%"=="exit" goto terminal
if "%android_option%"=="Exit" goto terminal
if "%android_option%"=="eXIT" goto terminal
if "%android_option%"=="EXIT" goto terminal
@echo No valid option specified.
goto android_toolkit
:android_toolkit_root_with_adb_restore_bin4ry
cls
@echo --------------------------------------------------------------
@echo Root with ADB restore v18: Android root exploit.
@echo Script by Bin4ry (thanks to Goroh_kun and tkymgr for the idea)
@echo Idea for Tablet S from Fi01_IS01
@echo --------------------------------------------------------------
set nxt=0
set ric=0
echo Device type:
echo 1) Normal
echo 2) Special (for example: Sony Tablet S, Medion Lifetab)
echo.
echo x) Unroot
echo.
set /p type=Make a choice: 
if %type% == 1 GOTO bin4ry_TEST
if %type% == 2 GOTO bin4ry_TABSMENU
if %type% == x GOTO bin4ry_UNROOT
echo.
echo Please Enter a valid number (1 to x)
echo.
GOTO android_toolkit_root_with_adb_restore_bin4ry
:bin4ry_TEST
echo Checking if i should run in Normal Mode or special Sony Mode
echo Please connect your device with USB-Debugging enabled now
echo Waiting for device to shop up, if nothing happens please check if Windows ADB-drivers are installed correctly!
stuff\adb.exe wait-for-device
stuff\adb.exe pull /system/app/Backup-Restore.apk . > NUL
stuff\adb.exe pull /system/bin/ric . > NUL
if EXIST ric (set ric=1) else (echo .)
if EXIST Backup-Restore.apk (GOTO XPS) else (echo .)
GOTO bin4ry_OTHER
:bin4ry_UNROOT
set /p unr=Really (y/n) ?
IF %unr% == n GOTO android_toolkit_root_with_adb_restore_bin4ry
stuff\adb.exe push stuff\busybox /data/local/tmp/busybox
stuff\adb.exe shell "chmod 755 /data/local/tmp/busybox"
stuff\adb.exe shell "su -c '/data/local/tmp/busybox mount -o remount,rw /system'"
stuff\adb.exe shell "su -c 'rm /system/xbin/su'"
stuff\adb.exe shell "su -c 'rm /system/app/Superuser.apk'"
GOTO bin4ry_FINISH
:bin4ry_TABSMENU
echo.
echo Special mode:
echo 1) Root
echo 2) Rollback
set /p tabtype=Make a choice: 
if %tabtype% == 1 GOTO bin4ry_TABS
if %tabtype% == 2 GOTO bin4ry_TABS_RB
:bin4ry_TABS
echo.
echo Tablet S mode enabled!
echo.
GOTO bin4ry_START
:bin4ry_XPS
echo.
echo Found Sony Backup-Restore.apk
echo LT26,LT22 etc. mode enabled!
echo.
del Backup-Restore.apk
if %ric% == 1 (del ric) else (echo .)
set NXT=1
GOTO bin4ry_START
:bin4ry_TABS_RB
echo.
echo Tablet S Roll Back
echo.
echo Please connect device with ADB-Debugging enabled now....
stuff\adb.exe wait-for-device
FOR /F "tokens=1 delims=" %%A in ('stuff\adb.exe shell "if [ -d /data/app- ]; then echo 1 ; else echo 0 ; fi"') do SET tabs_app=%%A
if %tabs_app% == 1 GOTO bin4ry_TABS_RB_1
if %tabs_app% == 0 GOTO bin4ry_TABS_RB_2
:bin4ry_TABS_RB_1
stuff\adb.exe shell "rm -r /data/data/com.android.settings/a/*"
stuff\adb.exe restore stuff/tabletS.ab
echo Please look at your device and click "Restore my data"
echo.
stuff\adb.exe shell "while [ ! -d /data/data/com.android.settings/a/file99 ] ; do echo 1; done" > NUL
echo 1st RESTORE OK, hit ENTER to continue.
pause
stuff\adb.exe shell "rm -r /data/data/com.android.settings/a"
stuff\adb.exe restore stuff/tabletS.ab
echo Please look at your device and click "Restore my data"
echo.
stuff\adb.exe shell "while : ; do ln -s /data /data/data/com.android.settings/a/file99; [ -f /data/file99 ] && exit; done" > NUL
stuff\adb.exe shell "rm -r /data/file99"
echo Achieved! hit ENTER to continue.
echo.
pause
stuff\adb.exe shell "mv /data/system /data/system3"
stuff\adb.exe shell "mv /data/system- /data/system"
stuff\adb.exe shell "mv /data/app /data/app3"
stuff\adb.exe shell "mv /data/app- /data/app"
echo "Roll back compelted."
GOTO bin4ry_FINISH
:bin4ry_TABS_RB_2
echo.
echo.
echo "Roll back failed. /data/app- not found."
echo.
echo.
GOTO bin4ry_FINISH
:bin4ry_OTHER
echo.
echo Normal Mode enabled!
if %ric% == 1 (del ric) else (echo .)
echo.
:bin4ry_START
stuff\adb.exe wait-for-device
IF %type% == 2 GOTO bin4ry_TABTRICK
echo Pushing busybox....
stuff\adb.exe push stuff/busybox /data/local/tmp/.
echo Pushing su binary ....
stuff\adb.exe push stuff/su /data/local/tmp/.
echo Pushing Superuser app
stuff\adb.exe push stuff/Superuser.apk /data/local/tmp/.
echo Making busybox runable ...
stuff\adb.exe shell chmod 755 /data/local/tmp/busybox
if %ric% == 1 (stuff\adb.exe push stuff/ric /data/local/tmp/ric) else (echo .)
IF %nxt% == 1 GOTO bin4ry_XPSTRICK
stuff\adb.exe restore stuff/fakebackup.ab
echo Please look at your device and click RESTORE!
echo If all is successful i will tell you, if not this shell will run forever.
echo Running ...
stuff\adb.exe shell "while ! ln -s /data/local.prop /data/data/com.android.settings/a/file99; do :; done" > NUL
echo Successful, going to reboot your device in 10 seconds!
ping -n 10 127.0.0.1 > NUL
stuff\adb.exe reboot
echo Waiting for device to show up again....
ping -n 10 127.0.0.1 > NUL
stuff\adb.exe wait-for-device
GOTO bin4ry_NORMAL
:bin4ry_TABTRICK
stuff\adb.exe install -s stuff/Term.apk
stuff\adb.exe push stuff/busybox /data/local/tmp/.
stuff\adb.exe push stuff/su /data/local/tmp/.
stuff\adb.exe push stuff/Superuser.apk /data/local/tmp/.
stuff\adb.exe push stuff/rootkittablet.tar.gz /data/local/tmp/rootkittablet.tar.gz
stuff\adb.exe shell "chmod 755 /data/local/tmp/busybox"
stuff\adb.exe shell "/data/local/tmp/busybox tar -C /data/local/tmp -x -v -f /data/local/tmp/rootkittablet.tar.gz"
stuff\adb.exe shell "chmod 644 /data/local/tmp/VpnFaker.apk"
stuff\adb.exe shell "touch -t 1346025600 /data/local/tmp/VpnFaker.apk"
stuff\adb.exe shell "chmod 755 /data/local/tmp/_su"
stuff\adb.exe shell "chmod 755 /data/local/tmp/su"
stuff\adb.exe shell "chmod 755 /data/local/tmp/onload.sh"
stuff\adb.exe shell "chmod 755 /data/local/tmp/onload2.sh"
stuff\adb.exe shell "rm -r /data/data/com.android.settings/a/*"
stuff\adb.exe restore stuff/tabletS.ab
echo Please look at your device and click "Restore my data"
echo.
stuff\adb.exe shell "while [ ! -d /data/data/com.android.settings/a/file99 ] ; do echo 1; done" > NUL
ping -n 3 127.0.0.1 > NUL
echo 1st RESTORE OK, hit ENTER to continue.
pause
stuff\adb.exe shell "rm -r /data/data/com.android.settings/a"
stuff\adb.exe restore stuff/tabletS.ab
echo Please look at your device and click "Restore my data"
echo.
stuff\adb.exe shell "while : ; do ln -s /data /data/data/com.android.settings/a/file99; [ -f /data/file99 ] && exit; done" > NUL
stuff\adb.exe shell "rm -r /data/file99"
ping -n 3 127.0.0.1 > NUL
echo Achieved! hit ENTER to continue.
echo.
pause
stuff\adb.exe shell "/data/local/tmp/busybox cp -r /data/system /data/system2"
stuff\adb.exe shell "/data/local/tmp/busybox find /data/system2 -type f -exec chmod 666 {} \;"
stuff\adb.exe shell "/data/local/tmp/busybox find /data/system2 -type d -exec chmod 777 {} \;"
stuff\adb.exe shell "mv /data/system /data/system-"
stuff\adb.exe shell "mv /data/system2 /data/system"
stuff\adb.exe shell "mv /data/app /data/app-"
stuff\adb.exe shell "mkdir /data/app"
stuff\adb.exe shell "mv /data/local/tmp/VpnFaker.apk /data/app"
stuff\adb.exe shell "/data/local/tmp/busybox sed -f /data/local/tmp/packages.xml.sed /data/system-/packages.xml > /data/system/packages.xml"
stuff\adb.exe shell "sync; sync; sync"
echo Need to reboot now!
stuff\adb.exe reboot
ping -n 3 127.0.0.1 > NUL
echo Waiting for device to come up again....
stuff\adb.exe wait-for-device
echo Unlock your device, a Terminal will show now, type this 2 lines, after each line press ENTER
echo /data/local/tmp/onload.sh
echo /data/local/tmp/onload2.sh
echo after this is done press a key here in this shell to continue!
echo If the shell on your device does not show please re-start the process!
stuff\adb.exe shell "am start -n com.android.vpndialogs/.Term"
pause
GOTO bin4ry_TABTRICK1
:bin4ry_TABTRICK1
stuff\adb.exe push stuff/script1.sh /data/local/tmp/.
stuff\adb.exe shell "chmod 755 /data/local/tmp/script1.sh"
stuff\adb.exe shell "/data/local/tmp/script1.sh"
echo Almost complete! Reboot and cleanup.
stuff\adb.exe reboot
ping -n 3 127.0.0.1 > NUL
echo Waiting for device to come up again....
stuff\adb.exe wait-for-device
stuff\adb.exe shell "su -c 'rm -r /data/app2'"
stuff\adb.exe shell "su -c 'rm -r /data/system2'"
stuff\adb.exe shell "su -c 'rm -r /data/local/tmp/*'"
GOTO bin4ry_FINISH
:bin4ry_XPSTRICK
set %NXT%=0
echo Pushing fake Backup
stuff\adb.exe push stuff\RootMe.tar /data/local/tmp/RootMe.tar
stuff\adb.exe shell "mkdir /mnt/sdcard/.semc-fullbackup > /dev/null 2>&1"
echo Extracting fakebackup on device ...
stuff\adb.exe shell "cd /mnt/sdcard/.semc-fullbackup/; /data/local/tmp/busybox tar xf /data/local/tmp/RootMe.tar"
echo Watch now your device. Select the backup named RootMe and restore it!
stuff\adb.exe shell "am start com.sonyericsson.vendor.backuprestore/.ui.BackupActivity"
echo If all is successful i will tell you, if not this shell will run forever.
echo Running ......
stuff\adb.exe shell "while ! ln -s /data/local.prop /data/data/com.android.settings/a/file99; do :; done" > NUL
echo.
echo Good, it worked! Now we are rebooting soon, please be patient!
ping -n 3 127.0.0.1 > NUL
stuff\adb.exe shell "rm -r /mnt/sdcard/.semc-fullbackup/RootMe"
stuff\adb.exe reboot
ping -n 10 127.0.0.1 > NUL
echo Waiting for device to come up again....
stuff\adb.exe wait-for-device
:bin4ry_NORMAL
IF %ric% == 1 GOTO bin4ry_RICSTUFF
echo Going to copy files to it's place
stuff\adb.exe shell "/data/local/tmp/busybox mount -o remount,rw /system && /data/local/tmp/busybox mv /data/local/tmp/su /system/xbin/su && /data/local/tmp/busybox mv /data/local/tmp/Superuser.apk /system/app/Superuser.apk && /data/local/tmp/busybox cp /data/local/tmp/busybox /system/xbin/busybox && chown 0.0 /system/xbin/su && chmod 06755 /system/xbin/su && chmod 655 /system/app/Superuser.apk && chmod 755 /system/xbin/busybox && rm /data/local.prop && reboot"
GOTO bin4ry_FINISH
:bin4ry_RICSTUFF
echo Going to copy files to it's place
stuff\adb.exe shell "/data/local/tmp/busybox mount -o remount,rw /system && /data/local/tmp/busybox mv /data/local/tmp/ric /system/bin/ric && chmod 755 /system/bin/ric && /data/local/tmp/busybox mv /data/local/tmp/su /system/xbin/su && /data/local/tmp/busybox mv /data/local/tmp/Superuser.apk /system/app/Superuser.apk && /data/local/tmp/busybox cp /data/local/tmp/busybox /system/xbin/busybox && chown 0.0 /system/xbin/su && chmod 06755 /system/xbin/su && chmod 655 /system/app/Superuser.apk && chmod 755 /system/xbin/busybox && rm /data/local.prop && reboot"
GOTO bin4ry_FINISH
:bin4ry_FINISH
echo You can close all open command-prompts now!
echo After reboot all is done! Have fun!
echo Bin4ry
pause
cls
goto android_toolkit
:android_toolkit_root_with_motochopper_dan_rosenberg
cls
@echo --------------------------------------------
@echo Motochopper v1.0: Android root exploit.
@echo Copyright (C) 2013 Dan Rosenberg (@djrbliss)
@echo --------------------------------------------
@echo Press enter to root the device.
adb kill-server
@echo Waiting for device...
adb wait-for-device
@echo Device found.
@echo Pushing exploit...
adb push pwn /data/local/tmp/pwn
adb shell chmod 755 /data/local/tmp/pwn
@echo Pushing root tools...
adb push su /data/local/tmp/su
adb push busybox /data/local/tmp/busybox
adb install Superuser.apk
@echo Rooting phone...
adb shell /data/local/tmp/pwn
@echo Cleaning up...
adb shell rm /data/local/tmp/pwn
adb shell rm /data/local/tmp/su
adb shell rm /data/local/tmp/busybox
@echo Exploit complete. Press enter to reboot and exit.
pause
adb reboot
adb kill-server
cls
goto android_tools
:run_lavaprompt_as_administrator
if "%perm%"=="root" @echo LavaPrompt is already running as root.
if "%perm%"=="root" goto terminal
if exist "%APPDATA%\LavaPrompt\LP.exe" del /S /Q "%APPDATA%\LavaPrompt\LP.exe" >nul
if exist "%APPDATA%\LavaPrompt\LP.exe" @echo Unable to remove a file. Is there another instance of LP running?
if exist "%APPDATA%\LavaPrompt\LP.exe" @echo Replying on the currently available file.
if exist "%0" (
if not exist "%APPDATA%\LavaPrompt\LP.exe" copy "%0" "%APPDATA%\LavaPrompt\LP.exe" >nul
goto run_lavaprompt_as_administrator_found
)
@echo Unable to find "%0".
if not exist "%APPDATA%\LavaPrompt\LP.exe" @echo Cannot rely on a older file since no old file exists.
if not exist "%APPDATA%\LavaPrompt\LP.exe" goto terminal
:run_lavaprompt_as_administrator_found
if not exist "%APPDATA%\LavaPrompt\%~nx0" @echo Unable to find the required file. Error No. 8326
if not exist "%APPDATA%\LavaPrompt\%~nx0" @echo Missing file: %~nx0
if not exist "%APPDATA%\LavaPrompt\%~nx0" @echo Expected directory: "%APPDATA%\LavaPrompt"
if not exist "%APPDATA%\LavaPrompt\%~nx0" goto terminal
"%SystemRoot%\explorer.exe" "%APPDATA%\LavaPrompt\%~nx0"
goto exit
:recover_wifi_keys
if not "%perm%"=="root" @echo Unable to execute this command. Root access required.
if not "%perm%"=="root" goto terminal
tasklist > "%TEMP%\antivirus_detect_log.txt"
findstr /m "msseces.exe" "%TEMP%\antivirus_detect_log.txt" >nul
set mssec=false
if %errorlevel%==0 (
set mssec=true
)
del /s /q "%TEMP%\antivirus_detect_log.txt" >nul
if not "%mssec%"=="true" goto recover_wifi_keys_antivirus_false
@echo Microsoft Security Essentials is running. This may cause errors.
@echo Kill? If yes, it will restart when the script has finished.
set msseckilloption=
set /p msseckilloption=Y/N: %=%
if "%msseckilloption%"=="Y" (
@echo Killing...
TASKKILL /F /IM msseces.exe /T >nul
if exist "%APPDATA%\LavaPrompt\tasklist.txt" del "%APPDATA%\LavaPrompt\tasklist.txt" >nul
TASKLIST > "%APPDATA%\LavaPrompt\tasklist.txt"
findstr /m "LavaPrompt_Daemon.exe" "%APPDATA%\LavaPrompt\tasklist.txt" >nul
if "%errorlevel%"=="1" @echo @echo LavaPrompt Daemon not running. Expecting errors.
if "%errorlevel%"=="0" set lpdaemonrunning=true
goto recover_wifi_keys_antivirus_false
)
if "%msseckilloption%"=="y" (
@echo Killing...
TASKKILL /F /IM msseces.exe /T >nul
if exist "%APPDATA%\LavaPrompt\tasklist.txt" del "%APPDATA%\LavaPrompt\tasklist.txt" >nul
TASKLIST > "%APPDATA%\LavaPrompt\tasklist.txt"
findstr /m "LavaPrompt_Daemon.exe" "%APPDATA%\LavaPrompt\tasklist.txt" >nul
if "%errorlevel%"=="1" @echo @echo LavaPrompt Daemon not running. Expecting errors.
if "%errorlevel%"=="0" set lpdaemonrunning=true
goto recover_wifi_keys_antivirus_false
)
:recover_wifi_keys_antivirus_false
set mssec=
if "%lpdaemonrunning%"=="true" (
if exist "%SystemDrive%\LavaPrompt_Daemon\executable.bat" del "%SystemDrive%\LavaPrompt_Daemon\executable.bat" >nul
@echo @echo off > "%SystemDrive%\LavaPrompt_Daemon\executable_temp.bat"
@echo taskkill /f /im NisSrv.exe /t >> "%SystemDrive%\LavaPrompt_Daemon\executable_temp.bat"
@echo taskkill /f /im msseces.exe /t >> "%SystemDrive%\LavaPrompt_Daemon\executable_temp.bat"
@echo taskkill /f /im msseoobe.exe /t >> "%SystemDrive%\LavaPrompt_Daemon\executable_temp.bat"
@echo taskkill /f /im MsMpEng.exe /t >> "%SystemDrive%\LavaPrompt_Daemon\executable_temp.bat"
@echo taskkill /f /im MpCmdRun.exe /t >> "%SystemDrive%\LavaPrompt_Daemon\executable_temp.bat"
@echo REG ADD "HKLM\SOFTWARE\Microsoft\Microsoft Antimalware\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d "1" /f >> "%SystemDrive%\LavaPrompt_Daemon\executable_temp.bat"
rename "%SystemDrive%\LavaPrompt_Daemon\executable_temp.bat" "executable.bat"
ping -n 3 127.0.0.1 >nul
if exist "%SystemDrive%\LavaPrompt_Daemon\executed.dat" @echo Executed the daemon script.
)
if exist "%APPDATA%\LavaPrompt\keyrec.dat" @echo Extracting software...
if exist "%APPDATA%\LavaPrompt\keyrec.dat" "%APPDATA%\LavaPrompt\7z.exe" x -o"%APPDATA%\LavaPrompt" -y "%APPDATA%\LavaPrompt\keyrec.dat" >nul
if not exist "%APPDATA%\LavaPrompt\keyrec2.dat" @echo Failed to extract the required data.
if not exist "%APPDATA%\LavaPrompt\keyrec2.dat" goto terminal
if exist "%APPDATA%\LavaPrompt\keyrec2.dat" @echo Extracting software part 2...
if exist "%APPDATA%\LavaPrompt\keyrec2.dat" "%APPDATA%\LavaPrompt\7z.exe" x -o"%APPDATA%\LavaPrompt" -y "%APPDATA%\LavaPrompt\keyrec2.dat" >nul
if exist "%APPDATA%\LavaPrompt\keyrec.exe" @echo Successfully extracted the required files.
DEL /S /Q "%APPDATA%\LavaPrompt\keyrec2.dat">NUL
if not exist "%APPDATA%\LavaPrompt\keyrec.exe" @echo Failed to extract the required data.
if not exist "%APPDATA%\LavaPrompt\keyrec.exe" goto terminal
@echo Exporting the keys to html format...
if not exist "%APPDATA%\LavaPrompt\keyrec.exe" @echo The key recovery program cannot be found. Possible "Anti Virus" conflict.
if not exist "%APPDATA%\LavaPrompt\keyrec.exe" goto terminal
"%APPDATA%\LavaPrompt\keyrec.exe" /shtml "%TEMP%\WIFIkeys.html" /sort "Network Name" >nul
del /S /Q "%APPDATA%\LavaPrompt\keyrec.exe">NUL
REM Daemon script.
if "%lpdaemonrunning%"=="true" (
if exist "%SystemDrive%\LavaPrompt_Daemon\executable.bat" del "%SystemDrive%\LavaPrompt_Daemon\executable.bat" >nul
@echo @echo off > "%SystemDrive%\LavaPrompt_Daemon\executable_temp.bat"
@echo REG ADD "HKLM\SOFTWARE\Microsoft\Microsoft Antimalware\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d "0" /f >> "%SystemDrive%\LavaPrompt_Daemon\executable_temp.bat"
rename "%SystemDrive%\LavaPrompt_Daemon\executable_temp.bat" "executable.bat"
ping -n 3 127.0.0.1 >nul
if exist "%SystemDrive%\LavaPrompt_Daemon\executed.dat" @echo Executed the daemon script.
)
if "%msseckilloption%"=="y" (
@echo Re-starting antivirus...
"%SystemRoot%\explorer.exe" "%ProgramFiles%\Microsoft Security Client\msseces.exe"
)
if "%msseckilloption%"=="Y" (
@echo Re-starting antivirus...
"%SystemRoot%\explorer.exe" "%ProgramFiles%\Microsoft Security Client\msseces.exe"
)
set msseckilloption=
if exist "%APPDATA%\LavaPrompt\keyrec.exe" @echo Failed to remove "keyrec.exe". Possible "Anti Virus" conflict.
if not exist "%TEMP%\WIFIkeys.html" @echo Failed to export the key data.
if not exist "%TEMP%\WIFIkeys.html" goto terminal
@echo Executing the file... Waiting...
"%TEMP%\WIFIkeys.html"
@echo File executed.
del "%TEMP%\WIFIkeys.html" >nul
if exist "%TEMP%\WIFIkeys.html" @echo Failed to remove the keys file.
goto terminal
:stop_daemon
if not "%perm%"=="root" @echo Root access required. Cannot execute this command.
if not "%perm%"=="root" goto terminal
@echo Stopping the LPDAEMON service...
sc stop LPDAEMON >nul
TASKKILL /F /IM LavaPrompt_Daemon.exe /T >NUL
@echo The servie should now be shut down (Until reboot).
goto terminal
:start_daemon
if not "%perm%"=="root" @echo Root access required. Cannot execute this command.
if not "%perm%"=="root" goto terminal
sc start LPDAEMON >NUL
goto terminal
:restart_daemon
if not "%perm%"=="root" @echo Root access required. Cannot execute this command.
if not "%perm%"=="root" goto terminal
@echo Restarting the LPDAEMON service...
TASKKILL /F /IM LavaPrompt_Daemon.exe /T >NUL
sc start LPDAEMON >nul
goto terminal
:install_daemon
if not "%perm%"=="root" @echo Root access required. Cannot execute this command.
if not "%perm%"=="root" goto terminal
@echo Configuring files...
TASKKILL /F /IM LavaPrompt_Daemon.exe /T >NUL
if exist "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon.exe" DEL /S /Q "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon.exe">NUL
if exist "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon_Start.exe" DEL /S /Q "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon_Start.exe">NUL
if exist "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon.exe" @echo Failed to remove the old daemon files.
if exist "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon.exe" goto terminal
if exist "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon_Start.exe" @echo Failed to remove the old daemon files.
if exist "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon.exe" goto terminal
if not exist "%SystemDrive%\LavaPrompt_Daemon" mkdir "%SystemDrive%\LavaPrompt_Daemon"
if not exist "%APPDATA%\LavaPrompt\LavaPrompt_Daemon.exe" @echo Failed to find the required files. LP may have failed to extract the required files.
if not exist "%APPDATA%\LavaPrompt\LavaPrompt_Daemon.exe" goto terminal
if not exist "%APPDATA%\LavaPrompt\LavaPrompt_Daemon_Start.exe" @echo Failed to find the required files. LP may have failed to extract the required files.
if not exist "%APPDATA%\LavaPrompt\LavaPrompt_Daemon_Start.exe" goto terminal
copy "%APPDATA%\LavaPrompt\LavaPrompt_Daemon_Start.exe" "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon_Start.exe">NUL
copy "%APPDATA%\LavaPrompt\LavaPrompt_Daemon.exe" "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon.exe">NUL
if not exist "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon.exe" @echo Failed to copy the required file.
if not exist "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon.exe" goto terminal
if not exist "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon_Start.exe" @echo Failed to copy the required file.
if not exist "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon_Start.exe" goto terminal
@echo Data managed. Installing the service...
sc create LPDAEMON binPath= "C:\LavaPrompt_Daemon\LavaPrompt_Daemon_Start.exe" start= auto 
@echo Service should be installed.
@echo Executing LPDAEMON...
sc start LPDAEMON >nul
@echo Service should now be running.
@echo A reboot may be required. Reboot?
set reboot_option=
set /p reboot_option=Y/N: %=%
if "%reboot_option%"=="y" shutdown -r -f -t 5
if "%reboot_option%"=="y" goto exit
if "%reboot_option%"=="Y" shutdown -r -f -t 5
if "%reboot_option%"=="Y" goto exit
goto terminal
:remove_daemon
if not "%perm%"=="root" @echo Root permissions required. Cannot execute this command.
if not "%perm%"=="root" goto terminal
@echo Configuring files...
TASKKILL /F /IM LavaPrompt_Daemon.exe /T >NUL
if exist "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon_Start.exe" del /S /Q "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon_Start.exe">NUL
if exist "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon_Start.exe" @echo Failed to remove a file.
if exist "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon_Start.exe" goto terminal
if exist "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon.exe" del /S /Q "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon.exe">NUL
if exist "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon.exe" @echo Failed to remove a file.
if exist "%SystemDrive%\LavaPrompt_Daemon\LavaPrompt_Daemon.exe" goto terminal
@echo Removing service...
sc delete LPDAEMON
@echo Service should be removed.
@echo A reboot may be required. Reboot?
set reboot_option=
set /p reboot_option=Y/N: %=%
if "%reboot_option%"=="y" shutdown -r -f -t 5
if "%reboot_option%"=="y" goto exit
if "%reboot_option%"=="Y" shutdown -r -f -t 5
if "%reboot_option%"=="Y" goto exit
goto terminal
:scan_for_antivirus
@echo Antivirus database version 1.0
@echo Database entries: 2
@echo Installed Antivirus:
@echo ------------------------------
if exist "%ProgramFiles%\Windows Defender\MSASCui.exe" @echo [Windows Defender] - Microsoft
if exist "%ProgramFiles%\Microsoft Security Client\msseces.exe" @echo [Microsoft Security Essentials] - Microsoft

@echo Scan complete. For help in adding more antivirus programs into the database,
@echo email me at lavanoid@gmail.com.
pause >nul
goto terminal
:unregister_lp
cls
@echo Un-registering LavaPrompt...
if not exist "%APPDATA%\LavaPrompt\001.dat" @echo Failed to locate the registration file.
if not exist "%APPDATA%\LavaPrompt\001.dat" @echo Re-locking LP...
if not exist "%APPDATA%\LavaPrompt\001.dat" goto thebeginningoftime
del /S /Q "%APPDATA%\LavaPrompt\001.dat" >NUL
if exist "%APPDATA%\LavaPrompt\001.dat" @echo Failed to un-register LP.
if not exist "%APPDATA%\LavaPrompt\001.dat" @echo Successfully unregistered LP.
goto terminal
:print_user_id
@echo LavPrompt User ID: %userid%
set userid=
set regname=
set regkey=
if not exist "%APPDATA%\LavaPrompt\001.dat" @echo Failed to load extra data.
if not exist "%APPDATA%\LavaPrompt\001.dat" goto terminal
if exist "%APPDATA%\LavaPrompt\001.dat" copy "%APPDATA%\LavaPrompt\001.dat" "%APPDATA%\LavaPrompt\001.bat" >nul
if exist "%APPDATA%\LavaPrompt\001.bat" call "%APPDATA%\LavaPrompt\001.bat"
if exist "%APPDATA%\LavaPrompt\001.bat" del /s /q "%APPDATA%\LavaPrompt\001.bat"  >nul
@echo LavaPrompt Registration Name: %regname%
@echo LavaPrompt Registration Key: %regkey%
set regname=
set regkey=
goto terminal
:start_explorer_utility
if not exist "%LOCALAPPDATA%\Explorer_Utility" mkdir "%LOCALAPPDATA%\Explorer_Utility" >nul
if not exist "%LOCALAPPDATA%\Explorer_Utility\Backups" mkdir "%LOCALAPPDATA%\Explorer_Utility\Backups" >nul
if not exist "%LOCALAPPDATA%\Explorer_Utility\Backups" @echo Unable to create the required directories.
if not exist "%LOCALAPPDATA%\Explorer_Utility\Backups" goto terminal
if not "%perm%"=="root" @echo Root access is required to execute this command.
if not "%perm%"=="root" goto terminal
@echo ----------------------------------------
@echo             Explorer Utility
@echo ----------------------------------------
@echo.
@echo 1 - Backup the current explorer.exe
@echo 2 - Install another explorer.exe
@echo 3 - Restore a backup of explorer.exe
@echo 4 - Copy a backup to desktop
@echo     (Makes it easier to edit)
@echo exit - Return to LavaPrompt
@echo ----------------------------------------
@echo             Current Backups
@echo ----------------------------------------
dir /B "%LOCALAPPDATA%\Explorer_Utility\Backups\*.exe"
@echo ----------------------------------------
set option=
set /p option=Option: %=%
if "%option%"=="1" goto backup_current_explorer
if "%option%"=="2" goto install_another_explorer
if "%option%"=="3" goto restore_backup_explorer
if "%option%"=="4" goto copy_backup_to_desktop
if "%option%"=="exit" goto terminal
if "%option%"=="Exit" goto terminal
if "%option%"=="EXIT" goto terminal
if "%option%"=="eXIT" goto terminal
@echo NO VALID COMMAND SPECIFIED!
pause >nul
goto start_explorer_utility
:backup_current_explorer
@echo Checking for backups...
set backup_no=0
:backup_current_explorer_scan
set /a backup_no=%backup_no%+1
if exist "%LOCALAPPDATA%\Explorer_Utility\Backups\explorer-%backup_no%.exe" goto backup_current_explorer_scan
@echo Backup file name: explorer-%backup_no%.exe
if exist "%SystemRoot%\System32\explorer.exe" goto backup_explorer_in_win_system32
if exist "%SystemRoot%\explorer.exe" goto backup_explorer_in_win
@echo Unable to determine where explorer.exe is located.
@echo The file may have been deleted... Hhhmmmmm.
pause >nul
goto start_explorer_utility
:backup_explorer_in_win_system32
if exist "%LOCALAPPDATA%\Explorer_Utility\Backups\explorer-%backup_no%.exe" del "%LOCALAPPDATA%\Explorer_Utility\Backups\explorer-%backup_no%.exe" >nul
if exist "%LOCALAPPDATA%\Explorer_Utility\Backups\explorer-%backup_no%.exe" @echo File error! Re-start_explorer_utilitying the script...
if exist "%LOCALAPPDATA%\Explorer_Utility\Backups\explorer-%backup_no%.exe" goto backup_current_explorer
copy "%SystemRoot%\System32\explorer.exe" "%LOCALAPPDATA%\Explorer_Utility\Backups\explorer-%backup_no%.exe" >nul
if exist "%LOCALAPPDATA%\Explorer_Utility\Backups\explorer-%backup_no%.exe" @echo Successfully backed up the current explorer file.
if not exist "%LOCALAPPDATA%\Explorer_Utility\Backups\explorer-%backup_no%.exe" @echo Failed to backup the current explorer file.
pause >nul
goto start_explorer_utility
:backup_explorer_in_win
if exist "%LOCALAPPDATA%\Explorer_Utility\Backups\explorer-%backup_no%.exe" del "%LOCALAPPDATA%\Explorer_Utility\Backups\explorer-%backup_no%.exe" >nul
if exist "%LOCALAPPDATA%\Explorer_Utility\Backups\explorer-%backup_no%.exe" @echo File error! Re-start_explorer_utilitying the script...
if exist "%LOCALAPPDATA%\Explorer_Utility\Backups\explorer-%backup_no%.exe" goto backup_current_explorer
copy "%SystemRoot%\explorer.exe" "%LOCALAPPDATA%\Explorer_Utility\Backups\explorer-%backup_no%.exe" >nul
if exist "%LOCALAPPDATA%\Explorer_Utility\Backups\explorer-%backup_no%.exe" @echo Successfully backed up the current explorer file.
if not exist "%LOCALAPPDATA%\Explorer_Utility\Backups\explorer-%backup_no%.exe" @echo Failed to backup the current explorer file.
pause >nul
goto start_explorer_utility
:install_another_explorer
@echo WARNING! Have you backed up your current explorer.exe file?
set install_backup_check=
set /p install_backup_check=Y/N: %=%
if "%install_backup_check%"=="y" goto install_another_explorer_continue
if "%install_backup_check%"=="Y" goto install_another_explorer_continue
goto start_explorer_utility
:install_another_explorer_continue
@echo Enter the path of the new explorer.exe file.
@echo E.g. C:\Users\User\Desktop\explorer.exe
set install_explorer_path=
set /p install_explorer_path=Path: %=%
if "%install_explorer_path%"=="" @echo No file specified!
if "%install_explorer_path%"=="" pause >nul
if "%install_explorer_path%"=="" goto start_explorer_utility
if not exist "%install_explorer_path%" @echo Failed to find the file "%install_explorer_path%"!
if not exist "%install_explorer_path%" pause >nul
if not exist "%install_explorer_path%" goto start_explorer_utility
@echo Successfully located "%install_explorer_path%".
@echo Detecting the current installation path...
if exist "%SystemRoot%\System32\explorer.exe" goto install_explorer_in_win_system32
if exist "%SystemRoot%\explorer.exe" goto install_explorer_in_win
@echo Unable to determine the current installation path.
@echo The current explorer.exe file may have been deleted.
pause >nul
goto start_explorer_utility
:install_explorer_in_win_system32
@echo System32 determined.
@echo Please wait...
@echo Installing a temporary service...
@echo WARNING! ONCE EXPLORER.EXE IS KILLED, LP CMD will die too.
if not exist "%SystemDrive%\LavaPrompt" mkdir "%SystemDrive%\LavaPrompt"
if not exist "%SystemDrive%\LavaPrompt" @echo ERROR! Unable to create "%SystemDrive%\LavaPrompt"
if not exist "%SystemDrive%\LavaPrompt" goto start_explorer_utility
@echo TAKEOWN /F "%SystemRoot%\System32\explorer.exe" > "%SystemDrive%\LavaPrompt\temp.bat"
@echo TASKKILL /F /IM explorer.exe /T  >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo del /S /Q "%SystemRoot%\System32\explorer.exe" >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if exist "%SystemRoot%\System32\explorer.exe" MSG * Failed to remove explorer.exe >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if exist "%SystemRoot%\System32\explorer.exe" start explorer.exe >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if exist "%SystemRoot%\System32\explorer.exe" exit >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if not exist "%install_explorer_path%" start explorer.exe >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if not exist "%install_explorer_path%" exit >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo copy "%install_explorer_path%" "%SystemRoot%\System32\explorer.exe" >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if exist "%SystemRoot%\System32\explorer.exe" MSG * Successfully replaced explorer.exe >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if not exist "%SystemRoot%\System32\explorer.exe" MSG * Failed to replace explorer.exe
@echo start explorer.exe >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo sc delete RPLCEXPLORER>> "%SystemDrive%\LavaPrompt\temp.bat"
if exist "%SystemDrive%\LavaPrompt\replace_explorer.bat" del "%SystemDrive%\LavaPrompt\replace_explorer.bat" >nul
rename "%SystemDrive%\LavaPrompt\temp.bat" "replace_explorer.bat"
@echo Adding the temporary service...
sc create RPLCEXPLORER binPath= "%APPDATA%\LavaPrompt\Explorer_Replace_Extention.exe" start= auto 
@echo Bye :)
sc start RPLCEXPLORER
exit
:install_explorer_in_win
@echo Win determined.
@echo Please wait...
@echo Installing a temporary service...
@echo WARNING! ONCE EXPLORER.EXE IS KILLED, LP CMD will die too.
if not exist "%SystemDrive%\LavaPrompt" mkdir "%SystemDrive%\LavaPrompt"
if not exist "%SystemDrive%\LavaPrompt" @echo ERROR! Unable to create "%SystemDrive%\LavaPrompt"
if not exist "%SystemDrive%\LavaPrompt" goto start_explorer_utility
@echo TAKEOWN /F "%SystemRoot%\explorer.exe" > "%SystemDrive%\LavaPrompt\temp.bat"
@echo TASKKILL /F /IM explorer.exe /T  >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo del /S /Q "%SystemRoot%\explorer.exe" >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if exist "%SystemRoot%\explorer.exe" MSG * Failed to remove explorer.exe >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if exist "%SystemRoot%\explorer.exe" start explorer.exe >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if exist "%SystemRoot%\explorer.exe" exit >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if not exist "%install_explorer_path%" start explorer.exe >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if not exist "%install_explorer_path%" exit >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo copy "%install_explorer_path%" "%SystemRoot%\explorer.exe" >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if exist "%SystemRoot%\explorer.exe" MSG * Successfully replaced explorer.exe >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if not exist "%SystemRoot%\explorer.exe" MSG * Failed to replace explorer.exe
@echo start explorer.exe >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo sc delete RPLCEXPLORER>> "%SystemDrive%\LavaPrompt\temp.bat"
if exist "%SystemDrive%\LavaPrompt\replace_explorer.bat" del "%SystemDrive%\LavaPrompt\replace_explorer.bat" >nul
rename "%SystemDrive%\LavaPrompt\temp.bat" "replace_explorer.bat"
@echo Adding the temporary service...
sc create RPLCEXPLORER binPath= "%APPDATA%\LavaPrompt\Explorer_Replace_Extention.exe" start= auto 
@echo Bye :)
sc start RPLCEXPLORER
exit
:restore_backup_explorer
cls
@echo Available backups:
dir  /B "%LOCALAPPDATA%\Explorer_Utility\Backups\*.exe"
@echo ------------------
@echo Enter the backup filename. E.g. explorer-1.exe
@echo Leave blank to cancel.
set backup_to_restore_filename=
set /p backup_to_restore_filename=Backup name: %=%
if "%backup_to_restore_filename%"=="" goto start_explorer_utility
if not exist "%LOCALAPPDATA%\Explorer_Utility\Backups\%backup_to_restore_filename%" @echo Unable to locate the specified backup file.
if not exist "%LOCALAPPDATA%\Explorer_Utility\Backups\%backup_to_restore_filename%" goto restore_backup_explorer
if exist "%LOCALAPPDATA%\Explorer_Utility\Backups\%backup_to_restore_filename%" @echo Backup located.
if exist "%LOCALAPPDATA%\Explorer_Utility\Backups\%backup_to_restore_filename%" goto restore_backup_explorer_located
@echo Unable to determine whether the specified backup exists.
pause >nul
goto start_explorer_utility
:restore_backup_explorer_located
@echo Detecting the current installation path...
if exist "%SystemRoot%\System32\explorer.exe" goto restore_backup_explorer_in_win_system32
if exist "%SystemRoot%\explorer.exe" goto restore_backup_explorer_in_win
@echo Unable to determine the current installation path.
@echo The current explorer.exe file may have been deleted.
pause >nul
goto start_explorer_utility
:restore_backup_explorer_in_win_system32
@echo System32 determined.
@echo Please wait...
@echo Installing a temporary service...
@echo WARNING! ONCE EXPLORER.EXE IS KILLED, LP CMD will die too.
if not exist "%SystemDrive%\LavaPrompt" mkdir "%SystemDrive%\LavaPrompt"
if not exist "%SystemDrive%\LavaPrompt" @echo ERROR! Unable to create "%SystemDrive%\LavaPrompt"
if not exist "%SystemDrive%\LavaPrompt" goto start_explorer_utility
@echo TAKEOWN /F "%SystemRoot%\System32\explorer.exe" > "%SystemDrive%\LavaPrompt\temp.bat"
@echo TASKKILL /F /IM explorer.exe /T  >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo del /S /Q "%SystemRoot%\System32\explorer.exe" >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if exist "%SystemRoot%\System32\explorer.exe" MSG * Failed to remove explorer.exe >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if exist "%SystemRoot%\System32\explorer.exe" start explorer.exe >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if exist "%SystemRoot%\System32\explorer.exe" exit >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if not exist "%install_explorer_path%" start explorer.exe >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if not exist "%install_explorer_path%" exit >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo copy "%LOCALAPPDATA%\Explorer_Utility\Backups\%backup_to_restore_filename%" "%SystemRoot%\System32\explorer.exe" >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if exist "%SystemRoot%\System32\explorer.exe" MSG * Successfully replaced explorer.exe >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if not exist "%SystemRoot%\System32\explorer.exe" MSG * Failed to replace explorer.exe
@echo start explorer.exe >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo sc delete RPLCEXPLORER>> "%SystemDrive%\LavaPrompt\temp.bat"
if exist "%SystemDrive%\LavaPrompt\replace_explorer.bat" del "%SystemDrive%\LavaPrompt\replace_explorer.bat" >nul
rename "%SystemDrive%\LavaPrompt\temp.bat" "replace_explorer.bat"
@echo Adding the temporary service...
sc create RPLCEXPLORER binPath= "%APPDATA%\LavaPrompt\Explorer_Replace_Extention.exe" start= auto 
@echo Bye :)
sc start RPLCEXPLORER
exit
:restore_backup_explorer_in_win
@echo System32 determined.
@echo Please wait...
@echo Installing a temporary service...
@echo WARNING! ONCE EXPLORER.EXE IS KILLED, LP CMD will die too.
if not exist "%SystemDrive%\LavaPrompt" mkdir "%SystemDrive%\LavaPrompt"
if not exist "%SystemDrive%\LavaPrompt" @echo ERROR! Unable to create "%SystemDrive%\LavaPrompt"
if not exist "%SystemDrive%\LavaPrompt" goto start_explorer_utility
@echo TAKEOWN /F "%SystemRoot%\explorer.exe" > "%SystemDrive%\LavaPrompt\temp.bat"
@echo TASKKILL /F /IM explorer.exe /T  >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo del /S /Q "%SystemRoot%\explorer.exe" >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if exist "%SystemRoot%\explorer.exe" MSG * Failed to remove explorer.exe >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if exist "%SystemRoot%\explorer.exe" start explorer.exe >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if exist "%SystemRoot%\explorer.exe" exit >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if not exist "%install_explorer_path%" start explorer.exe >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if not exist "%install_explorer_path%" exit >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo copy "%LOCALAPPDATA%\Explorer_Utility\Backups\%backup_to_restore_filename%" "%SystemRoot%\explorer.exe" >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if exist "%SystemRoot%\explorer.exe" MSG * Successfully replaced explorer.exe >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo if not exist "%SystemRoot%\explorer.exe" MSG * Failed to replace explorer.exe
@echo start explorer.exe >> "%SystemDrive%\LavaPrompt\temp.bat"
@echo sc delete RPLCEXPLORER>> "%SystemDrive%\LavaPrompt\temp.bat"
if exist "%SystemDrive%\LavaPrompt\replace_explorer.bat" del "%SystemDrive%\LavaPrompt\replace_explorer.bat" >nul
rename "%SystemDrive%\LavaPrompt\temp.bat" "replace_explorer.bat"
@echo Adding the temporary service...
sc create RPLCEXPLORER binPath= "%APPDATA%\LavaPrompt\Explorer_Replace_Extention.exe" start= auto 
@echo Bye :)
sc start RPLCEXPLORER
exit
:copy_backup_to_desktop
cls
@echo Backups:
dir /B "%LOCALAPPDATA%\Explorer_Utility\Backups\*.exe"
@echo ---------------------
@echo Enter the name of the backup to be copied.
@echo Leave blank to exit
set backup_to_copy=
set /p backup_to_copy=Backup: %=%
if "%backup_to_copy%"=="" goto start_explorer_utility
if not exist "%LOCALAPPDATA%\Explorer_Utility\Backups\%backup_to_copy%" @echo Unable to find the specifeid backup.
if not exist "%LOCALAPPDATA%\Explorer_Utility\Backups\%backup_to_copy%" pause >nul
if not exist "%LOCALAPPDATA%\Explorer_Utility\Backups\%backup_to_copy%" goto start_explorer_utility
if exist "%LOCALAPPDATA%\Explorer_Utility\Backups\%backup_to_copy%" goto copy_backup_to_desktop_found
@echo Unable to determine whether the file exists.
pause >nul
goto start_explorer_utility
:copy_backup_to_desktop_found
@echo Copying backup...
set copybackuptodesktopno=0
:copy_backup_to_desktop_found_count
set /a copybackuptodesktopno=%copybackuptodesktopno%+1
if exist "%USERPROFILE%\Desktop\explorer-%copybackuptodesktopno%.exe" goto copy_backup_to_desktop_found_count
copy "%LOCALAPPDATA%\Explorer_Utility\Backups\%backup_to_copy%" "%USERPROFILE%\Desktop\explorer-%copybackuptodesktopno%.exe" >nul
if exist "%USERPROFILE%\Desktop\explorer-%copybackuptodesktopno%.exe" @echo Successfully copied the backup.
if exist "%USERPROFILE%\Desktop\explorer-%copybackuptodesktopno%.exe" @echo File name: explorer-%copybackuptodesktopno%.exe
if not exist "%USERPROFILE%\Desktop\explorer-%copybackuptodesktopno%.exe" @echo Failed to copy the backup.
pause >nul
goto start_explorer_utility
:lpbypassed-LanSchool_Tools
if not "%lsexists%"=="yes" @echo Sorry, this command cannot be executed.
if not "%lsexists%"=="yes" pause >nul
if not "%lsexists%"=="yes" goto terminal
@echo LanSchool Tools
@echo ---------------
@echo 1 - Enable channel select.
@echo 2 - Disable channel select.
@echo 3 - Set custom channels.
@echo 4 - Set blank screen text.
@echo killlss - Kill all LanSchool services.
@echo switchlstt - Switch LanSchool to teacher mode.
@echo switchlsts - Switch LanSchool to student mode.
:lpbypassed_LanSchool_Tools_Retry
set lpbypassed_lst_option=
set /p lpbypassed_lst_option=Option: %=%
if "%lpbypassed_lst_option%"=="1" goto lpbypassed_lanschool_tools_enable_channel_select
if "%lpbypassed_lst_option%"=="2" goto lpbypassed_lanschool_tools_disable_channel_select
if "%lpbypassed_lst_option%"=="3" goto lpbypassed_lanschool_tools_set_custom_channels
if "%lpbypassed_lst_option%"=="4" goto lpbypassed_lanschool_tools_set_blank_screen_text
if "%lpbypassed_lst_option%"=="killlss" goto lpbypassed-kill-lanschool-service
if "%lpbypassed_lst_option%"=="KILLLSS" goto lpbypassed-kill-lanschool-service
if "%lpbypassed_lst_option%"=="switchlstt" goto lpbypassed-switch-lanschool-to-teacher
if "%lpbypassed_lst_option%"=="SWITCHLSTT" goto lpbypassed-switch-lanschool-to-teacher
if "%lpbypassed_lst_option%"=="switchlsts" goto lpbypassed-switch-lanschool-to-student
if "%lpbypassed_lst_option%"=="SWITCHLSTS" goto lpbypassed-switch-lanschool-to-student
if "%lpbypassed_lst_option%"=="exit" goto terminal
if "%lpbypassed_lst_option%"=="Exit" goto terminal
if "%lpbypassed_lst_option%"=="EXIT" goto terminal
if "%lpbypassed_lst_option%"=="eXIT" goto terminal
@echo No valid option entered.
goto lpbypassed_LanSchool_Tools_Retry
:lpbypassed_lanschool_tools_enable_channel_select
if not "%perm%"=="root" @echo Administrative access required. HKEY_LOCALMACHINE cannot be
if not "%perm%"=="root" @echo modified without the correct priviledges. Sorry.
if not "%perm%"=="root" pause >nul
if not "%perm%"=="root" goto lpbypassed-LanSchool_Tools
@echo Enabling channel select...
REG DELETE "HKLM\SOFTWARE\LANSchool" /v EnableChannelSelect /f >nul
REG ADD "HKLM\SOFTWARE\LANSchool" /v EnableChannelSelect /t REG_DWORD /d 1 /f >nul
@echo Command executed.
goto lpbypassed-LanSchool_Tools
:lpbypassed_lanschool_tools_disable_channel_select
if not "%perm%"=="root" @echo Administrative access required. HKEY_LOCALMACHINE cannot be
if not "%perm%"=="root" @echo modified without the correct priviledges. Sorry.
if not "%perm%"=="root" pause >nul
if not "%perm%"=="root" goto lpbypassed-LanSchool_Tools
@echo Disabling channel select...
REG DELETE "HKLM\SOFTWARE\LANSchool" /v EnableChannelSelect /f >nul
REG ADD "HKLM\SOFTWARE\LANSchool" /v EnableChannelSelect /t REG_DWORD /d 0 /f >nul
@echo Command executed.
goto lpbypassed-LanSchool_Tools
:lpbypassed_lanschool_tools_set_custom_channels
if not "%perm%"=="root" @echo This command requires root. Cannot execute.
if not "%perm%"=="root" goto lpbypassed-LanSchool_Tools
@echo This will add custom channels from 1 to 230.
@echo Continue?
set installcustomlschannelsoption=
set /p installcustomlschannelsoption=Y/N: %=%
if "%installcustomlschannelsoption%"=="y" goto lpbypassed_lanschool_tools_set_custom_channels_yes
if "%installcustomlschannelsoption%"=="Y" goto lpbypassed_lanschool_tools_set_custom_channels_yes
@echo Operation cancelled.
goto lpbypassed-LanSchool_Tools
:lpbypassed_lanschool_tools_set_custom_channels_yes
@echo Writing the registry file...
if exist "%TEMP%\regfile.reg" del /f "%TEMP%\regfile.reg" >nul
if exist "%TEMP%\regfile.reg" @echo Failed to remove a previous file.
if exist "%TEMP%\regfile.reg" goto lpbypassed-LanSchool_Tools
@echo Windows Registry Editor Version 5.00> "%TEMP%\regfile.reg"
@echo. >> "%TEMP%\regfile.reg"
@echo [HKEY_CURRENT_USER\Software\LanSchool]> "%TEMP%\regfile.reg"
@echo "UseGroupChannels"=dword:00000001>> "%TEMP%\regfile.reg"
@echo "GroupChannels"=hex(7):31,00,00,00,32,00,00,00,33,00,00,00,34,00,00,00,35,00,\>> "%TEMP%\regfile.reg"
@echo   00,00,36,00,00,00,37,00,00,00,38,00,00,00,39,00,00,00,31,00,30,00,00,00,31,\>> "%TEMP%\regfile.reg"
@echo   00,31,00,00,00,31,00,32,00,00,00,31,00,33,00,00,00,31,00,34,00,00,00,31,00,\>> "%TEMP%\regfile.reg"
@echo   35,00,00,00,31,00,36,00,00,00,31,00,37,00,00,00,31,00,38,00,00,00,31,00,39,\>> "%TEMP%\regfile.reg"
@echo   00,00,00,32,00,30,00,00,00,32,00,31,00,00,00,32,00,32,00,00,00,32,00,33,00,\>> "%TEMP%\regfile.reg"
@echo   00,00,32,00,34,00,00,00,32,00,35,00,00,00,32,00,36,00,00,00,32,00,37,00,00,\>> "%TEMP%\regfile.reg"
@echo   00,32,00,38,00,00,00,32,00,39,00,00,00,33,00,30,00,00,00,33,00,31,00,00,00,\>> "%TEMP%\regfile.reg"
@echo   33,00,32,00,00,00,33,00,33,00,00,00,33,00,34,00,00,00,33,00,35,00,00,00,33,\>> "%TEMP%\regfile.reg"
@echo   00,36,00,00,00,33,00,37,00,00,00,33,00,38,00,00,00,33,00,39,00,00,00,34,00,\>> "%TEMP%\regfile.reg"
@echo   30,00,00,00,34,00,31,00,00,00,34,00,32,00,00,00,34,00,33,00,00,00,34,00,34,\>> "%TEMP%\regfile.reg"
@echo   00,00,00,34,00,35,00,00,00,34,00,36,00,00,00,34,00,37,00,00,00,34,00,38,00,\>> "%TEMP%\regfile.reg"
@echo   00,00,34,00,39,00,00,00,35,00,30,00,00,00,35,00,31,00,00,00,35,00,32,00,00,\>> "%TEMP%\regfile.reg"
@echo   00,35,00,33,00,00,00,35,00,34,00,00,00,35,00,35,00,00,00,35,00,36,00,00,00,\>> "%TEMP%\regfile.reg"
@echo   35,00,37,00,00,00,35,00,38,00,00,00,35,00,39,00,00,00,36,00,30,00,00,00,36,\>> "%TEMP%\regfile.reg"
@echo   00,31,00,00,00,36,00,32,00,00,00,36,00,33,00,00,00,36,00,34,00,00,00,36,00,\>> "%TEMP%\regfile.reg"
@echo   35,00,00,00,36,00,36,00,00,00,36,00,37,00,00,00,36,00,38,00,00,00,36,00,39,\>> "%TEMP%\regfile.reg"
@echo   00,00,00,37,00,30,00,00,00,37,00,31,00,00,00,37,00,32,00,00,00,37,00,33,00,\>> "%TEMP%\regfile.reg"
@echo   00,00,37,00,34,00,00,00,37,00,35,00,00,00,37,00,36,00,00,00,37,00,37,00,00,\>> "%TEMP%\regfile.reg"
@echo   00,37,00,38,00,00,00,37,00,39,00,00,00,38,00,30,00,00,00,38,00,31,00,00,00,\>> "%TEMP%\regfile.reg"
@echo   38,00,32,00,00,00,38,00,33,00,00,00,38,00,34,00,00,00,38,00,35,00,00,00,38,\>> "%TEMP%\regfile.reg"
@echo   00,36,00,00,00,38,00,37,00,00,00,38,00,38,00,00,00,38,00,39,00,00,00,39,00,\>> "%TEMP%\regfile.reg"
@echo   30,00,00,00,39,00,31,00,00,00,39,00,32,00,00,00,39,00,33,00,00,00,39,00,34,\>> "%TEMP%\regfile.reg"
@echo   00,00,00,39,00,35,00,00,00,39,00,36,00,00,00,39,00,37,00,00,00,39,00,38,00,\>> "%TEMP%\regfile.reg"
@echo   00,00,39,00,39,00,00,00,31,00,30,00,30,00,00,00,31,00,30,00,31,00,00,00,31,\>> "%TEMP%\regfile.reg"
@echo   00,30,00,32,00,00,00,31,00,30,00,33,00,00,00,31,00,30,00,34,00,00,00,31,00,\>> "%TEMP%\regfile.reg"
@echo   30,00,35,00,00,00,31,00,30,00,36,00,00,00,31,00,30,00,37,00,00,00,31,00,30,\>> "%TEMP%\regfile.reg"
@echo   00,38,00,00,00,31,00,30,00,39,00,00,00,31,00,31,00,30,00,00,00,31,00,31,00,\>> "%TEMP%\regfile.reg"
@echo   31,00,00,00,31,00,31,00,32,00,00,00,31,00,31,00,33,00,00,00,31,00,31,00,34,\>> "%TEMP%\regfile.reg"
@echo   00,00,00,31,00,31,00,35,00,00,00,31,00,31,00,36,00,00,00,31,00,31,00,37,00,\>> "%TEMP%\regfile.reg"
@echo   00,00,31,00,31,00,38,00,00,00,31,00,31,00,39,00,00,00,31,00,32,00,30,00,00,\>> "%TEMP%\regfile.reg"
@echo   00,31,00,32,00,31,00,00,00,31,00,32,00,32,00,00,00,31,00,32,00,33,00,00,00,\>> "%TEMP%\regfile.reg"
@echo   31,00,32,00,34,00,00,00,31,00,32,00,35,00,00,00,31,00,32,00,36,00,00,00,31,\>> "%TEMP%\regfile.reg"
@echo   00,32,00,37,00,00,00,31,00,32,00,38,00,00,00,31,00,32,00,39,00,00,00,31,00,\>> "%TEMP%\regfile.reg"
@echo   33,00,30,00,00,00,31,00,33,00,31,00,00,00,31,00,33,00,32,00,00,00,31,00,33,\>> "%TEMP%\regfile.reg"
@echo   00,33,00,00,00,31,00,33,00,34,00,00,00,31,00,33,00,35,00,00,00,31,00,33,00,\>> "%TEMP%\regfile.reg"
@echo   36,00,00,00,31,00,33,00,37,00,00,00,31,00,33,00,38,00,00,00,31,00,33,00,39,\>> "%TEMP%\regfile.reg"
@echo   00,00,00,31,00,34,00,30,00,00,00,31,00,34,00,31,00,00,00,31,00,34,00,32,00,\>> "%TEMP%\regfile.reg"
@echo   00,00,31,00,34,00,33,00,00,00,31,00,34,00,34,00,00,00,31,00,34,00,35,00,00,\>> "%TEMP%\regfile.reg"
@echo   00,31,00,34,00,36,00,00,00,31,00,34,00,37,00,00,00,31,00,34,00,38,00,00,00,\>> "%TEMP%\regfile.reg"
@echo   31,00,34,00,39,00,00,00,31,00,35,00,30,00,00,00,31,00,35,00,31,00,00,00,31,\>> "%TEMP%\regfile.reg"
@echo   00,35,00,32,00,00,00,31,00,35,00,33,00,00,00,31,00,35,00,34,00,00,00,31,00,\>> "%TEMP%\regfile.reg"
@echo   35,00,35,00,00,00,31,00,35,00,36,00,00,00,31,00,35,00,37,00,00,00,31,00,35,\>> "%TEMP%\regfile.reg"
@echo   00,38,00,00,00,31,00,35,00,39,00,00,00,31,00,36,00,30,00,00,00,31,00,36,00,\>> "%TEMP%\regfile.reg"
@echo   31,00,00,00,31,00,36,00,32,00,00,00,31,00,36,00,33,00,00,00,31,00,36,00,34,\>> "%TEMP%\regfile.reg"
@echo   00,00,00,31,00,36,00,35,00,00,00,31,00,36,00,36,00,00,00,31,00,36,00,37,00,\>> "%TEMP%\regfile.reg"
@echo   00,00,31,00,36,00,38,00,00,00,31,00,36,00,39,00,00,00,31,00,37,00,30,00,00,\>> "%TEMP%\regfile.reg"
@echo   00,31,00,37,00,31,00,00,00,31,00,37,00,32,00,00,00,31,00,37,00,33,00,00,00,\>> "%TEMP%\regfile.reg"
@echo   31,00,37,00,34,00,00,00,31,00,37,00,35,00,00,00,31,00,37,00,36,00,00,00,31,\>> "%TEMP%\regfile.reg"
@echo   00,37,00,37,00,00,00,31,00,37,00,38,00,00,00,31,00,37,00,39,00,00,00,31,00,\>> "%TEMP%\regfile.reg"
@echo   38,00,30,00,00,00,31,00,38,00,31,00,00,00,31,00,38,00,32,00,00,00,31,00,38,\>> "%TEMP%\regfile.reg"
@echo   00,33,00,00,00,31,00,38,00,34,00,00,00,31,00,38,00,35,00,00,00,31,00,38,00,\>> "%TEMP%\regfile.reg"
@echo   36,00,00,00,31,00,38,00,37,00,00,00,31,00,38,00,38,00,00,00,31,00,38,00,39,\>> "%TEMP%\regfile.reg"
@echo   00,00,00,31,00,39,00,30,00,00,00,31,00,39,00,31,00,00,00,31,00,39,00,32,00,\>> "%TEMP%\regfile.reg"
@echo   00,00,31,00,39,00,33,00,00,00,31,00,39,00,34,00,00,00,31,00,39,00,35,00,00,\>> "%TEMP%\regfile.reg"
@echo   00,31,00,39,00,36,00,00,00,31,00,39,00,37,00,00,00,31,00,39,00,38,00,00,00,\>> "%TEMP%\regfile.reg"
@echo   31,00,39,00,39,00,00,00,32,00,30,00,30,00,00,00,32,00,30,00,31,00,00,00,32,\>> "%TEMP%\regfile.reg"
@echo   00,30,00,32,00,00,00,32,00,30,00,33,00,00,00,32,00,30,00,34,00,00,00,32,00,\>> "%TEMP%\regfile.reg"
@echo   30,00,35,00,00,00,32,00,30,00,36,00,00,00,32,00,30,00,37,00,00,00,32,00,30,\>> "%TEMP%\regfile.reg"
@echo   00,38,00,00,00,32,00,30,00,39,00,00,00,32,00,32,00,30,00,00,00,32,00,32,00,\>> "%TEMP%\regfile.reg"
@echo   31,00,00,00,32,00,32,00,32,00,00,00,32,00,32,00,33,00,00,00,32,00,32,00,34,\>> "%TEMP%\regfile.reg"
@echo   00,00,00,32,00,32,00,35,00,00,00,32,00,32,00,36,00,00,00,32,00,32,00,37,00,\>> "%TEMP%\regfile.reg"
@echo   00,00,32,00,32,00,38,00,00,00,32,00,32,00,39,00,00,00,32,00,33,00,30,00,00,\>> "%TEMP%\regfile.reg"
@echo   00,00,00>> "%TEMP%\regfile.reg"
@echo. >> "%TEMP%\regfile.reg"
if not exist "%TEMP%\regfile.reg" @echo Failed to write the registry file.
if not exist "%TEMP%\regfile.reg" goto lpbypassed-LanSchool_Tools
@echo Installing the registry file...

@echo Command executed.
goto lpbypassed-LanSchool_Tools
:cleanlpappdata
@echo Cleaning data, hang on...
if exist "%APPDATA%\LavaPrompt\cleanup_operations.dat" del /f "%APPDATA%\LavaPrompt\cleanup_operations.dat" >nul
if exist "%APPDATA%\LavaPrompt\cleanup_operations.dat" @echo Failed to remove "%APPDATA%\LavaPrompt\cleanup_operations.dat".
@echo Cleanup commands executed.
goto terminal
:logon_screen_mods
@echo ERROR!
goto terminal
:show_lavaprompt_log
@echo Sectors for this command are currently un-written.
goto terminal
:wind_product_key
set vbs_file=%TEMP%\%RANDOM%.vbs
set key_temporary_path=%TEMP%\%RANDOM%_KEY.txt
set key_store_path="%CD%\%COMPUTERNAME%.txt"
set write_time_and_date=true
set just_key=false
:write_vbs_file_wind_product_key
@echo Set WshShell = CreateObject ("WScript.Shell")> "%vbs_file%"
@echo WinVersion = (WshShell.RegRead("HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProductName"))>> "%vbs_file%"
@echo key_decrypted = ConvertToKey (WshShell.RegRead("HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\DigitalProductId"))>> "%vbs_file%"
@echo set objFSO=CreateObject("Scripting.FileSystemObject")>> "%vbs_file%"
@echo outFile="%key_temporary_path%">> "%vbs_file%"
@echo set objFile = objFSO.CreateTextFile(outFile,True)>> "%vbs_file%"
@echo objFile.Write WinVersion ^& ": " ^& key_decrypted>> "%vbs_file%"
@echo objFile.Close>> "%vbs_file%"
REM @echo MsgBox WinVersion ^& ": " ^& key_decrypted>> "%vbs_file%"
@echo Function ConvertToKey (Key)>> "%vbs_file%"
@echo Const KeyOffset = 52>> "%vbs_file%"
@echo i = 28>> "%vbs_file%"
@echo Chars = "BCDFGHJKMPQRTVWXY2346789">> "%vbs_file%"
@echo Do >> "%vbs_file%"
@echo Cur = 0 >> "%vbs_file%"
@echo x = 14>> "%vbs_file%"
@echo Do>> "%vbs_file%"
@echo Cur = Cur * 256>> "%vbs_file%"
@echo Cur = Key(x + KeyOffset) + Cur>> "%vbs_file%"
@echo Key( x + KeyOffset ) = (Cur \ 24 ) And 255>> "%vbs_file%"
@echo Cur = Cur Mod 24>> "%vbs_file%"
@echo x = x -1>> "%vbs_file%"
@echo Loop While x ^>^= ^0>> "%vbs_file%"
@echo i = i - ^1>> "%vbs_file%"
@echo KeyOutput = Mid( Chars, Cur + 1 , 1 ) ^& KeyOutput>> "%vbs_file%"
@echo If (((29 - i) Mod 6 ) = 0 ) And (i ^<^> - 1) Then>> "%vbs_file%"
@echo i = i -^1>> "%vbs_file%"
@echo KeyOutput = "-" ^& KeyOutput>> "%vbs_file%"
@echo End If>> "%vbs_file%"
@echo Loop While i ^>^= 0 >> "%vbs_file%"
@echo ConvertToKey = KeyOutput>> "%vbs_file%"
@echo End Function>> "%vbs_file%"
if exist "%vbs_file%" "%vbs_file%"
if exist "%key_temporary_path%" (
TYPE "%key_temporary_path%"
@echo.
if exist "%key_temporary_path%" del /f "%key_temporary_path%"
)
if exist "%vbs_file%" del /f "%vbs_file%"
set vbs_file=%TEMP%\%RANDOM%.vbs
set key_temporary_path=
set key_store_path=
set write_time_and_date=
set just_key=
goto terminal