# ~/.config/fish/config.fish

# Homebrew (sets PATH, MANPATH, HOMEBREW_* etc.)
/opt/homebrew/bin/brew shellenv | source

# Custom PATH entries (fish_add_path prepends; last-added wins, so this
# reproduces the zsh order: ~/.local/bin, then ~/.opencode/bin, then brew)
fish_add_path $HOME/.opencode/bin
fish_add_path $HOME/.local/bin

# Interactive-only settings
if status is-interactive
    # (add aliases, abbreviations, keybindings here)
end
