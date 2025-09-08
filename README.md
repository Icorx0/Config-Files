# My Linux Dotfiles
This repository stores my personal configuration files (dotfiles) for various applications I use on Linux. The setup is designed to be fast, portable, and easy to manage using make.

## Quick Start on a New System
Setting up a new machine with these configurations is a simple two-step process.

1. Install Dependencies
Run the installer with sudo
```sudo ./install.sh```

2. Apply Configurations
Once the script is finished, run make apply. This will copy all the configurations from this repository to their correct locations in your home directory, backing up any existing files with a .bak extension.
```make apply```

That's it! Your new system is now configured.

## Daily Workflow
When you make a change to a local configuration file on your machine (e.g., you edit ~/.config/alacritty/alacritty.toml), follow these steps to save the changes back to the repository.

1. Collect Changes:
Run make collect to copy your changes from your system into this repository.
```make collect```

2. Commit and Push:
Commit the updated files to Git and push them to your remote.
```
git add .
git commit -m "feat: update alacritty theme"
git push
```

## Managed Software
This repository currently manages the configuration for:
- Alacritty - A fast, GPU-accelerated terminal emulator.
- Neovim - A modern, highly extensible text editor.
- Tmux - A terminal multiplexer.
- Hyprland - A dynamic tiling Wayland compositor.
- Bash - The standard GNU Bourne-Again Shell.

Useful Links
[Alacritty Configuration](https://alacritty.org/config-alacritty.html)
[Neovim Documentation](https://neovim.io/doc/)
[lazy.nvim Plugin Manager](https://github.com/folke/lazy.nvim)
