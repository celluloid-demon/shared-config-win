# -----------------------------------------------------------------------------
# ngen.ps1 - Helps to speedup PowerShell if it's acting slow. I have no idea
# what it does.

# Usage: ngen.ps1

# Revision history:
# 2015-08-21 Downloaded by Jonathan Dudrey
# -----------------------------------------------------------------------------

$Env:PATH = [Runtime.InteropServices.RuntimeEnvironment]::GetRuntimeDirectory()
[AppDomain]::CurrentDomain.GetAssemblies() | % {
  $pt = $_.Location
  if (! $pt) {continue}
  if ($cn++) {''}
  $na = Split-Path -Leaf $pt
  Write-Host -ForegroundColor Yellow "NGENing $na"
  ngen install $pt
}
