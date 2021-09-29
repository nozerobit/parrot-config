#!/bin/bash

###########################################
#---------------) Colors (----------------#
###########################################


end="\033[0m\e[0m"
yellow="\e[0;33m\033[1m"


###########################################
#--------------) Commands (---------------#
###########################################


# Update and Upgrade Safely
sudo apt update && sudo parrot-upgrade -y

# VMware Tools (Open Source Version)
sudo apt install open-vm-tools-desktop -y

# Network Tools
sudo apt install network-manager -y

# Tools
sudo apt install -y wmname manpages-dev cargo arandr scrub flameshot arc-theme tmux fzf ripgrep universal-ctags silversearcher-ag fd-find xclip xsel zsh zsh-autosuggestions zsh-syntax-highlighting feh bspwm sxhkd polybar rbenv htop lxappearance python3-pip rofi unclutter meson papirus-icon-theme imagemagick neovim ranger watchman joplin

# Dependencies
sudo apt install -y libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev
sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
sudo apt install -y python3-dev libssl-dev libffi-dev build-essential
sudo apt install -y libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev


# Iosevka Nerd Fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip
unzip Iosevka.zip
sudo mv *.ttf /usr/share/fonts
rm *.zip

sudo apt install meson -y

# Create swap
#dd if=/dev/zero of=/mnt/swapfile bs=4096 count=2097152
#chmod 600 /mnt/swapfile
#mkswap /mnt/swapfile
#swapon /mnt/swapfile

# Alacritty
git clone https://github.com/jwilm/alacritty
cd alacritty
cargo build --release && sudo cp target/release/alacritty /usr/local/bin
cd ..

# bspwm and sxhkd
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
cd bspwm && make && sudo make install
cd ../sxhkd && make && sudo make install
cd ..

# Picom
git clone https://github.com/yshui/picom
cd picom/
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

# Display Configuration
cd ~/parrot-config
cp .xinitrc ~/.xinitrc

# Powerlevel10K
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
# echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
cp .p10k.zsh ~/
cp .zshrc ~/
sudo cp -r zsh-plugins/zsh-autocomplete /usr/share/
# Add Powerlevel10K Root Shell
sudo cp -r ~/powerlevel10k/ /root
sudo cp .p10k.zsh /root

# Tmux Configuration
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
cd ~/parrot-config

# Tmux Configuration for root
sudo cp -r /home/$USER/.tmux /root
sudo ln -s -f /home/$USER/.tmux/.tmux.conf /root/.tmux.conf

# pip3
sudo pip3 install pywal
pip3 install pynvim
pip3 install --user --upgrade pynvim
pip3 install ueberzug
pip3 install pwntools

# pipx and crackmapexec
sudo apt-get install python3-venv
python3 -m pip install --user pipx
pipx ensurepath
sudo apt purge cme && pipx install crackmapexec --force

# Install lsd and bat
wget "https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_amd64.deb"
sudo dpkg -i "lsd_0.20.1_amd64.deb"
wget "https://github.com/sharkdp/bat/releases/download/v0.18.0/bat_0.18.0_amd64.deb"
sudo dpkg -i "bat_0.18.0_amd64.deb"

# zsh Insecure Shell Fix
sudo chown -R root:root /usr/local/share/zsh/site-functions/_bspc && sudo chmod -R 755 /usr/local/share/zsh/site-functions/_bspc

# Avoid Missing Java Dependencies and Tools like javac
sudo apt -y install default-jdk

# Install radare2
git clone https://github.com/radareorg/radare2
radare2/sys/install.sh

# Install AWS Tools / AWS-S3
sudo apt -y install awscli
pip3 install boto3 ansi2html detect-secrets

# Install Azure CLI
sudo apt -y install apt-transport-https azure-cli

# Install PowerShell
sudo apt -y install powershell

# Install GEF gdb plugin
cd ~
wget -O ~/.gdbinit-gef.py -q http://gef.blah.cat/py
echo source ~/.gdbinit-gef.py >> ~/.gdbinit

