# -----------------------------------------------------------------------------
# ngen.ps1 - Helps to speedup PowerShell if it's acting slow. I have no idea
# how it works.

# Usage: ngen.ps1

# Revision history:
# 2015-08-23 Minor formatting corrections
# 2015-08-21 Downloaded by Jonathan Dudrey
# -----------------------------------------------------------------------------

# Define functions
Function Main()
{

Do_Thing

}

Function Do_Thing()
{

  $Env:PATH = [Runtime.InteropServices.RuntimeEnvironment]::GetRuntimeDirectory()
  [AppDomain]::CurrentDomain.GetAssemblies() | % {
    $pt = $_.Location
    if (! $pt) {continue}
    if ($cn++) {''}
    $na = Split-Path -Leaf $pt
    Write-Host -ForegroundColor Yellow "NGENing $na"
    ngen install $pt
  }

}

# Main Logic
Main
