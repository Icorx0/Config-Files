# Makefile for collecting dotfiles into a Git repository.
#
# Targets:
#   collect: Copies all specified dotfiles from their system location
#            into this repository. This is the default target.

HOME := $(HOME)

.DEFAULT_GOAL := collect
.PHONY: collect

collect:
	@echo "Collecting dotfiles from system to repository..."

	# Tmux
	@echo "   Copying tmux config..."
	@mkdir -p tmux
	@cp $(HOME)/.tmux.conf tmux/tmux.conf

	# bashrc
	@echo "   Copying bashrc..."
	@mkdir -p bash
	@cp $(HOME)/.bashrc bash/bashrc

	# alacritty
	@echo "   Copying alacritty config..."
	@mkdir -p alacritty 
	@cp $(HOME)/.config/alacritty/alacritty.toml alacritty/alacritty.toml

	# Hyprland
	@echo "   Copying hyprland config..."
	@rm -rf hypr/
	@cp -r $(HOME)/.config/hypr ./hypr

	# Waybar
	@echo "   Copying waybar config..."
	@rm -rf waybar/
	@cp -r $(HOME)/.config/waybar ./waybar

	# nvim
	@echo "   Copying nvim config directory..."
	@rm -rf nvim/
	@cp -r $(HOME)/.config/nvim ./nvim

apply:
	@echo "Applying dotfiles from repository to system..."

	# Apply tmux.conf
	@echo "   Applying tmux config..."
	@if [ -f "$(HOME)/.tmux.conf" ]; then mv "$(HOME)/.tmux.conf" "$(HOME)/.tmux.conf.bak"; fi
	@cp ./tmux/tmux.conf $(HOME)/.tmux.conf

	# Apply bashrc
	@echo "   Applying bashrc..."
	@if [ -f "$(HOME)/.bashrc" ]; then mv "$(HOME)/.bashrc" "$(HOME)/.bashrc.bak"; fi
	@cp ./bash/bashrc $(HOME)/.bashrc

	# Apply alacritty.toml
	@echo "   Applying alacritty config..."
	@mkdir -p $(HOME)/.config/alacritty
	@if [ -f "$(HOME)/.config/alacritty/alacritty.toml" ]; then mv "$(HOME)/.config/alacritty/alacritty.toml" "$(HOME)/.config/alacritty/alacritty.toml.bak"; fi
	@cp ./alacritty/alacritty.toml $(HOME)/.config/alacritty/alacritty.toml

	# Apply hyprland directory
	@echo "   Applying hyprland config directory..."
	@if [ -d "$(HOME)/.config/hypr" ]; then mv "$(HOME)/.config/hypr" "$(HOME)/.config/hypr.bak"; fi
	@cp -r ./hypr $(HOME)/.config/hypr

	# Apply waybar directory
	@echo "   Applying waybar config directory..."
	@if [ -d "$(HOME)/.config/wabar" ]; then mv "$(HOME)/.config/waybar" "$(HOME)/.config/waybar.bak"; fi
	@cp -r ./waybar $(HOME)/.config/waybar

	# Apply nvim directory
	@echo "   Applying nvim config directory..."
	@if [ -d "$(HOME)/.config/nvim" ]; then mv "$(HOME)/.config/nvim" "$(HOME)/.config/nvim.bak"; fi
	@cp -r ./nvim $(HOME)/.config/nvim

	@echo "✅ Application complete. Existing files were backed up with a .bak extension."