# Install Obsidian Debian Package
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v0.12.15/obsidian_0.12.15_amd64.deb
sudo dpkg -i obsidian_0.12.15_amd64.deb

# Install Obsidian.AppImage
#cd ~/kali-config
#wget https://github.com/obsidianmd/obsidian-releases/releases/download/v0.12.10/Obsidian-0.12.10.AppImage
#chmod u+x Obsidian-0.12.10.AppImage
#mkdir ~/appimages
#cp appimages/favicon-1.png ~/appimages
#cp Obsidian-0.12.10.AppImage ~/appimages
#mkdir -p ~/.local/share/applications
#cp Obsidian.desktop ~/.local/share/applications/

# Install Firefox Standard
#cd ~/kali-config
#sudo mkdir -p /usr/lib/firefox
#wget 'https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US' -O firefox.tar.bz2
#tar -xf firefox.tar.bz2
#sudo cp -r firefox/* /usr/lib/firefox
#sudo ln -s -f /usr/lib/firefox/firefox /usr/bin/firefox
#cp appimages/fire.png ~/appimages
#cp Firefox.desktop ~/.local/share/applications/

# Install Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https -y
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update && sudo apt-get install sublime-text -y

# Copy the Wallpapers to ~/Pictures
cp ~/parrot-config/wallpapers/* ~/Pictures

# Copy the Configuration Files
cp -r ~/parrot-config/.config ~/

# Execute Permissions
GRP=$(id -gn $USER)
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/bspwm_resize
chmod +x ~/.config/scripts/*.sh
chmod -R 755 ~/.config/polybar
sudo cp ~/parrot-config/scripts/changer /usr/local/bin/changer
sudo chown $USER:$GRP /usr/local/bin/changer
sudo chmod +x /usr/local/bin/changer
sudo cp ~/parrot-config/scripts/whichSystem /usr/local/bin/whichSystem
sudo chown $USER:$GRP /usr/local/bin/whichSystem
sudo chmod +x /usr/local/bin/whichSystem
sudo cp ~/parrot-config/scripts/border_rounded_or_sharp /usr/local/bin/border_rounded_or_sharp
sudo chown $USER:$GRP /usr/local/bin/border_rounded_or_sharp
sudo chmod +x /usr/local/bin/border_rounded_or_sharp

# Copy to /root
sudo cp -r ~/.config /root

# Zsh Symlink with root
sudo ln -s -f ~/.zshrc /root/.zshrc

# Nvim Symlink with vim
sudo ln /usr/bin/nvim /usr/bin/vim -sf

# xeventbind (Used for resolutions and reloading feh and wal)
cd ~/parrot-config
git clone https://github.com/ritave/xeventbind.git
cd xeventbind
make
sudo cp xeventbind /usr/local/bin
cd ..

# feh
cp ~/parrot-config/.fehbg ~/

# Allow Low-Priv Users to Capture Packets (this is because of rofi)
sudo dpkg-reconfigure wireshark-common

# Change Shell
sudo usermod --shell /usr/bin/zsh $USER
sudo usermod --shell /usr/bin/zsh root

# Fix Shell
sudo chown $USER:$USER /root
sudo chown $USER:$USER /root/.cache -R
sudo chown $USER:$USER /root/.local -R

# Fix Nmap SLOW
sudo apt purge opensnitch -y

# Install nodejs
curl -sL install-node.now.sh/lts | sudo zsh

###########################################
#--------------) End (---------------#
###########################################

cat << EOF
           _            _                         __ _
          (_)          (_)                       / _(_)
 __      _____  ___ __  _  ___    ___ ___  _ __ | |_ _  __ _
 \ \ /\ / / \ \/ / '_ \| |/ __|  / __/ _ \| '_ \|  _| |/ _  |
  \ V  V /| |>  <| | | | | (__  | (_| (_) | | | | | | | (_| |
   \_/\_/ |_/_/\_\_| |_|_|\___|  \___\___/|_| |_|_| |_|\__, |
                                                        __/ |
                                                       |___/
EOF

printf "\n$yellow[+] Done, don't forget to follow the next steps as documented in the file README.md\n"$end;
