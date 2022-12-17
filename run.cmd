@echo off

echo Running make_backup.cmd
call make_backup.cmd
if not errorlevel 1 (
    echo Backup complete
) else (
    echo Backup failed. Exiting.
    pause
    exit
)

echo Running downloadfiles.cmd
call downloadfiles.cmd
if not errorlevel 1 (
    echo Download complete
) else (
    echo Download failed. Exiting.
    pause
    exit
)

echo Running rootdevice.cmd
call rootdevice.cmd
if not errorlevel 1 (
    echo Rooting complete
) else (
    echo Rooting failed. Exiting.
    pause
    exit
)

echo All tasks complete
pause

