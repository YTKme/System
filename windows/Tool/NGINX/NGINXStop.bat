@ECHO OFF
REM Stop NGINX
tasklist /FI "IMAGENAME eq nginx.exe" 2>NUL | find /I /N "nginx.exe">NUL
IF "%ERRORLEVEL%"=="0" (
    REM NGINX: Running
    REM NGINX: Quit...
    c:
    cd \nginx
    nginx.exe -s quit
    ECHO NGINX Quit Executed
) else (
    ECHO NGINX Not Running
)
