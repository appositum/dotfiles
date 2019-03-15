#!/bin/sh

filename="$(date "+%F_%H-%M-%S")"
grim -t png -g '0,0 1920x1080' "$HOME/Pictures/grim_screenshot_$filename.png"
