#!/usr/bin/env bash

if [[ $volume -lt 100 ]]; then
  amixer -q sset Master 5%+
fi
