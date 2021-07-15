#!/usr/bin/python3

import os
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("index", help="Image index number")
args = parser.parse_args()

if (index := int(args.index)) in range(1, 5):
    os.system(f"ogurictl output eDP-1 --scaling-mode fill --anchor center --filter nearest --image ~/Pictures/bgs/{index}.gif")
