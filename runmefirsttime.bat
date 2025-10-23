@echo off
setlocal

set SYNC_SCRIPT=updatemodsfolder.bat

where git >nul 2>nul
if %errorlevel% neq 0 (
    echo Git not found. Installing...
    set GIT_INSTALLER=GitInstaller.exe
    powershell -Command "Invoke-WebRequest -Uri 'https://github.com/git-for-windows/git/releases/latest/download/Git-2.46.0-64-bit.exe' -OutFile '%GIT_INSTALLER%'"
    echo Running Git installer silently...
    start /wait "" "%GIT_INSTALLER%" /VERYSILENT /NORESTART
    del "%GIT_INSTALLER%"
    echo Git installed successfully.
) else (
    echo Git is already installed.
)

if exist "%SYNC_SCRIPT%" (
    echo Running %SYNC_SCRIPT%...
    call "%SYNC_SCRIPT%"
) else (
    echo Sync script "%SYNC_SCRIPT%" not found.
)

pause
