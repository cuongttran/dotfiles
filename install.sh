#!/bin/bash

BASE=$(pwd)

# install brew and tools{{{

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

# }}} End brew install

# shell config {{{

# install zimfw
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
ln -sf $BASE/zimrc ~/.zimrc

# use zsh as default shell
chsh -s $(which zsh)
ln -sf $BASE/zshrc ~/.zshrc

# }}} end shell config

# editor config {{{

# install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# vimrc
mv -v ~/.vimrc ~/.vimrc.old 2> /dev/null
ln -sf $BASE/vimrc ~/.vimrc

# nvim
mkdir -p ~/.config/nvim
ln -sf $BASE/vimrc ~/.config/nvim/init.vim
ln -sf $BASE/config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

# bat
ln -sf $BASE/config/bat/config ~/.config/bat/config 

# }}} end editor config

# windows config {{{

ln -sf $BASE/tmux.conf ~/.tmux.conf

ln -sf $BASE/alacritty.yml ~/.alacritty.yml

# end windows config
