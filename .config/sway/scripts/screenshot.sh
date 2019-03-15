#!/bin/sh

filename="$(date "+%F_%H-%M-%S")"
grim -t png -g "$(slurp)" "$HOME/Pictures/grim_screenshot_$filename.png"
