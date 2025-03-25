# Run install.sh on every new Codespaces startup
if [ -f "$HOME/dotfiles/install.sh" ]; then
    bash "$HOME/dotfiles/install.sh"
fi
