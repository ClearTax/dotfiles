#!/bin/bash
set -e  # Exit on error

echo "🔄 Updating package list..."
sudo apt update -y

echo "📦 Installing Python3, Pip3, and Git..."
sudo apt install -y python3 python3-pip git

echo "⚡ Installing Aider..."
pip3 install --user aider-chat

echo "🔧 Ensuring Aider is in PATH..."
mkdir -p ~/.local/bin
ln -s ~/.local/bin/aider ~/.local/bin/aider
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
export PATH="$HOME/.local/bin:$PATH"

echo "✅ Aider setup completed!"
source ~/.bashrc
