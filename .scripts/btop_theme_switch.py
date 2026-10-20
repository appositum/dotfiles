#!/usr/bin/env python3

import os
import subprocess
from pathlib import Path

mode = subprocess.check_output(
    ["noctalia", "msg", "theme-mode-get"]
).decode().strip()

theme = "lotus" if mode == "light" else "wave"

config = (
    Path(os.path.expanduser("~"))
    .joinpath(".config")
    .joinpath("btop")
    .joinpath("btop.conf")
)

with config.open() as f:
    # why did that dumbass make this thing loop through the whole file instead of using a simple for loop and breaking it when it found the correct line?????
    lines = [
        line if "color_theme" not in line else f'color_theme = "kanagawa-{theme}"\n'
        for line in f
    ]

with config.open("w") as f:
    for line in lines:
        f.write(line)

subprocess.run(["/usr/bin/btop"], check=False)
