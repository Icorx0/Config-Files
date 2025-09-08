#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Check for root privileges ---
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run with sudo or as root."
   exit 1
fi
SUDO_USER=${SUDO_USER:-$(whoami)}

# --- Define packages to install ---
PACKAGES=(
    neovim
    alacritty
    hyprland
    tmux
    git
    make
    curl
    tree-sitter-cli
)

# --- Automatically detect package manager ---
if command -v apt-get &> /dev/null; then
    PKG_MANAGER="apt-get"
    UPDATE_CMD="apt-get update"
    INSTALL_CMD="apt-get install -y"
elif command -v pacman &> /dev/null; then
    PKG_MANAGER="pacman"
    UPDATE_CMD="pacman -Syy"
    INSTALL_CMD="pacman -S --noconfirm"
elif command -v dnf &> /dev/null; then
    PKG_MANAGER="dnf"
    UPDATE_CMD="dnf check-update"
    INSTALL_CMD="dnf install -y"
else
    echo "Unsupported package manager. Please install packages manually."
    exit 1
fi
echo "Detected package manager: $PKG_MANAGER"

# --- Update and install packages ---
echo "Updating package lists..."
$UPDATE_CMD
echo "Installing required packages: ${PACKAGES[*]}..."
$INSTALL_CMD "${PACKAGES[@]}"
echo "All system packages installed."

# --- Install Neovim Plugin Manager (lazy.nvim) ---
LAZY_DIR="/home/$SUDO_USER/.local/share/nvim/lazy/lazy.nvim"
if [ ! -d "$LAZY_DIR" ]; then
    echo "lazy.nvim not found. Cloning repository..."
    # Run as the original user to avoid permission issues
    sudo -u $SUDO_USER git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable "$LAZY_DIR"
    echo "Successfully cloned lazy.nvim."
else
    echo "lazy.nvim is already installed."
fi

# --- Install Nerd Font ---
install_nerd_font() {
    echo "Installing JetBrains Mono Nerd Font..."

    # Define font variables. $HOME will be correctly set to the user's home dir.
    local FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip"
    local FONT_DIR="$HOME/.local/share/fonts"
    local EXPECTED_FONT_FILE="$FONT_DIR/JetBrainsMonoNerdFont-Regular.ttf"

    # Check if font is already installed to avoid re-downloading
    if [ -f "$EXPECTED_FONT_FILE" ]; then
        echo "JetBrains Mono Nerd Font already appears to be installed."
    else
        echo "Downloading and installing JetBrains Mono Nerd Font..."
        curl -L -f -o /tmp/JetBrainsMono.zip "$FONT_URL"
        mkdir -p "$FONT_DIR"
        unzip -o /tmp/JetBrainsMono.zip -d "$FONT_DIR"
        rm /tmp/JetBrainsMono.zip
        echo "Updating font cache..."
        fc-cache -f -v
    fi
}
sudo -u "$SUDO_USER" bash -c "$(declare -f install_nerd_font); install_nerd_font"

# Finish commands
echo "Setup complete! You can now run 'make apply' to deploy your dotfiles."
