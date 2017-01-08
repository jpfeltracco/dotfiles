# dotfiles
## Info
These are some of my dotfiles for solarized i3  + neovim + zsh. Terminal
emulator is up to individual system. I just solarize them all.

## Usage
Simply do a `python setup.py` (python 3)
- setup.py will create symlinks between this repo's dotfiles and your system, dealing with existing files as the come up.
- Files to symlink and the location of the symlinks can changed by editing the `dotfiles` list in setup.py.

## Package List
1. i3
2. i3blocks
3. zsh (zprezto) - "pure" prompt (two lines)
4. neovim
5. Ag (The Silver Searcher)

## Color Scheme Links
Gnome Terminal: https://github.com/Anthony25/gnome-terminal-colors-solarized
Termite: https://github.com/alpha-omega/termite-colors-solarized
i3: https://github.com/acrisci/i3-style/blob/master/themes/solarized

## Basic Principles
* Use vim bindings except in Zsh/Bash
    - i3 : uses `meta+h/j/k/l` to change focused window
* Control windows with Meta key
* Control applications with Alt key (have tmux switch tabs like web browsers)
* Use Neovim for text editing. Remap some bindings to match Spacemacs a bit
    - Basic bindings:
      `space+w`: Change focused window
      `space+f` : File browser
      `space+t` : Tag bar
      `space+/` : Fuzzy search file contents
      `space+p` : Fuzzy search file names
      `space+b` : Search buffers
