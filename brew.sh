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
brew 'git'
brew 'ripgrep'
brew 'gist'

