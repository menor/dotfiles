#!/bin/bash
############################
# .make.sh
# This script creates the needed symlinks from the home directory to dotfiles in ~/.dotfiles
############################

########## Variables

dotdir=~/.dotfiles
configdir=~/.config
preztodir="${dotdir}/prezto"

########## ZSH

# .zshenv needs to be on the root since then we load everything from there
ln -sv ${preztodir}/runcoms/zshenv ~/.zshenv 

# move .zsh dotfiles into .config
mkdir ${configdir}/zsh

# zsh files we need to link
zshfiles="zlogin zlogout zpreztorc zprofile zshrc"

ln -sv ${preztodir}/init.zsh ${configdir}/zsh

for file in $zshfiles; do
    ln -sv ${preztodir}/runcoms/$file ${configdir}/zsh/.$file
done

# also link the modules directory
ln -sv ${preztodir}/modules ${configdir}/zsh

########## ZSH (Vanilla instalation with no prezto)

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

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


########## VOLTA
# volta.sh is a version manager for node
curl https://get.volta.sh | bash -s -- --skip-setup
