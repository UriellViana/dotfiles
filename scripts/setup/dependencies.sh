# cd to tmp dir for downloads
cd /tmp

# ppa for up-to-date and 16.04-compatible rofi
sudo add-apt-repository ppa:jasonpleau/rofi -y

# Update existing packages from repositories
sudo apt-get update

PKG_LIST="git feh lxappearance curl rofi i3lock i3blocks zsh compton build-essential software-properties-common stow"
# Get some of the initial dependencies
for pkg in $PKG_LIST; do
  sudo apt-get install -y $pkg
done
PKG_LIST=""

# download it
wget $PLAYERCTL_DEB_PKG_LINK

# install it
sudo dpkg -i playerctl*.deb

# dependencies for compiling i3lock-color
PKG_LIST="libev-dev libxcb-composite0 libxcb-composite0-dev libxcb-xinerama0 libxcb-randr0 libxcb-xinerama0-dev libxcb-xkb-dev libxcb-image0-dev libxcb-util-dev libxkbcommon-x11-dev libjpeg-turbo8-dev libpam0g-dev"
for pkg in $PKG_LIST; do
  sudo apt-get install -y $pkg
done
PKG_LIST=""

# clone i3lock-color
rm -rf /tmp/i3lock-color
git clone https://github.com/PandorasFox/i3lock-color.git i3lock-color
cd i3lock-color

# compile & install
autoreconf -i && ./configure && make

# clone fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

# install fzf
~/.fzf/install

# enable it
source ~/.zshrc
