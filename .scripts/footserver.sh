#!/bin/sh

running="$(ps aux | grep 'foot --server' | grep -v grep)"

if [ "$running" ]; then
  pkill -f 'foot --server'
  notify-send -t 3000 -n foot -a foot "Foot server off"
else
  foot --server &
  notify-send -t 3000 -n foot -a foot "Foot server on"
fi
