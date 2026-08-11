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

## Tmux
Config lives at `~/.config/tmux/tmux.conf` (tmux 3.1+ reads XDG paths, so there is no `~/.tmux.conf`).

Needs _Tmux Plugin Manager_: `git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm` (see [TPM Docs](https://github.com/tmux-plugins/tpm)). Then press `prefix + I` to install the rest.

## What's included
- Neovim configuration
- Tmux configuration
- Bash alias
- Git alias

## Binaries
- *colorcheck* prints strips of colors to the the terminal to check if they are displayed correctly
- *tat* creates a tmux session with the name of the current directory, if a session named like the current directory already exists, it will attach to it.
