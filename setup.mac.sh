#!/bin/bash

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install iterm2
brew cask install google-chrome
brew cask install spectacle
brew cask install visual-studio-code
brew cask install intellij-idea
brew cask install pycharm
brew cask install webstorm
brew cask install datagrip
brew cask install rider
brew cask install alfred
brew cask install docker

brew install bash-completion
brew install wget
brew install tree
brew install tmux
brew install neovim
brew install python
brew install fzf
brew install fd
brew install the_silver_searcher
brew install kubernetes-cli
brew install doctl
brew install awscli

brew cask install caskroom/versions/java8

brew install scala
brew install sbt

# vim-plug install
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

/usr/local/opt/fzf/install
