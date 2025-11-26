@echo off
echo Liste des ports ouverts (LISTEN) et programmes associés :
echo ==========================================================
echo.

for /f "tokens=5" %%a in ('netstat -ano ^| findstr LISTEN') do (
    for /f "tokens=1,2,*" %%b in ('tasklist /FI "PID eq %%a" ^| findstr /v "Image"') do (
        echo Port PID %%a - Programme : %%b
    )
)
echo.
echo ==========================================================
echo.
echo trusted : svchost.exe, lsass.exe, wininit.exe, spoolsv.exe, OneDrive.Sync.Service.exe, services.exe
echo.
pause
