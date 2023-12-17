# Define functions
Function Main($a)
{
	youtube-dl.exe -u "jonathandudrey@lcad.edu" -p "-KnyRin5" -o '~/Desktop/Lynda_Videos/%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s' --all-subs $a
}

# Main logic
Main($args)
