#!/bin/sh

filename="grim_$(date "+%F_%Hh%Mm%Ss").png"
folder="$HOME/Pictures/Screenshots"
mkdir -p $folder
path="$folder/$filename"

active_window="$(hyprctl activewindow | grep monitor | awk '{print $2}')"
monitor=$([ "$active_window" == 0 ] && echo "eDP-1" || echo "DP-1")

grim -t png -o $monitor $path && wl-copy < $path

if [ $? -eq 0 ]; then
  notify-send -t 3000 -a grim "Saved to clipboard and $filename" -i $path
fi
