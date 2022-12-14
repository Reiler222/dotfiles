#!/bin/bash

#Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Check for architecture
if [ $(uname -m) == 'arm64' ]
then
eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew bundle install --file ./Brewfile

brew tap homebrew/cask-fonts && brew install --cask font-hack-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-fira-mono-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-jetbrains-mono-nerd-font

# Configure iTerm2 profile
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Install zsh-autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Install Syntax Highlighter
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.zsh/fast-syntax-highlighting

# Install completion
cd ~/.zsh && wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/completion.zsh

# Configure profile
dir=~/dotfiles
files=".zshrc .gitconfig"

# Create a dir to move the configuration files there
cd $dir

for file in $files; do
    echo "Creating symlink to $file in home directory."
    [ -e ~/$file ] && rm ~/$file
    ln -s $dir/$file ~/$file
done

# Change MacOS configuration
source .macos