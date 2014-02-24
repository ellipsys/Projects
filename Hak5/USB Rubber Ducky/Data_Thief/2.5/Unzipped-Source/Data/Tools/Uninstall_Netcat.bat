@echo off
TASKKILL /F /IM ncat.exe
SC DELETE NCAT
RD /S /Q "%SystemRoot%\nc"
pause