# cd to tmp dir for downloads
cd /tmp

# ppa for compiling i3-gaps
sudo add-apt-repository ppa:aguignard/ppa -y
# ppa for up-to-date and 16.04-compatible rofi
sudo add-apt-repository ppa:jasonpleau/rofi -y
# ppa for neofetch
sudo add-apt-repository ppa:dawidd0811/neofetch -y
# ppa for fish shell
sudo apt-add-repository ppa:fish-shell/release-3 -y

# Update existing packages from repositories
sudo apt-get update

PKG_LIST="fish git feh lxappearance curl rofi i3lock i3blocks zsh compton build-essential software-properties-common neofetch stow"
# Get some of the initial dependencies
for pkg in $PKG_LIST; do
  sudo apt-get install -y $pkg
done
PKG_LIST=""

# download it
wget $PLAYERCTL_DEB_PKG_LINK

# install it
sudo dpkg -i playerctl*.deb

# Dependencies for compiling i3-gaps
PKG_LIST="libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm-dev libxcb-xrm-dev"
for pkg in $PKG_LIST; do
  sudo apt-get install -y $pkg
done
PKG_LIST=""

# dependencies for compiling i3lock-color
PKG_LIST="libev-dev libxcb-composite0 libxcb-composite0-dev libxcb-xinerama0 libxcb-randr0 libxcb-xinerama0-dev libxcb-xkb-dev libxcb-image0-dev libxcb-util-dev libxkbcommon-x11-dev libjpeg-turbo8-dev libpam0g-dev"
for pkg in $PKG_LIST; do
  sudo apt-get install -y $pkg
done
PKG_LIST=""

# clone i3-gaps source
rm -rf /tmp/i3-gaps
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

# return to tmp
cd /tmp

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
