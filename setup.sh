#!/bin/bash

# Backup the original .zshrc file
if [ -f "$HOME/.zshrc" ]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
    echo "Original .zshrc backed up to .zshrc.bak"
fi

# Install Homebrew if not installed
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Install iTerm2
echo "Installing iTerm2..."
brew install --cask iterm2

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh is already installed."
fi

# Download .zshrc from GitHub and replace the current one
echo "Downloading .zshrc from GitHub..."
curl -Ls https://raw.githubusercontent.com/CreativDesigner/dotfiles/main/.zshrc -o ~/.zshrc

# Install Powerline Fonts
echo "Installing Powerline Fonts..."
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Install Halcyon iTerm2 theme
echo "Installing Halcyon Theme for iTerm2..."
curl -Ls https://github.com/bchiang7/halcyon-iterm/raw/master/halcyon.itermcolors -o ~/Downloads/halcyon.itermcolors

echo ""

echo "Halcyon Theme downloaded to ~/Downloads/halcyon.itermcolors. Please manually import and set it in iTerm2."
echo "Please manually set the font to a Powerline font in iTerm2."

echo ""

echo "Setup completed!"