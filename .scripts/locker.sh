#!/bin/sh

# # catppuccin
# ring_color="b4befe00"
# separator_color="00000000"
# key_hl_color="a6e3a1"
# bs_hl_color="f38ba8"
# text_color="11111b"
# inside_color="cdd6f490"
# inside_clear_color="cdd6f490"
# ring_clear_color="f9e2af"
# inside_ver_color="cdd6f490"
# ring_ver_color="89b4fa"
# inside_wrong_color="cdd6f490"
# ring_wrong_color="f38ba8"

# kanagawa
separator_color="#00000000"
key_hl_color="#98BB6C"
bs_hl_color="#FF5D62"
text_color="#DCD7BA"
text_clear_color="$text_color"
text_ver_color="$text_color"
text_wrong_color="$text_color"
text_caps_lock_color="$text_color"
inside_color="#223249F5"
inside_clear_color="$inside_color"
inside_ver_color="$inside_color"
inside_wrong_color="$inside_color"
ring_color="#957FB800"
ring_clear_color="#C0A36E"
ring_ver_color="#7E9CD8"
ring_wrong_color="#FF5D62"

swaylock --screenshots \
  --line-uses-ring \
  --ignore-empty-password \
  --hide-keyboard-layout \
  --show-failed-attempts \
  --effect-blur 7x5 \
  --effect-pixelate 10 \
  --indicator \
  --clock \
  --timestr "%H:%M" \
  --datestr "%a %d %b" \
  --font 'SF Pro Display' \
  --font-size 28 \
  --separator-color $separator_color \
  --key-hl-color $key_hl_color \
  --bs-hl-color $bs_hl_color \
  --text-color $text_color \
  --text-clear-color $text_clear_color \
  --text-ver-color $text_ver_color \
  --text-wrong-color $text_wrong_color \
  --text-caps-lock-color $text_color \
  --inside-color $inside_color \
  --inside-clear-color $inside_clear_color \
  --inside-ver-color $inside_ver_color \
  --inside-wrong-color $inside_wrong_color \
  --ring-color $ring_color \
  --ring-clear-color $ring_clear_color \
  --ring-ver-color $ring_ver_color \
  --ring-wrong-color $ring_wrong_color
