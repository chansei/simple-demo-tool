@echo off
set VER=1.0

echo #####################################
echo.
echo デモ機設定ツール ver%VER%
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

echo 電源プランの設定を変更しています...
echo.

powercfg -s scheme_balanced
powercfg -setacvalueindex scheme_balanced sub_buttons pbuttonaction 3
powercfg -setdcvalueindex scheme_balanced sub_buttons pbuttonaction 3
powercfg -setacvalueindex scheme_balanced sub_buttons lidaction 0
powercfg -setdcvalueindex scheme_balanced sub_buttons lidaction 0
powercfg /x monitor-timeout-ac 0
powercfg /x monitor-timeout-dc 0
powercfg /x standby-timeout-ac 0
powercfg /x standby-timeout-dc 0

set /p URL="デモ動画のURLを指定してください:"

echo デモ動画のダウンロードを行っています...
echo.
yt-dlp.exe -f 137+140 %URL% -o movie.mp4 --force-overwrites

echo デモ機ツールとデモ動画をコピーしています...
echo.
if not exist "C:\DEMO" mkdir "C:\DEMO"
copy /Y "movie.mp4" "C:\DEMO\"
copy /Y "demo.bat" "C:\DEMO\"
copy /Y "demo.vbs" "C:\DEMO\"
copy /Y "@デモプロセス停止.bat" "C:\DEMO\"
copy /Y "demo.vbs.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\"
xcopy /E /Y /Q "VLC" "C:\DEMO\"
echo.

echo デモ機設定が完了しました
echo.
echo #####################################
echo.
echo デモ機設定を解除するには解除用のコマンドを実行してください
echo.
echo #####################################
echo.

pause