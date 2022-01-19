#!/usr/bin/env bash

# Install command-line tools using Homebrew.
# 'Heavily influenced' by https://github.com/mathiasbynens/dotfiles/blob/master/brew.sh

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install basic utilities
brew install 'git'
brew install 'ripgrep'
brew install 'fd'
brew install 'gist'
brew install 'z'
brew install 'diff-so-fancy'
brew install 'neovim'
brew install 'tmux'
brew install 'tree'
brew install 'fzf'

# fzf keybindings
$(brew --prefix)/opt/fzf/install

# Install improved versions of system utils
brew install 'ctags'

# A cat(1) clone with syntax highlighting and Git integration.
brew install 'bat'

# Helps to pick paths out of bash
brew install 'fpp'


# Casks
#####################################

brew cask install 'karabiner-elements'
brew cask install 'iterm2'

brew cask install 'alfred'
brew cask install 'deepl'
brew cask install 'dropbox'
brew cask install 'flux'
brew cask install 'keka'
brew cask install 'kekadefaultapp'
brew cask install 'moom'
brew cask install 'mullvadvpn'
brew cask install 'oversight'
brew cask install 'sip'

brew cask install 'brave-browser'
brew cask install 'firefox'
brew cask install 'transmit'

brew cask install 'telegram'

brew cask install 'plexamp'
brew cask install 'vox'
brew cask install 'vlc'
brew cask install 'soulseek'

brew cask install 'anki'
brew cask install 'calibre'
brew cask install 'fantastical'

