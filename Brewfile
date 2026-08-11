# Brewfile
#
# Install:  brew bundle install --file=~/.dotfiles/Brewfile
# Check:    brew bundle check --verbose --file=~/.dotfiles/Brewfile
# Prune:    brew bundle cleanup --file=~/.dotfiles/Brewfile
#
# Declarative and idempotent. Rerunning is safe.
#
# This file starts empty on purpose. A package earns a line here when its
# configuration lands in this repo and it is used. Anything installed on the
# machine but absent below is a candidate for removal, not an omission.

#--------------------------------------------------------------------
# Terminal
#--------------------------------------------------------------------

cask "ghostty"

# Supplies the Medium (weight 500) face that Ghostty's bundled JetBrains Mono
# lacks. Required by ghostty/config. Swap to font-jetbrains-mono-nerd-font if
# prompt icons break.
cask "font-jetbrains-mono"
