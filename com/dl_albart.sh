#!/bin/bash

url_AlbumArt=$("youtube-dl --playlist-items 1 --get-thumbnail $url")
$(wget $url_AlbumArt)

#youtube-dl --list-thumbnails "url goes here"
# wget ^
