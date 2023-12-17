# Global vars

$CompareDir		= "Media"
$SourceDir		= "F:\Resilio Sync\$CompareDir"
$DestDir		= "E:\Resilio Sync\$CompareDir"

# Define functions

Function Main
{

	Get-TreeHash $SourceDir

	Get-TreeHash $DestDir

	Compare-TreeHash $SourceDir $DestDir

}

Function Get-TreeHash ($_dir)
{

	Write-Output "Getting children for tree (this can take a minute for larger datasets)..."
	# get files recursively (exclude hash files not cleaned up from previous batches) (can take a while if tree you're scanning is effin huge)
	# $_files = Get-ChildItem -LiteralPath $_dir -Recurse -File -Exclude "*.hash.clixml"
	Get-ChildItem -LiteralPath $_dir -Recurse | Where-Object { ($_ -is [System.IO.FileInfo]) -and ($_.Name -notlike "*.hash.clixml") } -OutVariable _files *>$null # cause holy fuck does it generate a lot of unnecessary output for larger trees | note not sure if we need to append objects as they stream through using +notation (ex '+_files')

	Write-Output "Scanning for new files to compute hashes for in dir: $_dir (hashes can take a minute for larger files)..."

	foreach ($i in $_files)
	{

		# log
		# Write-Output $i.FullName

		# name workingobjs xml after dir, and save in dir
		$_workingobjout = $i.FullName + ".hash.clixml"

		if ( Test-Path -LiteralPath $_workingobjout )
		{

			# log
			Write-Output $i.FullName

			# debug
			# Write-Output "Help! already exists"
			# Write-Output $_workingobjout

		}

		else
		{

			# log
			Write-Output $i.FullName
			Write-Output "Computing hash..."

			$_workingobj = Get-FileHash -LiteralPath $i.FullName

			# log
			Write-Output "Writing hash file..."

			# backup current state of workingobjs
			Export-Clixml -InputObject $_workingobj -LiteralPath $_workingobjout # literalpath to prevent expansion of wildcard brackets in filenames/paths

			# log
			Write-Output "New hash written"

			# debug
			# Write-Output "Help! wrote something new somewhere"
			# Write-Output $_workingobjout

		}

	}

}

Function Compare-TreeHash ($_dir1, $_dir2)
{

	# hope that there's a workingobjs backup at root of each dir and compare hash attributes

	Write-Output "Recursively comparing hashes... (This can take a few - it will return nothing if all file hashes in all subdirectories match)"

	# recursively collect source files to compare hashes with
	# $_srccomparefiles = Get-ChildItem -LiteralPath $_dir1 -Recurse -File -Exclude "*.hash.clixml"
	Get-ChildItem -LiteralPath $_dir1 -Recurse | Where-Object { ($_ -is [System.IO.FileInfo]) -and ($_.Name -notlike "*.hash.clixml") } -OutVariable _srccomparefiles *>$null

	# init to append later
	# todo comment this out for testing once things are stable, just another way of accomplishing the same thing but less janky
	$_workingobj1 = $_srccomparefiles
	# or mebbe you can init like this if you have to?
	# $_workingobj1 = $null

	# build source object
	# $_workingobj1 = foreach ($i in $_srccomparefiles)
	foreach ($i in $_srccomparefiles)
	{

		# $_split1 = Split-Path $i.FullName
		$_workingobjout1 = $i.FullName + ".hash.clixml"

		# recreate source obj, one entry at a time, from physical files
		$_workingobj1 += Import-Clixml -LiteralPath $_workingobjout1
		# todo enable for testing
		# Import-Clixml -LiteralPath $_workingobjout1

	}

	# build index of destination files to search against
	# $_destcomparefiles = Get-ChildItem -LiteralPath $_dir2 -Recurse -File -Exclude "*.hash.clixml"
	Get-ChildItem -LiteralPath $_dir2 -Recurse | Where-Object { ($_ -is [System.IO.FileInfo]) -and ($_.Name -notlike "*.hash.clixml") } -OutVariable _destcomparefiles *>$null

	# init to append later
	$_workingobj2 = $_destcomparefiles
	# or mebbe you can init like this if you have to?
	# $_workingobj2 = $null

	# build destination object
	# todo enable for testing
	# $_workingobj2 = foreach ($i in $_destcomparefiles)
	foreach ($i in $_destcomparefiles)
	{

		# $_split2 = Split-Path $i.FullName
		$_workingobjout2 = $i.FullName + ".hash.clixml"

		# recreate dest obj, one entry at a time, from physical files
		$_workingobj2 += Import-Clixml -LiteralPath $_workingobjout2
		# todo enable for testing
		# Import-Clixml -LiteralPath $_workingobjout2

	}

	# Compare-Object -ReferenceObject $SourceWorking.Hash -DifferenceObject $DestWorking.Hash
	# Print human-readable names with hashes
	# If you want to see filenames, by using the entire object rather than just the hash string and specifying the Hash property with the –Property parameter on Compare-Object, you can get the files that represent each hash
	(Compare-Object -ReferenceObject $_workingobj1 -DifferenceObject $_workingobj2 -Property hash -PassThru).Path # todo mebbe there's a literalpath method if you run into trouble with this?

	Write-Output "Done!"

}

# Main logic

Main
