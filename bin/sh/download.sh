#!/bin/bash

log(){
  printf "[%s]: %s\n" "$0" "$1"
}

get_mp3(){
  log "url: $1"
  youtube-dl -o "%(title)s.%(ext)s" \
	--ignore-errors \
	--extract-audio \
	--audio-format \
	mp3 "$1"
}

get_mp3_playlist(){
  log "url: $1"
	youtube-dl -o "%(playlist_index)s-%(title)s.%(ext)s" \
	--ignore-errors \
	--extract-audio \
	--audio-format \
	mp3 "$1"
}

echo "$#"

[ "--get-mp3" == "$1" ] && [ "$#" == "2" ] && get_mp3 "$2"
[ "--get-mp3-playlist" == "$1" ] && [ "$#" == "2" ] && get_mp3_playlist "$2"