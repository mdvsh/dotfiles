#!/bin/bash
# ~/.dotfiles/install.sh
set -euo pipefail

DOTFILES_DIR="$HOME/.dotfiles"
CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

# Essential tools we need
BREW_PACKAGES=(
    fish
    exa
    bat
    fzf
    fd
    ripgrep
    git
    pyenv
    fnm
)

echo "🚀 Setting up your development environment..."

# Backup existing configs
backup_if_exists() {
    local file=$1
    if [ -e "$file" ]; then
        mkdir -p "$BACKUP_DIR/$(dirname "$file")"
        mv "$file" "$BACKUP_DIR/$file"
        echo "📦 Backed up $file"
    fi
}

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install essential packages
echo "📦 Installing essential packages..."
brew install ${BREW_PACKAGES[@]}

# Backup existing configs
echo "📦 Backing up existing configs..."
backup_if_exists "$HOME/.bash_profile"
backup_if_exists "$HOME/.bashrc"
backup_if_exists "$HOME/.profile"
backup_if_exists "$HOME/.zshrc"
backup_if_exists "$HOME/.zshenv"
backup_if_exists "$CONFIG_DIR/fish"

# Create necessary directories
echo "📁 Creating directory structure..."
mkdir -p "$CONFIG_DIR"
mkdir -p "$DOTFILES_DIR"/{fish/{conf.d,functions},git,tools}

# Symlink configurations
echo "🔗 Creating symlinks..."
ln -sf "$DOTFILES_DIR/fish" "$CONFIG_DIR/fish"
ln -sf "$DOTFILES_DIR/git/config" "$HOME/.gitconfig"

# Set up fish as default shell if it isn't already
if ! grep -q "$(which fish)" /etc/shells; then
    echo "🐠 Adding fish to /etc/shells..."
    echo "$(which fish)" | sudo tee -a /etc/shells
fi

if [ "$SHELL" != "$(which fish)" ]; then
    echo "🐠 Setting fish as default shell..."
    chsh -s "$(which fish)"
fi

echo "✨ Dotfiles setup complete!"