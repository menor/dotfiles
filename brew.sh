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
brew install 'gist'
brew install 'z'

# Install improved versions of system utils
brew install 'ctags'

# A cat(1) clone with syntax highlighting and Git integration.
brew install 'bat'

# Helps to pick paths out of bash
brew install 'fpp'


# Casks
brew cask '1password'
brew cask 'alfred'
brew cask 'anki'
brew cask 'appcleaner'
brew cask 'brave-browser'
brew cask 'calibre'
brew cask 'canary'
brew cask 'deepl'
brew cask 'docker'
brew cask 'drawio'
brew cask 'dropbox'
brew cask 'fantastical'
brew cask 'firefox'
brew cask 'flux'
brew cask 'google-chrome'
brew cask 'imageoptim'
brew cask 'insomnia'
brew cask 'iterm2'
brew cask 'karabiner-elements'
brew cask 'keka'
brew cask 'kekadefaultapp' # Helper to make keka default uncompressinf
brew cask 'keybase'
brew cask 'macdown'
brew cask 'mark-text'
brew cask 'moom'
brew cask 'mullvadvpn'
brew cask 'omnidisksweeper'
brew cask 'oversight'
brew cask 'pdf-expert'
brew cask 'sip'
brew cask 'soulseek'
brew cask 'spotify'
brew cask 'sublime-text'
brew cask 'telegram'
brew cask 'transmit'
brew cask 'tripmode'
brew cask 'tunnelblick'
brew cask 'visual-studio-code'
brew cask 'vlc'
brew cask 'vox'
brew cask 'whatsapp'
brew cask 'wire'
brew cask 'xld'

# Install manually
# Affinity designer
# BeFocused Pro
# Firefox developer edition
# Chrome Canary
# Klib 
# Reeder
# The Archive
# The Tagger
# Things
# Tunefab spotify music converter
