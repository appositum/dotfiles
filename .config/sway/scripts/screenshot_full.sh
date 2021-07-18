#!/bin/sh

filename="$(date "+%F_%H-%M-%S")"
grim -t png "$HOME/Pictures/grim_screenshot_$filename.png"
xclip -selection clipboard -t image/png -i "$HOME/Pictures/grim_screenshot_$filename.png"
