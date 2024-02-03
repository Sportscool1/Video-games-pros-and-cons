@echo off
title Simple Anti-Virus

REM Specify the directory to scan
set "directory=C:\Users\OneDrive\Desktop"

REM Create a quarantine directory if it doesn't exist
if not exist "C:\Quarantine" mkdir "C:\Quarantine"

echo Scanning %directory%...

REM Loop through each file in the specified directory
for /r "%directory%" %%F in (*) do (
    REM Perform a basic check for executable files
    if "%%~xF"==".exe" (
        echo Potential malware found: %%F
        choice /c YN /m "Do you want to delete this file? [Y/N]:"
        if errorlevel 2 (
            echo File skipped.
        ) else (
            echo Deleting file: %%F
            REM Move the file to a quarantine directory
            move "%%F" "C:\Quarantine"
        )
    )
)

echo Scan complete.
pause
