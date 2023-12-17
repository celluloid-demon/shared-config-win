; Auto-click repeated 'student version' notifications for every single save/autos in Maya
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force
TrayTip, Hello User, You can Exit this script from Here`n(Script Created By Hardik Lakhalani), 20, 17
Loop
{
WinWait, Student Version File
IfWinExist, Student Version File
	
{
;WinActivate, Student Version File
ControlClick, x215 y109, Student Version File
}
}
