#!/bin/bash

# Install command-line tools using Homebrew.
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

brew install fx fd jq ctags fzf ripgrep 
brew install zsh tmux neovim htop 
brew install git go java11 python@3.8 
brew install mysql kafka zookeeper redis wrk
brew cask install alacritty

# Remove outdated versions from the cellar.
brew cleanup
