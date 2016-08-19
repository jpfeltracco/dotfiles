#!/usr/bin/env python

import os
import subprocess

script_dir = os.path.dirname(os.path.realpath(__file__))
home_dir = os.getenv("HOME")

# first element is in repo
# second element is under HOME
dotfiles = [
    ("vimrc", ".vimrc"),
    ("bashrc", ".bashrc"),
    ("tmux.conf", ".tmux.conf"),
    ("i3", ".config/i3/config"),
    ("zshrc", ".zshrc"),
    ("i3blocks.conf", ".i3blocks.conf")
]

def yes_no(prompt):
    while True:
        resp = input(prompt + "\n[Y/n]: ").lower()
        if resp == "y" or resp == "yes" or resp == "":
            return True
        elif resp == "n" or resp == "no":
            return False

def print_section(name):
    print("########################################")
    print(name)
    print("########################################")

def make_link(src, dst):
    if yes_no("Link {} with {}?".format(src, dst)):
        if os.path.islink(dst) and os.path.realpath(dst) == src:
            print("Symbolic link already setup.")
            return
        if os.path.isfile(dst):
            print("{} already found, moving to {}.old".format(dst, dst))
            os.rename(dst, dst + ".old")
        os.symlink(src, dst)
    else:
        print("Not linking.")

print_section("DOT FILE SETUP")
for src, dst in dotfiles:
    make_link(script_dir + "/" + src, home_dir + "/" + dst)

print_section("VUNDLE SETUP")
if yes_no("Do vundle install?"):
    subprocess.call([
        "git",
        "clone",
        "https://github.com/VundleVim/Vundle.vim.git",
        home_dir + "/.vim/bundle/Vundle.vim"
    ])

    subprocess.call(["vim", "+PluginInstall", "+qall"])

print_section("FINISHED")
