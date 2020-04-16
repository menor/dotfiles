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

########## GIT
ln -sv ${dotdir}/git ${configdir}

########## KARABINER
# This should run after karabiner installation sinc eit depends on the directory
# being there, keep this in mind when creating the brew install file
ln -sfv ${dotdir}/karabiner.json ${configdir}/karabiner