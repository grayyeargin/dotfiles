#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Update brew
brew update

# Initial installs
# brew install git
brew install --cask visual-studio-code
brew install nvm

# Setup nvm
export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
source $(brew --prefix nvm)/nvm.sh
nvm install node
nvm use node

echo "Setup complete! 🎉"