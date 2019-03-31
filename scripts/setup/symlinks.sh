# cd into our dotfiles dir
cd "$HOME/dotfiles"

# attempt to stow adopting files
stow home --adopt

# reset changes made by adopting
git reset --hard

# now we can stow things!
stow home -R