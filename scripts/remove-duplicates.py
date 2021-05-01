#!/usr/bin/env python3

import sys

files = sys.argv
files.pop(0)

for file in files:
    print("Editing file: " + file)
    lines_seen = []

    for line in open(file, "r"):
        if line not in lines_seen:
            lines_seen.append(line)

    file = open(file, 'w')
    file.writelines(lines_seen)
    file.close()
