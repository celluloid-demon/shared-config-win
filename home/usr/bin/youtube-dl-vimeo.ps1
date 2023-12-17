# Define functions
Function Main($a)
{
    # bad quality, for poor/intermitent connection
    # youtube-dl.exe -u "jonathandudrey@gmail.com" -p "makomako06" -f 'worstvideo[ext=mp4]+worstaudio[ext=m4a]/worst[ext=mp4]/worst' -o "~/Desktop/Vimeo_Videos/%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s" $a

    # good quality, for later viewing
    youtube-dl.exe -u "jonathandudrey@gmail.com" -p "makomako06" -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' -o "D:/Users/jonat/Desktop/Vimeo_Videos/%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s" $a
}

# Main logic
Main($args)
