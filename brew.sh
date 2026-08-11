#!/usr/bin/env bash

# SUPERSEDED BY ./Brewfile. DO NOT RUN.
#
# Kept as a reference for what was once installed. Two reasons it no longer
# works: `brew cask install` was removed from Homebrew in December 2020, so
# every cask line below errors out; and `brew upgrade` with no argument
# upgrades every formula on the machine, which is not what a setup script
# should do.
#
# Use instead:  brew bundle install --file=~/.dotfiles/Brewfile

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
brew install 'fzy'

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

