# Ask for sudo pw beforehand
sudo -v

echo "[!] Installing dependencies.."
source ./scripts/setup/dependencies.sh

echo "[!] Creating symlinks"
source ./scripts/setup/symlinks.sh

# set zsh as default shell
chsh -s $(which zsh)

