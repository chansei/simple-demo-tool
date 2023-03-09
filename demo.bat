@echo off

set vlc=C:\DEMO\VLC\App\vlc\vlc.exe
set vlcoption=-f -L --mouse-hide-timeout=0 --no-video-title-show --high-priority --hotkeys-y-wheel-mode=-1 --hotkeys-x-wheel-mode=-1
set vlcfile="C:\DEMO\movie.mp4"

set count=0

:loop
    tasklist | find "vlc.exe" > NUL
    if %ERRORLEVEL% == 1 (
        start %vlc% %vlcfile% %vlcoption%
    )
    timeout /nobreak 300
    set /a count=count+1
    if %count% == 12 goto cleanup
    goto loop

:cleanup
    taskkill /F /T /IM vlc.exe
    set /a count=0
    goto loop

pause