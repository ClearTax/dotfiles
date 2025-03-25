#!/bin/bash
set -e  # Exit on error

echo "🔄 Updating package list..."
sudo apt update

echo "📦 Installing Python3, Pip3, and Git..."
sudo apt install -y python3 python3-pip git

echo "⚡ Verifying Pip3 installation..."
if ! command -v pip3 &> /dev/null; then
    echo "❌ Pip3 installation failed. Exiting..."
    exit 1
fi

echo "🛠 Installing Aider..."
pip3 install --user aider-chat

echo "🔎 Locating Aider installation..."
AIDER_PATH="$HOME/.local/bin/aider"

if [ ! -f "$AIDER_PATH" ]; then
    echo "❌ Aider installation failed. Exiting..."
    exit 1
fi

echo "🔧 Adding Aider to PATH..."
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc  # Apply changes immediately

echo "✅ Aider setup completed successfully!"
echo "🔄 Restart your terminal if Aider is not recognized."
