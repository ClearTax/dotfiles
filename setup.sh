#!/bin/bash
set -e  # Exit on error

echo "🔄 Updating package list..."
sudo apt update -y

echo "📦 Installing Python3, Pip3, and Git..."
sudo apt install -y python3 python3-pip git

echo "⚡ Verifying Pip3 installation..."
if ! command -v pip3 &> /dev/null; then
    echo "❌ Pip3 installation failed. Exiting..."
    exit 1
fi

echo "🛠 Installing Aider (if not already installed)..."
if ! command -v aider &> /dev/null; then
    pip3 install --user aider-chat
else
    echo "✅ Aider is already installed."
fi

echo "🔧 Ensuring Aider is in PATH..."
AIDER_PATH="$HOME/.local/bin/aider"
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    export PATH="$HOME/.local/bin:$PATH"
fi

echo "✅ Aider setup completed successfully!"

# ✅ Auto-start Aider only in interactive shells
if [[ $- == *i* ]]; then
    echo "🚀 Launching Aider..."
    aider
fi
