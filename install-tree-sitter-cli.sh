#!/bin/bash

# Script to install the tree-sitter CLI for nvim-treesitter support

set -e  # Exit on error

echo "Installing tree-sitter CLI for nvim-treesitter..."

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "Error: npm is required but not found. Please install Node.js and npm first."
    exit 1
fi

# Install tree-sitter CLI globally
echo "Installing tree-sitter CLI via npm..."
npm install -g tree-sitter-cli

# Verify installation
if command -v tree-sitter &> /dev/null; then
    echo "✅ tree-sitter CLI installed successfully!"
    echo "Version: $(tree-sitter --version)"
    echo ""
    echo "The tree-sitter executable is now available for :TSInstallFromGrammar"
else
    echo "❌ Error: Installation failed or tree-sitter not in PATH"
    echo "Try running: export PATH=\"\$PATH:\$(npm root -g)/tree-sitter-cli/bin\""
    exit 1
fi

echo "You may need to restart Neovim for changes to take effect."
