@echo off
set generated=25
set total=444
set /a atotal=%total%/100
set /a agenerated=%generated%/%atotal%
@echo Input values:
@echo -------------------------
@echo Total                   : %total%
@echo Generated               : %generated%
@echo -------------------------
@echo Conversion              :
@echo -------------------------
@echo %total%/100             : %atotal%
@echo %generated%/%atotal%    : %agenerated%
@echo Fraction -^> Percentage : %agenerated%%%
pause