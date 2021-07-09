#!/usr/bin/env python3

import argparse
import os

parser = argparse.ArgumentParser()
parser.add_argument("-p", "--platform", help="Code hosting platform")
parser.add_argument("-r", "--repository", help="username/repository_name")
args = parser.parse_args()

class Platform:
    def __init__(self, name, domain="com"):
        self.name = name
        self.domain = domain
        self.url = name + "." + domain

gh = Platform("github")
gl = Platform("gitlab")
bb = Platform("bitbucket", "org")

platforms = {
    "gh": gh,
    "github": gh,
    "gl": gl,
    "gitlab": gl,
    "bb": bb,
    "bitbucket": bb,
}

if args.platform not in platforms.keys():
    raise RuntimeError("Invalid platform")

os.system(f"git clone https://{platforms.get(args.platform).url}/{args.repository}")
