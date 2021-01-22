#!/usr/bin/env python

import sys

files = sys.argv
files.pop(0)

for file in files:
    print("Editing file: " + file)
    lines_seen = []

    for each_line in open(file, "r"):
        line = each_line.rstrip("\n")

        if line not in lines_seen:
            lines_seen.append(line)

    with open(file, 'w') as writer:
        for line in lines_seen:
            writer.write(line)
