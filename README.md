My configuration files, they use [this script](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/).  
To track new files:
- Add them to the files variable in makesymlinks.sh
- Run the script (this script creates symlinks to the dotfiles in the home directory)



Prezto is included as a submodule, to we need to create symlinks from that folder to the main zsh dir to do that run this:

```
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/dotfiles/prezto/runcoms/^README.md(.N); do
ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```
