#!/bin/sh

filename="grim_screenshot_$(date "+%F_%H-%M-%S").png"
folder="$HOME/Pictures/Screenshots/"
mkdir -p $folder
path="$folder/$filename"

grim -t png -g "$(slurp)" /tmp/$filename

if [ $? -eq 0 ]; then
  satty --filename /tmp/$filename
  rm /tmp/$filename
fi
