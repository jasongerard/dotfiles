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
brew cask install goland
brew cask install clion
brew cask install alfred
brew cask install docker
brew cask install spotify
brew cask install slack
brew cask install firefox
brew cask install evernote
brew cask install virtualbox
brew cask install omnigraffle
brew cask install postbox

brew install bash-completion
brew install wget
brew install tree
brew install tmux
brew install neovim
brew install go
brew install python
brew install node
brew install rust
brew install fzf
brew install fd
brew install the_silver_searcher
brew install kubernetes-cli
brew install doctl
brew install awscli
brew isntall jq
brew install reattach-to-user-namespace # needed for copy/paste/pbcopy to work in tmux/iterm

pip2 install neovim --upgrade
pip3 install neovim --upgrade

pip2 install sexpdata websocket-client

#brew install jenv

#brew cask install caskroom/versions/java8

#brew install scala
#brew install sbt

# vim-plug install
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

/usr/local/opt/fzf/install
