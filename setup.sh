#!/bin/bash
############################
# .make.sh
# This script creates the needed symlinks from the home directory to dotfiles in ~/.dotfiles
############################

########## Variables

dotdir=~/.dotfiles
configdir=~/.config

########## ZSH
# One file, no framework and no plugin manager. zsh reads ~/.zshrc on its own,
# so this is the only link needed.
ln -sv ${dotdir}/zsh/zshrc ~/.zshrc

# The pure prompt and zsh-autosuggestions are git submodules under
# zsh/plugins/. zshrc sources them by path, so they must exist before the
# first interactive shell.
git -C ${dotdir} submodule update --init --recursive

########## GIT
ln -sv ${dotdir}/git ${configdir}

########## GHOSTTY
# Links the whole directory, so config and README travel together
ln -sv ${dotdir}/ghostty ${configdir}

########## TMUX
# tmux 3.1+ reads $XDG_CONFIG_HOME/tmux/tmux.conf, so no dotfile at $HOME.
# Only the config is linked, not the directory: tpm clones plugins alongside
# it and those do not belong in this repo.
mkdir -p ${configdir}/tmux
ln -sv ${dotdir}/tmux/tmux.conf ${configdir}/tmux/tmux.conf

# Clone the plugin manager. Everything else installs from inside tmux with
# `prefix + I`.
git clone https://github.com/tmux-plugins/tpm ${configdir}/tmux/plugins/tpm

########## NEOVIM
mkdir ${configdir}/nvim
ln -sv ${dotdir}/nvim/init.vim ${configdir}/nvim/init.vim
ln -sv ${dotdir}/nvim/plugins.vim ${configdir}/nvim/plugins.vim

########## KARABINER
# This should run after karabiner installation since it depends on the directory
# being there, keep this in mind when creating the brew install file
ln -sfv ${dotdir}/karabiner/karabiner.json ${configdir}/karabiner

########## BAT
mkdir ${configdir}/bat
ln -sv ${dotdir}/bat/config ${configdir}/bat/config

########## OSX
# Key speeds
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 2         # normal minimum is 3 (30 ms)


########## NODE
# fnm is the node version manager, installed from the Brewfile. zshrc evals
# `fnm env --use-on-cd`, so nothing to link here.
