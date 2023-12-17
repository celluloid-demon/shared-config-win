# -----------------------------------------------------------------------------
# poop.ps1 - Poops out a text file on the user's desktop.

# Usage: poop.ps1

# Revision history:
# 2015-08-24 Created by Jonathan Dudrey
# -----------------------------------------------------------------------------

# Define functions
Function Main()
{

Poop

}

Function Poop()
{

pushd "$HOME\Desktop"
New-Item -ItemType file -name poop.txt
popd

}

# Main logic
Main
