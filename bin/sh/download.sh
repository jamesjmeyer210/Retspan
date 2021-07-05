#!/bin/bash

log(){
  printf "[%s] %s\n" "$0" "$1"
}

GET_MP3="--get-mp3"
get_mp3(){
  log "$GET_MP3 (url: $1) =>"
  youtube-dl -o "%(title)s.%(ext)s" \
	--ignore-errors \
	--extract-audio \
	--audio-format \
	mp3 "$1"
}

GET_MP3S="--get-mp3-playlist"
get_mp3_playlist(){
  log "$GET_MP3S (url: $1) =>"
	youtube-dl -o "%(playlist_index)s-%(title)s.%(ext)s" \
	--ignore-errors \
	--extract-audio \
	--audio-format \
	mp3 "$1"
}

echo "$#"

[ "$GET_MP3" == "$1" ] && [ "$#" == "2" ] && get_mp3 "$2"
[ "$GET_MP3S" == "$1" ] && [ "$#" == "2" ] && get_mp3_playlist "$2"