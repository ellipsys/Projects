if not "%CON_DT_LOG%"=="TRUE" goto DT_The_End_Of_Time
set DT_VAR_WRITE_LOG=
set DT_VAR_WRITE_LOG=%1
set DT_VAR_WRITE_LOG=%DT_VAR_WRITE_LOG:"=%
@echo [%DATE%-%TIME%] %DT_VAR_WRITE_LOG% >> "%CON_DT_LOGFILE%"
:DT_The_End_Of_Time
