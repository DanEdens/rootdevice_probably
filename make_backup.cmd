@echo off

echo Checking for ADB
if not exist "%~dp0adb.exe" (
    echo ADB not found in the current directory. Please make sure that adb.exe is present.
    pause
    exit
)

echo Checking for device
"%~dp0adb.exe" devices
if not errorlevel 1 (
    echo Device found
) else (
    echo No device found. Please make sure that your device is connected and recognized by ADB.
    pause
    exit
)

echo Rebooting device into recovery mode
"%~dp0adb.exe" reboot recovery

echo Creating full backup
"%~dp0adb.exe" backup -apk -shared -all -f %~dp0backup.ab

echo Backup complete
pause

