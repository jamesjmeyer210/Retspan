#!/bin/bash

log(){
  printf "[%s] %s\n" "$0" "$1"
}

# Download a single mp3 or many with no indexing
GET_MP3="--get-mp3"
get_mp3(){
  log "$GET_MP3 (url: $1) =>"
  youtube-dl -o "%(title)s.%(ext)s" \
	--ignore-errors \
	--extract-audio \
	--audio-format \
	mp3 "$1"
}

# Download a single mp3 or many with indexing
GET_MP3S="--get-mp3-playlist"
get_mp3_playlist(){
  log "$GET_MP3S (url: $1) =>"
	youtube-dl -o "%(playlist_index)s-%(title)s.%(ext)s" \
	--ignore-errors \
	--extract-audio \
	--audio-format \
	mp3 "$1"
}

if [ "$#" == "0" ] ; then
  log "Error: No args provided"
  exit
elif [ "$GET_MP3" == "$1" ] && [ "$#" == "2" ] ; then
  get_mp3 "$2"
elif [ "$GET_MP3S" == "$1" ] && [ "$#" == "2" ] ; then
  get_mp3_playlist "$2"
else
  log "ERROR: unknown args"
  exit
fi