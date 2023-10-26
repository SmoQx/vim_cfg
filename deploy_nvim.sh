#!/bin/bash

# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check if Git is installed
if ! command_exists git; then
  echo "Git is not installed. Installing..."
  # Install Git using your system's package manager, e.g., for Debian/Ubuntu:
  sudo apt-get update
  sudo apt-get install git
fi

if ! command_exists python3; then
  echo "Python 3 is not installed. Installing..."
  # Install Python 3 using your system's package manager, e.g., for Debian/Ubuntu:
  sudo apt-get update
  sudo apt-get install python3
fi

# Create the ~/.config/nvim directory if it doesn't exist
if [ ! -d "$HOME/.config/nvim" ]; then
  mkdir -p "$HOME/.config/nvim"
fi

# Navigate to the Neovim config directory
cd "$HOME/.config/nvim" || exit

# Initialize a Git repository if not already initialized
if [ ! -d ".git" ]; then
  git init
fi

# Pull a Git repository (replace with your Git repository URL)
# For example, pulling a configuration from a GitHub repository:
git remote add origin https://github.com/SmoQx/vim_cfg.git || exit
git fetch origin || exit
git checkout -b master --track origin/master || exit

# Check if Neovim is installed
if ! command_exists nvim; then
  echo "Neovim is not installed. Installing..."
  # Install Neovim using your system's package manager, e.g., for Debian/Ubuntu:
  sudo apt-get update
  echo "Extracting nvim"
  tar -xzvf nvim-linux64.tar.gz -C ~/vim-extract || exit
  sudo mv ~/vim-extract/nvim-linux64 /opt
  sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
  echo "Mounted nvim"
fi

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "Setup complete."
