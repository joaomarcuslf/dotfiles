#!/usr/bin/env python3

import sys
import os

command = sys.argv
command.pop(0)

option = command[0]
arg = ''

if len(command) > 1:
    arg = command[1]

paths = [
    ".ssh/id_ed25519",
    ".ssh/id_ed25519.pub",
    ".gitconfig",
]


def set(arg):
    if not arg:
        raise KeyError

    for file in paths:
        os.popen(f'mkdir -p ~/.git-profiles && mkdir -p ~/.git-profiles/.ssh')
        os.popen(f'cp ~/.git-profiles/{file}.{arg} ~/{file}')

    os.popen(f'ssh-add -K ~/.ssh/id_ed25519')


def create(arg):
    if not arg:
        raise KeyError

    for file in paths:
        os.popen(f'mkdir -p ~/.git-profiles && mkdir -p ~/.git-profiles/.ssh')
        os.popen(f'cp ~/{file} ~/.git-profiles/{file}.{arg}')


def help(arg):
    print("git-profile $command $arg:")
    print("    set $arg:\n        changes the profile to the one requested")
    print("    create $arg:\n        will create an profile using the name given")
    print("    help:\n        will print help commands")
    pass


options = {
    "set": set,
    "create": create,
    "help": help,
}

try:
    options[option](arg)
except:
    print(f'Commang not found: {option}')
