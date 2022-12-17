
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

echo Rebooting device into bootloader
"%~dp0adb.exe" reboot bootloader

echo Flashing recovery image
"%~dp0fastboot.exe" flash recovery %~dp0recovery.img

echo Rebooting device
"%~dp0fastboot.exe" reboot

echo Waiting for device to boot
"%~dp0adb.exe" wait-for-device

echo Pushing rooting files to device
"%~dp0adb.exe" push %~dp0su.zip /sdcard/

echo Rebooting device into recovery mode
"%~dp0adb.exe" reboot recovery

echo Installing rooting files
"%~dp0adb.exe" sideload %~dp0su.zip

echo Rebooting device
"%~dp0adb.exe" reboot

echo Rooting process complete
pause

