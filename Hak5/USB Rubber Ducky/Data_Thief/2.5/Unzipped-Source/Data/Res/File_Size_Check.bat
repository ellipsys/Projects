@echo off
call :get_file_size "7-Zip\7z.dll"
call :get_file_size "7-Zip\7z.exe"
call :get_file_size "7-Zip\7z.sfx"
call :get_file_size "7-Zip\7zCon.sfx"
call :get_file_size "7-Zip\7-zip.dll"
call :get_file_size "ChromePass\ChromePass.exe"
call :get_file_size "ChromePass\ChromePass.zip"
call :get_file_size "mimikatz_x32\kappfree.dll"
call :get_file_size "mimikatz_x32\mimikatz.exe"
call :get_file_size "mimikatz_x32\mimikatz_x32.zip"
call :get_file_size "mimikatz_x64\mimikatz_x64.exe"
call :get_file_size "mimikatz_x64\mimikatz_x64.zip"
call :get_file_size "Procdump\procdump.exe"
call :get_file_size "Procdump\procdump.zip"
call :get_file_size "ProduKey\ProduKey.exe"
call :get_file_size "ProduKey\ProduKey.zip"
call :get_file_size "ProduKeyx64\ProduKeyx64.exe"
call :get_file_size "ProduKeyx64\ProduKeyx64.zip"
call :get_file_size "Wind\Wind.exe"
call :get_file_size "Wind\Wind.zip"
call :get_file_size "Sha1Sum\sha1sum.exe"
call :get_file_size "PowerSploit\PowerSploit-master-Encrypted.zip"
call :get_file_size "NetCat-Nmap\ncat.exe"
call :get_file_size "NetCat-Nmap\Startup_Scripts\Execute_ncstart.exe"
call :get_file_size "NetCat-Nmap\Startup_Scripts\ncstart.exe"
call :get_file_size "RemoveDrive\x32\RemoveDrive.exe"
call :get_file_size "RemoveDrive\x64\RemoveDrive.exe"
call :get_file_size "WebBrowserPassView\WebBrowserPassView.zip"
@echo Sha1 sums:
call :get_sha1_sum "7-Zip\7z.dll"
call :get_sha1_sum "7-Zip\7z.exe"
call :get_sha1_sum "7-Zip\7z.sfx"
call :get_sha1_sum "7-Zip\7zCon.sfx"
call :get_sha1_sum "7-Zip\7-zip.dll"
call :get_sha1_sum "ChromePass\ChromePass.exe"
call :get_sha1_sum "ChromePass\ChromePass.zip"
call :get_sha1_sum "mimikatz_x32\kappfree.dll"
call :get_sha1_sum "mimikatz_x32\mimikatz.exe"
call :get_sha1_sum "mimikatz_x32\mimikatz_x32.zip"
call :get_sha1_sum "mimikatz_x64\mimikatz_x64.exe"
call :get_sha1_sum "mimikatz_x64\mimikatz_x64.zip"
call :get_sha1_sum "Procdump\procdump.exe"
call :get_sha1_sum "Procdump\procdump.zip"
call :get_sha1_sum "ProduKey\ProduKey.exe"
call :get_sha1_sum "ProduKey\ProduKey.zip"
call :get_sha1_sum "ProduKeyx64\ProduKeyx64.exe"
call :get_sha1_sum "ProduKeyx64\ProduKeyx64.zip"
call :get_sha1_sum "Wind\Wind.exe"
call :get_sha1_sum "Wind\Wind.zip"
call :get_sha1_sum "Sha1Sum\sha1sum.exe"
call :get_sha1_sum "PowerSploit\PowerSploit-master-Encrypted.zip"
call :get_sha1_sum "NetCat-Nmap\ncat.exe"
call :get_sha1_sum "NetCat-Nmap\Startup_Scripts\Execute_ncstart.exe"
call :get_sha1_sum "NetCat-Nmap\Startup_Scripts\ncstart.exe"
call :get_sha1_sum "RemoveDrive\x32\RemoveDrive.exe"
call :get_sha1_sum "RemoveDrive\x64\RemoveDrive.exe"
call :get_sha1_sum "WebBrowserPassView\WebBrowserPassView.zip"
goto end
:get_file_size
if not exist %1 goto end
@echo %~z1 : %1 
goto end
:get_sha1_sum
if not exist %1 goto end
if exist "Sha1Sum\sha1sum.exe" "Sha1Sum\sha1sum.exe" %1
if not exist "Sha1Sum\sha1sum.exe" @echo Failed to locate "Sha1Sum\sha1sum.exe"!
goto end
:end
