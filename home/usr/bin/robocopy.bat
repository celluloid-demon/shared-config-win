@echo off

@REM set source="F:\Resilio Sync"
@REM set destination="E:\Resilio Sync"

@REM robocopy.exe "%source%" "%destination%" "*" /mir /zb /j /copy:dt /dcopy:d /sj /sl /mt:12 /fft /r:1 /w:3 /eta /np /fp

@REM WARNING: If you get the error "You do not have the Backup and Restore Files user rights", is because you didn't run the command, with the /B switch, as ADMINISTRATOR. As a general rule, to avoid problems, RoboCopy commands should always be run as ADMIN. So either run the batch file as ADMIN or run the command from an elevated (Run As Admin) command prompt.

set source="D:\Users\jonat"
set destination="E:\robocopy\jonat"

robocopy.exe "%source%" "%destination%" "*" /mir /zb /j /copy:dt /dcopy:d /sj /sl /mt:12 /fft /r:1 /w:3 /eta /np /fp
