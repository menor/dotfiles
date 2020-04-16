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
ln -s ${preztodir}/runcoms/zshenv ~/.zshenv 

# move .zsh dotfiles into .config
mkdir ${configdir}/zsh

# zsh files we need to link
zshfiles="zlogin zlogout zpreztorc zprofile zshrc"

ln -s ${preztodir}/init.zsh ${configdir}/zsh/

for file in $zshfiles; do
    echo "Creating symlink to ${file} in .config/zsh directory."
    ln -s ${preztodir}/runcoms/$file ${configdir}/zsh/.$file
done

# also link the modules directory
ln -s ${preztodir}/modules ${configdir}/zsh

########## GIT
ln -s ${dotdir}/git ${configdir}/git

########## KARABINER
# This should run after karabiner installation sinc eit depends on the directory
# being there, keep this in mind when creating the brew install file
ln -s ${dotdir}/karabiner.json ${configdir}/karabiner