@echo off
if not exist "ncat.exe" @echo Failed to locate "ncat.exe"! & pause & exit
@echo Tip: Did you know ncat can connect to telnet servers too?
:start
%~d0
CD %~dp0
if not exist "ncat.exe" @echo Failed to locate "ncat.exe"! & pause & exit
:ipselection
set ipaddr=
set /p ipaddr=IP Address: %=%
if "%ipaddr%"=="" goto ipselection
:portselection
set port=
@echo Leave blank and port "31337" will be used.
set /p port=Port: %=%
if "%port%"=="" set port=31337
:connect
@echo Connecting to "%ipaddr%:%port%"...
ncat "%ipaddr%" "%port%"
@echo Connection closed.
goto start