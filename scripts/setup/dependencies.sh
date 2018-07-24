# cd to tmp dir for downloads
cd /tmp

# ppa for compiling i3-gaps
sudo add-apt-repository ppa:aguignard/ppa -y
# ppa for up-to-date and 16.04-compatible rofi
sudo add-apt-repository ppa:jasonpleau/rofi -y

# Update existing packages from repositories
sudo apt-get update

# Get some of the initial dependencies
sudo apt-get install git feh lxappearance curl rofi i3lock i3blocks zsh fonts-fontawesome -y

# grab and install playerctl
PLAYERCTL_DEB_PKG_LINK="https://github.com/acrisci/playerctl/releases/download/v0.6.1/playerctl-0.6.1_amd64.deb"

# download it
wget $PLAYERCTL_DEB_PKG_LINK

# install it
sudo dpkg -i playerctl*.deb

# Dependencies for compiling i3-gaps
sudo apt-get install libxcb1-dev \
libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev \
libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev \
libxcb-randr0-dev libev-dev libxcb-cursor-dev \
libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev \
libxkbcommon-x11-dev autoconf libxcb-xrm-dev libxcb-xrm-dev -y

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
