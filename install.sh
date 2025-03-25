#!/bin/bash

set -e  # Exit on error

echo "🚀 Setting up Aider in Codespaces..."

# Ensure ~/.local/bin exists
mkdir -p "$HOME/.local/bin"

# Install aider
echo "🔧 Installing Aider..."
pip3 install --user aider-chat

# Ensure ~/.local/bin is in PATH
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$HOME/.bashrc"; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
fi

# Reload shell settings
source "$HOME/.bashrc"

# Verify installation
if command -v aider &> /dev/null; then
    echo "✅ Aider installed successfully!"
else
    echo "❌ Aider installation failed!"
    exit 1
fi
