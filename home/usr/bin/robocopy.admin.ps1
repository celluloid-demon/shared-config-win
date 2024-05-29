# Define the path to the text file containing the list of folders
$foldersListPath = "C:\Users\Jonathan\Desktop\folders.txt"

# Define the destination network drive
$destinationDrive = "Z:\"

# Check if the destination drive exists
if (-Not (Test-Path $destinationDrive)) {
    Write-Host "The destination drive $destinationDrive does not exist."
    exit
}

# Read the list of folders from the text file
$folders = Get-Content -Path $foldersListPath

foreach ($folder in $folders) {
    # Ensure the folder path is valid and not empty
    if (-Not [string]::IsNullOrWhiteSpace($folder) -and (Test-Path $folder)) {
        # Construct the robocopy command
        $robocopyCommand = "robocopy `"$folder`" `"$destinationDrive\$([System.IO.Path]::GetFileName($folder))`" /MIR"

        # Run the robocopy command
        Write-Host "Backing up $folder to $destinationDrive"
        Invoke-Expression $robocopyCommand
    } else {
        Write-Host "Invalid folder path: $folder"
    }
}

Write-Host "Backup completed."
