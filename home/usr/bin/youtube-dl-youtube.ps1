# Define functions
Function Main($a)
{
	
	# best video AND subtitles
	youtube-dl --format 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --all-subs --sub-format 'srt/ass/best' --output 'D:/Users/jonat/Desktop/Youtube_Videos/%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s' $a

    # Best video available
    # youtube-dl --format 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --output 'D:/Users/jonat/Desktop/Youtube_Videos/%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s' $a

    # Best audio only
    # youtube-dl.exe --format 'bestaudio[ext=m4a]/best[ext=m4a]' --output 'D:/Users/jonat/Desktop/Youtube_Videos/%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s' $a
}

# Main logic
Main($args)
