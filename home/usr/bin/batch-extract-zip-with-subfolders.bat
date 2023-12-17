REM "C:\Program Files\7-Zip\7z.exe" x "*.zip"

@echo off
setlocal enabledelayedexpansion

REM Set the path to 7-Zip executable
set "zipPath=C:\Program Files\7-Zip\7z.exe"

REM Set the current directory as the zip directory
set "zipDirectory=%cd%"

REM OR...

REM (OPTIONAL) Set the path to the directory containing the zip files
REM set "zipDirectory=C:\Path\to\Your\Zip\Files"

REM Change to the zip directory
REM cd /d "%zipDirectory%"

REM Iterate through each zip file in the directory
REM for %%F in (*.7z) do (
for %%F in (*.zip) do (
  REM Create a subfolder with the same name as the zip file (excluding the extension)
  set "subfolder=%%~nF"
  mkdir "!subfolder!"

  REM Extract the zip file contents into the subfolder
  "%zipPath%" x -o"!subfolder!" "%%F"
)
