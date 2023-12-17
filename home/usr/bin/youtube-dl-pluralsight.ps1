# Define functions
Function Main($a)
{
	youtube-dl.exe -u "jonathandudrey@gmail.com" -p "makomako06" -o '~/Desktop/Pluralsight_Videos/%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s' --all-subs --sleep-interval 120 $a
}

# Main logic
Main($args)
