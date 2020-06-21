# cd to tmp dir for downloads
echo "[!] Entering /tmp"
cd /tmp

# ppa for regolith
echo "[!] Adding new repositories"
sudo add-apt-repository -y ppa:regolith-linux/release > /dev/null 2>&1

# update repositories
echo "[!] Updating current repositores"
sudo apt update -y > /dev/null 2>&1

# install base packages
echo "[!] Installing base packages"
sudo apt install -y vim git regolith-desktop i3xrocks-net-traffic i3xrocks-cpu-usage i3xrocks-time i3xrocks-battery > /dev/null 2>&1
