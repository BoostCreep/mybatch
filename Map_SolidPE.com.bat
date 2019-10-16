net use /del *
@echo off
ECHO All Map Drives have been removed! Press Space to Run Mapping on your Machine, %username%
PAUSE

@echo on
net use b: \\se-fse\Batch /persistent:yes
net use p: \\se-fse\Prolib /persistent:yes
net use s: \\se-dc\DFSProject /persistent:yes
net use v: \\se-fse\Vault /persistent:yes
net use x: \\se-fse\Project /persistent:yes
net use m: \\mpsolid13\BACKUPS /persistent:yes
net use u: \\se-fse\Users\%username% /persistent:yes
IF /i "%username%"=="gavin.rumble" (
   net use u: \\se-fse\Users
) ELSE (
   GOTO Users)
PAUSE
:Users
@echo off
echo.
ECHO Drive Mapping appears successful, %username% , scroll up to check the progress!
echo.
PAUSE
EXIT /b