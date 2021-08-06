#!/usr/bin/env python3

import sys
import os

command = sys.argv
command.pop(0)

branch_name = command[0]

def command(arg):
    if not arg:
        raise KeyError

    if os.popen(f'git branch | grep {arg}').read():
        os.popen(f'git checkout {arg}')
    else:
        os.popen(f'git checkout -b {arg}')

try:
    command(branch_name)
except:
    print(f'Commang not found: {option}')
