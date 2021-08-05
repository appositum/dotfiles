#!/bin/sh

filename="grim_screenshot_$(date "+%F_%H-%M-%S").png"
path="$HOME/Pictures/$filename"

grim -t png $path
xclip -selection clipboard -t image/png -i $path
notify-send -t 2000 -a grim "Screenshot saved to clipboard and ~/Pictures/$filename"
