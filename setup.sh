#!/bin/bash

# nvim setup script
# Installs neovim and dependencies, then sets up the configuration

set -e

# Function to print colorful messages
print_message() {
    local color=$1
    local message=$2
    
    case $color in
        "green") echo -e "\033[0;32m$message\033[0m" ;;
        "yellow") echo -e "\033[0;33m$message\033[0m" ;;
        "red") echo -e "\033[0;31m$message\033[0m" ;;
        *) echo "$message" ;;
    esac
}

# Function to detect Linux distribution
detect_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$ID
    elif [ -f /etc/lsb-release ]; then
        . /etc/lsb-release
        DISTRO=$DISTRIB_ID
    else
        DISTRO="unknown"
    fi
    print_message "yellow" "Detected Linux distribution: $DISTRO"
    
    return 0
}

# Install neovim and dependencies based on the detected distribution
install_dependencies() {
    print_message "yellow" "Installing Neovim and dependencies..."
    
    # Detect distribution
    detect_distro
    
    # Install packages based on distribution
    case $DISTRO in
        "arch"|"manjaro")
            print_message "yellow" "Using pacman to install packages"
            sudo pacman -Sy --needed --noconfirm neovim git ripgrep fd unzip gcc make python python-pip nodejs npm
            
            # Install optional dependencies
            sudo pacman -Sy --needed --noconfirm xclip lazygit
            ;;
            
        "ubuntu"|"debian"|"pop"|"linuxmint")
            print_message "yellow" "Using apt-get to install packages"
            
            # Add Neovim unstable PPA for updated version
            sudo add-apt-repository ppa:neovim-ppa/unstable -y
            sudo apt-get update
            
            # Install main dependencies
            sudo apt-get install -y neovim git ripgrep fd-find unzip build-essential python3 python3-pip nodejs npm
            
            # Create symlink for fd if needed (Ubuntu/Debian package it as fd-find)
            if command -v fdfind > /dev/null 2>&1 && ! command -v fd > /dev/null 2>&1; then
                print_message "yellow" "Creating symlink for fd-find to fd"
                sudo ln -sf $(which fdfind) /usr/local/bin/fd
            fi
            
            # Install optional dependencies
            sudo apt-get install -y xclip
            
            # Install lazygit (might not be in repo)
            if ! command -v lazygit > /dev/null 2>&1; then
                LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
                curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
                tar xf lazygit.tar.gz lazygit
                sudo install lazygit /usr/local/bin
                rm lazygit lazygit.tar.gz
            fi
            ;;
            
        *)
            print_message "red" "Unsupported distribution: $DISTRO"
            print_message "yellow" "Please install the following packages manually:"
            print_message "yellow" "- neovim"
            print_message "yellow" "- git"
            print_message "yellow" "- ripgrep"
            print_message "yellow" "- fd"
            print_message "yellow" "- gcc/make"
            print_message "yellow" "- python & pip"
            print_message "yellow" "- nodejs & npm"
            print_message "yellow" "- xclip (optional)"
            print_message "yellow" "- lazygit (optional)"
            return 1
            ;;
    esac
    
    print_message "green" "Neovim and dependencies installed successfully!"
    return 0
}

# Set up Neovim configuration
setup_config_dir() {
    print_message "yellow" "Setting up Neovim configuration..."
    
    # Backup existing configuration if it exists
    if [ -d ~/.config/nvim ]; then
        print_message "yellow" "Backing up existing Neovim configuration..."
        mv ~/.config/nvim ~/.config/nvim.bak.$(date +%Y%m%d%H%M%S)
        
        # Also backup data directories
        if [ -d ~/.local/share/nvim ]; then
            mv ~/.local/share/nvim ~/.local/share/nvim.bak.$(date +%Y%m%d%H%M%S)
        fi
        if [ -d ~/.local/state/nvim ]; then
            mv ~/.local/state/nvim ~/.local/state/nvim.bak.$(date +%Y%m%d%H%M%S)
        fi
        if [ -d ~/.cache/nvim ]; then
            mv ~/.cache/nvim ~/.cache/nvim.bak.$(date +%Y%m%d%H%M%S)
        fi
    fi
    
    # Create nvim config directory
    mkdir -p ~/.config/nvim
    
    # Get the script's directory path
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    
    # Copy/sync all configuration files to the nvim config directory
    rsync -av --exclude='.git' --exclude='.github' --exclude='setup.sh' --exclude='README.md' "$SCRIPT_DIR/" ~/.config/nvim/
    
    print_message "green" "Neovim configuration set up successfully!"
}

# Main execution
print_message "green" "Setting up Neovim..."

# Install dependencies
install_dependencies

# Set up configuration
setup_config_dir

print_message "green" "Neovim setup complete!"
print_message "yellow" "Start Neovim by running 'nvim'"
print_message "yellow" "On first run, plugins will be installed automatically."

exit 0