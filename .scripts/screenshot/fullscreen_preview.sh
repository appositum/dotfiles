#!/bin/sh

filename="grim_$(date "+%F_%Hh%Mm%Ss").png"
folder="$HOME/Pictures/Screenshots"
mkdir -p $folder
path="$folder/$filename"

active_window="$(hyprctl activewindow | grep monitor | awk '{print $2}')"
monitor=$([ "$active_window" == 0 ] && echo "eDP-1" || echo "DP-1")

grim -t png -o $monitor /tmp/$filename

if [ $? -eq 0 ]; then
  satty --filename /tmp/$filename
  rm /tmp/$filename
fi
