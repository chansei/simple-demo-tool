@echo off

echo #####################################
echo.
echo �f���v���Z�X���~���܂�
echo.
echo #####################################
echo.

openfiles > nul
if errorlevel 1 (
    PowerShell.exe -Command Start-Process \"%~f0\" -Verb runas
    exit
)
cd %~dp0
pause
echo.

taskkill /F /T /IM cmd.exe