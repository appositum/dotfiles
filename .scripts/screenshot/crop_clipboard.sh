#!/bin/sh

filename="grim_$(date "+%F_%Hh%Mm%Ss").png"
folder="$HOME/Pictures/Screenshots"
mkdir -p $folder
path="$folder/$filename"

echo $path
grim -t png -g "$(slurp)" $path && wl-copy < $path

if [ $? -eq 0 ]; then
  notify-send -t 3000 -a grim "Saved to clipboard and $filename" -i $path
fi
