; Ensures only one instance of the script is running
#SingleInstance Force

; Check if clipboard contents contain a colon and backslashes (indicating a
; Windows-style path)
if (InStr(Clipboard, ":") && InStr(Clipboard, "\")) {

    ; Store the clipboard content in a variable
    path := Clipboard

    ; Replace backslashes with forward slashes
    StringReplace, path, path, \, /, All
    
    ; Extract the drive letter
    driveLetter := SubStr(path, 1, 2)

    ; Remove the colon from the drive letter
    driveLetter := SubStr(driveLetter, 1, 1) . SubStr(driveLetter, 3)

    ; Convert drive letter to lowercase
    StringLower, driveLetter, driveLetter

    ; Remove the drive letter from the path
    path := SubStr(path, 4)

    ; Modify the path for WSL
    path := "/mnt/" . driveLetter . "/" . path
    
    ; Add quotes around the path
    path := """" . path . """"

    ; Create `cd` command-string for use in a Linux terminal
    command := "cd " . path
    
    ; Send updated path to clipboard
    Clipboard := command

}            
