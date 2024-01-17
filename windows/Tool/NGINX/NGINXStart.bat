@ECHO OFF
REM Start NGINX
tasklist /FI "IMAGENAME eq nginx.exe" 2>NUL | find /I /N "nginx.exe">NUL
IF NOT "%ERRORLEVEL%"=="0" (
    REM NGINX: Not Running
    REM NGINX: Start...
    c:
    cd \nginx
    start nginx.exe
    ECHO NGINX Start Executed
) else (
    ECHO NGINX Already Running
)
