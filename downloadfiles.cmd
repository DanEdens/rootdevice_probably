@echo off

echo Checking for ADB
if not exist "%~dp0adb.exe" (
    echo ADB not found. Downloading...
    powershell -Command "Invoke-WebRequest -Uri 'https://dl.google.com/android/repository/platform-tools_r30.0.5-windows.zip' -OutFile '%~dp0adb.zip'"
    echo Extracting...
    powershell -Command "Expand-Archive -Path '%~dp0adb.zip' -DestinationPath '%~dp0'"
    del "%~dp0adb.zip"
)

echo Checking for fastboot
if not exist "%~dp0fastboot.exe" (
    echo Fastboot not found. Downloading...
    powershell -Command "Invoke-WebRequest -Uri 'https://dl.google.com/android/repository/platform-tools_r30.0.5-windows.zip' -OutFile '%~dp0fastboot.zip'"
    echo Extracting...
    powershell -Command "Expand-Archive -Path '%~dp0fastboot.zip' -DestinationPath '%~dp0'"
    del "%~dp0fastboot.zip"
)

echo Checking for recovery image
if not exist "%~dp0recovery.img" (
    echo Recovery image not found. Please download the recovery image and save it to the same directory as this script.
    pause
    exit
)

echo Checking for rooting files
if not exist "%~dp0su.zip" (
    echo Rooting files not found. Please download the rooting files and save it to the same directory as this script.
    pause
    exit
)

echo All necessary files found. Proceeding with rooting process...

rem Insert rooting process here

echo Rooting process complete
pause

