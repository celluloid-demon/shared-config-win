Create a new txtfile, pase this content:
@echo Set objShell = CreateObject("Shell.Application") > %temp%\sudo.tmp.vbs
@echo args = Right("%*", (Len("%*") - Len("%1"))) >> %temp%\sudo.tmp.vbs
@echo objShell.ShellExecute "%1", args, "", "runas" >> %temp%\sudo.tmp.vbs
@cscript %temp%\sudo.tmp.vbs
and save it as SUDO.cmd.
Now copy the cmd to your system32 folder.
When you now want to run a programm with admin rights type this:
sudo cmd /k javaw.exe JAVA file
Now accept the UAC prompt.
Hope this helps.
Andre Ziegler
