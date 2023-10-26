#!/bin/bash
# Check for /etc/os-release
if [ -f "/etc/os-release" ]; then
    # Use grep to extract information
    distribution_line=$(grep -E "^ID=" /etc/os-release)

    if [ -n "$distribution_line" ]; then
        distribution=$(echo "$distribution_line" | cut -d= -f2 | tr -d '"')

        case "$distribution" in
            debian|ubuntu)
                echo "Debian-based distribution"
                package_manager="apt"
                # Add Debian-specific commands here
                ;;
            rhel|centos|fedora)
                echo "Red Hat-based distribution"
                package_manager="yum"
                # Add Red Hat-specific commands here
                ;;
            arch)
                echo "Arch Linux"
                package_manager="pacman"
                # Add Arch Linux-specific commands here
                ;;
            suse)
                echo "SUSE-based distribution"
                package_manager="zypper"
                # Add SUSE-specific commands here
                ;;
            gentoo)
                echo "Gentoo"
                package_manager="emerge"
                # Add Gentoo-specific commands here
                ;;
            *)
                echo "Unknown distribution: $distribution"
                ;;
        esac

        echo "Default package manager: $package_manager"
    else
        echo "Unable to determine the distribution."
    fi
else
    echo "The /etc/os-release file is not present. Unable to determine the distribution."
fi

# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check if Git is installed
if ! command_exists git; then
  echo "Git is not installed. Installing..."
  # Install Git using your system's package manager, e.g., for Debian/Ubuntu:
  sudo $package_manager update
  sudo $package_manager install git
fi

if ! command_exists python3; then
  echo "Python 3 is not installed. Installing..."
  # Install Python 3 using your system's package manager, e.g., for Debian/Ubuntu:
  sudo $package_manager update
  sudo $package_manager install python3
  sudo $package_manager isntall python3-pip
fi

sudo $package_manager install npm
sudo $package_manager install xclip

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
git fetch origin 
git checkout -b master --track origin/master 

# Check if Neovim is installed
if ! command_exists nvim; then
  echo "Neovim is not installed. Installing..."
  # Install Neovim by extracting it and moving it to/opt and add it to path
  sudo $package_manager update
  echo "Extracting nvim"
  mkdir ~/vim-extract
  tar -xzvf nvim-linux64.tar.gz -C ~/vim-extract || exit
  sudo mv ~/vim-extract/nvim-linux64 /opt
  rmdir ~/vim-extract
  sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
  echo "Mounted nvim"
fi
# clone a git repository for packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "Setup complete."
cd ~/.config/nvim/plugin
nvim packer_compiled.lua
