#!/bin/sh

fname="/tmp/grim_screenshot_$(date "+%F_%H-%M-%S").png"
grim -t png $fname
swaylock -i $fname -f --clock --timestr "%H:%M" --datestr "%a %d %b" --effect-blur 7x5 --indicator --fade-in 1 --ring-wrong-color ff5370 --inside-wrong-color f07178 --ring-ver-color 82aaff --inside-ver-color 89DDFF --ring-clear-color ffcb6b --inside-clear-color ffcb6b --key-hl-color c3e88d --inside-color 676E9560 --ring-color c792ea --font-size 27 --layout-text-color ff0000 --text-color d0d0d0 -n 00000000 --separator-color 00000000
rm $fname
