#!/bin/sh

# Install Oh My Zsh
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Homebrew
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Replace existing .zshrc with the .zshrc from .dotfiles/
rm -rf $HOME/.zshrc
ln -sw $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Backup existing .gitconfig if it exists
if [ -f "$HOME/.gitconfig" ]; then
    mv "$HOME/.gitconfig" "$HOME/.gitconfig.backup"
fi

# Tell Git to use the .gitconfig in .dotfiles/
cat > "$HOME/.gitconfig" << EOL
[include]
    path = ~/.dotfiles/.gitconfig
EOL

# Update Homebrew and install dependencies
brew update
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Set macOS defaults
source ./.macos