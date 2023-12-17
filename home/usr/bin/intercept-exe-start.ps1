# Define functions
Function Main($a)
{
  $interceptexehome = "$HOME\opt\interceptEXE\"

  Run-InterceptEXE
}

Function Run-InterceptEXE
{
  pushd "$interceptexehome"
  .\intercept.exe $a
  popd
}

# Main logic
Main("/apply")
