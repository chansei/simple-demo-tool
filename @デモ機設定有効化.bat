@echo off
set VER=1.0

echo #####################################
echo.
echo �f���@�ݒ�c�[�� ver%VER%
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

echo �d���v�����̐ݒ��ύX���Ă��܂�...
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

set /p URL="�f�������URL���w�肵�Ă�������:"

echo �f������̃_�E�����[�h���s���Ă��܂�...
echo.
yt-dlp.exe -f 137+140 %URL% -o movie.mp4 --force-overwrites

echo �f���@�c�[���ƃf��������R�s�[���Ă��܂�...
echo.
if not exist "C:\DEMO" mkdir "C:\DEMO"
copy /Y "movie.mp4" "C:\DEMO\"
copy /Y "demo.bat" "C:\DEMO\"
copy /Y "demo.vbs" "C:\DEMO\"
copy /Y "@�f���v���Z�X��~.bat" "C:\DEMO\"
copy /Y "demo.vbs.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\"
xcopy /E /Y /Q "VLC" "C:\DEMO\"
echo.

echo �f���@�ݒ肪�������܂���
echo.
echo #####################################
echo.
echo �f���@�ݒ����������ɂ͉����p�̃R�}���h�����s���Ă�������
echo.
echo #####################################
echo.

pause