set DT_VAR_ERROR_EXIT=FALSE
if not exist "%CON_DT_RES_DIRECTORY_ROOT%\Sha1Sum\sha1sum.exe" call "%CON_DT_API_DIRECTORY%\Write_Log_File.bat" "[FAIL] Failed to locate the sha1sum binary! Cannot verify filesystem." & goto DT_The_End_Of_Time
call :File_Check_Sha1_Sum "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.dll" "344faf61c3eb76f4a2fb6452e83ed16c9cce73e0"
call :File_Check_Sha1_Sum "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.exe" "20fea1314dbed552d5fedee096e2050369172ee1"
call :File_Check_Sha1_Sum "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7z.sfx" "00654a3562fded9c003a0116e269e8b8f2fa6b39"
call :File_Check_Sha1_Sum "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7zCon.sfx" "1b81ab29d0033864340f11ab913e6899d1279095"
call :File_Check_Sha1_Sum "%CON_DT_RES_DIRECTORY_ROOT%\7-Zip\7-zip.dll" "297e678c34311191c4602b6f4e920362e8a089a4"
call :File_Check_Sha1_Sum "%CON_DT_RES_DIRECTORY_ROOT%\ChromePass\ChromePass.zip" "aeb9a757dbb401d7e9eb9a2cbb6a99814e1bb34c"
call :File_Check_Sha1_Sum "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x32\mimikatz_x32.zip" "e1cfdcf78e99104f626af9b86435bed29f8e25de"
call :File_Check_Sha1_Sum "%CON_DT_RES_DIRECTORY_ROOT%\mimikatz_x64\mimikatz_x64.zip" "9a5391db5716a7d619958c3c885ace087294d810"
call :File_Check_Sha1_Sum "%CON_DT_RES_DIRECTORY_ROOT%\NetCat-Nmap\ncat.exe" "e52433b84341f1bec29dc818b48132c045311a1f"
call :File_Check_Sha1_Sum "%CON_DT_RES_DIRECTORY_ROOT%\PowerSploit\PowerSploit-master-Encrypted.zip" "e30cbe65f51688060c0d4b264861c4d0845025ba"
call :File_Check_Sha1_Sum "%CON_DT_RES_DIRECTORY_ROOT%\Procdump\procdump.zip" "03ec1c36ca074e82322631bc5947117c47ca73ea"
call :File_Check_Sha1_Sum "%CON_DT_RES_DIRECTORY_ROOT%\ProduKey\ProduKey.zip" "de5f895d99f3823d445e263618b43b92b3e319fb"
call :File_Check_Sha1_Sum "%CON_DT_RES_DIRECTORY_ROOT%\ProduKeyx64\ProduKeyx64.zip" "b113f2f31e2885a83a45536e2f9c5893e18e6452"
call :File_Check_Sha1_Sum "%CON_DT_RES_DIRECTORY_ROOT%\RemoveDrive\x32\RemoveDrive.exe" "b2e4a3b1d381fe4c8e633801d26fb5d59f6e534d"
call :File_Check_Sha1_Sum "%CON_DT_RES_DIRECTORY_ROOT%\RemoveDrive\x64\RemoveDrive.exe" "6db101919f2b5b0abcb7b244d4c317f5f3563164"
call :File_Check_Sha1_Sum "%CON_DT_RES_DIRECTORY_ROOT%\Wind\Wind.zip" "ef910c9b020ef3f36518819d65ec0d0bdd6becf7"
call :File_Check_Sha1_Sum "%CON_DT_RES_DIRECTORY_ROOT%\WebBrowserPassView\WebBrowserPassView.zip" "ba059dc390b19cd178c15678ac24f3d6bc5ac719"
if not "%DT_VAR_ERROR_EXIT%"=="TRUE" call "%CON_DT_API_DIRECTORY%\Write_Log_File.bat" "[PASS] Sha1 sums checked without errors."
:File_Check_Sha1_Sum
set DT_VAR_SUM_MATCH=
if "%1"=="" goto DT_The_End_Of_Time
if "%2"=="" goto DT_The_End_Of_Time
set DT_FILE_TO_CHECK=%1
set DT_FILE_TO_CHECK=%DT_FILE_TO_CHECK:"=%
set DT_FILE_TO_CHECK_EXPECT_SUM=%2
set DT_FILE_TO_CHECK_EXPECT_SUM=%DT_FILE_TO_CHECK_EXPECT_SUM:"=%
if exist "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" del /f "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
"%CON_DT_RES_DIRECTORY_ROOT%\Sha1Sum\sha1sum.exe" "%DT_FILE_TO_CHECK%" > "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt"
findstr /m "%DT_FILE_TO_CHECK_EXPECT_SUM%" "%CON_DT_RES_DIRECTORY_ROOT%\temp.txt" >nul
if "%errorlevel%"=="1" (
set DT_VAR_SUM_MATCH=FALSE
)
if "%errorlevel%"=="0" (
set DT_VAR_SUM_MATCH=TRUE
)
if "%DT_VAR_SUM_MATCH%"=="FALSE" call "%CON_DT_API_DIRECTORY%\Write_Log_File.bat" "[FAIL] Sha1 sum mismatch detected. File: %DT_FILE_TO_CHECK%"
if "%DT_VAR_SUM_MATCH%"=="FALSE" set DT_VAR_ERROR_EXIT=TRUE
:DT_The_End_Of_Time
