#!/bin/bash

# Get the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="$SCRIPT_DIR/script_log.log"

# Function to log errors
log_error() {
    local error_message="$1"
    echo "$(date): $error_message" >> "$LOG_FILE"
}

# Redirect stdout and stderr to a log file
# exec &> "$LOG_FILE"

# Check for /etc/os-release
if [ -f "/etc/os-release" ]; then
    # Use grep to extract information
    distribution_line=$(grep -E "^ID=" /etc/os-release)

    if [ -n "$distribution_line" ]; then
        distribution=$(echo "$distribution_line" | cut -d= -f2 | tr -d '"')

        case "$distribution" in
            debian|ubuntu|kali)
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
                log_error "Unknown distribution: $distribution"
                ;;
        esac

        echo "Default package manager: $package_manager"
    else
        log_error "Unable to determine the distribution."
    fi
else
    log_error "The /etc/os-release file is not present. Unable to determine the distribution."
fi

# Function to check if a command is available
command_exists() {
    command -v "$1" >/dev/null 2>&1
}
# Update packages
sudo $package_manager update || log_error "Failed to update package manager."
sudo $package_manager upgrade || log_error "Failed to upgrade packages."
sudo $package_manager ripgrep || log_error "Failed to install ripgrep"
# Install curl or wget for mason 
sudo $package_manager curl || log_error "Failed to install / update curl."
# Check if Git is installed
if ! command_exists git; then
    log_error "Git is not installed. Installing..."
    # Install Git using your system's package manager, e.g., for Debian/Ubuntu:
    sudo $package_manager update || log_error "Failed to update package manager."
    sudo $package_manager install git || log_error "Failed to install Git."
fi

if ! command_exists python3; then
    log_error "Python 3 is not installed. Installing..."
    # Install Python 3 using your system's package manager, e.g., for Debian/Ubuntu:
    sudo $package_manager update || log_error "Failed to update package manager."
    sudo $package_manager install python3 || log_error "Failed to install Python 3."
    sudo $package_manager install python3-pip || log_error "Failed to install Python 3 pip."
fi

# Create the ~/.config/nvim directory if it doesn't exist
if [ ! -d "$HOME/.config/nvim" ]; then
    mkdir -p "$HOME/.config/nvim"
fi

# Navigate to the Neovim config directory
cd "$HOME/.config/nvim" || log_error "Failed to navigate to Neovim config directory."

# Initialize a Git repository if not already initialized
if [ ! -d ".git" ]; then
    git init || log_error "Failed to initialize Git repository."
fi

sudo $package_manager install npm || log_error "Failed to install npm."
sudo $package_manager install xclip || log_error "Failed to install xclip."

# Pull a Git repository (replace with your Git repository URL)
# For example, pulling a configuration from a GitHub repository:
git remote add origin https://github.com/SmoQx/vim_cfg.git || log_error "Failed to add Git remote."
git fetch origin || log_error "Failed to fetch Git repository."
git checkout -b master --track origin/master || log_error "Failed to checkout Git branch."

# Check if Neovim is installed
if ! command_exists nvim; then
    log_error "Neovim is not installed. Installing..."
    # Install Neovim by extracting it and moving it to/opt and add it to path
    sudo $package_manager update || log_error "Failed to update package manager."
    echo "Extracting nvim"
    mkdir ~/vim-extract
    tar -xzvf nvim-linux64.tar.gz -C ~/vim-extract || log_error "Failed to extract Neovim."
    sudo mv ~/vim-extract/nvim-linux64 /opt || log_error "Failed to move Neovim to /opt."
    rmdir ~/vim-extract || log_error "Failed to remove Neovim extraction directory."
    sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim || log_error "Failed to create symlink for Neovim."
    echo "Mounted nvim"
fi

# clone a git repository for packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim || log_error "Failed to clone Packer repository."

echo "Setup complete."
cd ~/.config/nvim/lua/smoq
nvim packer.lua

# Display log file path
echo "Log file: $LOG_FILE"
