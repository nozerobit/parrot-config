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

# Tools
sudo apt install -y wmname manpages-dev cargo arandr scrub flameshot arc-theme tmux fzf ripgrep universal-ctags silversearcher-ag fd-find xclip xsel zsh zsh-autosuggestions zsh-syntax-highlighting feh bspwm sxhkd rbenv htop lxappearance python3-pip rofi unclutter papirus-icon-theme imagemagick neovim ranger watchman joplin

# Dependencies
sudo apt install -y build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev
sudo apt install -y meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev  libpcre2-dev  libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev
sudo apt install -y libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev
sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
sudo apt install -y python3-dev libssl-dev libffi-dev build-essential

# Iosevka Nerd Fonts
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh
cd ~/parrot-dotfiles

# Alacritty 
git clone https://github.com/jwilm/alacritty
cd alacritty
cargo build --release && sudo cp target/release/alacritty /usr/local/bin
cd ~/parrot-dotfiles

# bspwm and sxhkd
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
cd bspwm && make && sudo make install
cd ../sxhkd && make && sudo make install
cd ~/parrot-dotfiles

# Picom
git clone https://github.com/ibhagwan/picom.git
cd picom/
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd ~/parrot-dotfiles

# Blue Sky Polybar Theme
git clone https://github.com/VaughnValle/blue-sky.git

mkdir ~/.config/polybar
cd blue-sky/polybar/
cp * -r ~/.config/polybar
cd fonts
sudo cp * /usr/share/fonts/truetype/
fc-cache -v
cd ~/parrot-dotfiles

# Display Configuration
cp .xinitrc ~/.xinitrc

# Powerlevel10K
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
#echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
cp .p10k.zsh ~/
cp .zshrc ~/
sudo cp .p10k.zsh /root

# Tmux Configuration
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
cd ~/parrot-dotfiles

# Slim and Slimlock
sudo apt update && sudo apt install slim libpam0g-dev libxrandr-dev libfreetype6-dev libimlib2-dev libxft-dev
git clone https://github.com/joelburget/slimlock.git
cd slimlock/
sudo make
sudo make install

cd ../blue-sky/slim
sudo cp slim.conf /etc/
sudo cp slimlock.conf /etc
sudo cp -r default /usr/share/slim/themes

# pip3
sudo pip3 install pywal
pip3 install pynvim
pip3 install --user --upgrade pynvim 
pip3 install ueberzug
pip3 install pwntools

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

# Copy the Wallpapers to ~/Pictures
cp ~/parrot-dotfiles/wallpapers/* ~/Pictures

# Copy the Configuration Files
cp -r ~/parrot-dotfiles/.config ~/

# Execute Permissions
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/bspwm_resize
chmod +x ~/.config/scripts/*.sh
chmod -R 755 ~/.config/polybar
sudo cp ~/parrot-dotfiles/scripts/changer /usr/local/bin/changer
sudo chown $USER:$USER /usr/local/bin/changer
sudo chmod +x /usr/local/bin/changer

# Copy the Configuration files to /root
sudo cp -r ~/.config /root

# Zsh Symlink with root
sudo ln -s -f ~/.zshrc /root/.zshrc

# Change Shell
sudo usermod --shell /usr/bin/zsh $USER
sudo usermod --shell /usr/bin/zsh root

# Fix Shell
sudo chown $USER:$USER /root
sudo chown $USER:$USER /root/.cache -R
sudo chown $USER:$USER /root/.local -R

# Install nodejs
curl -sL install-node.now.sh/lts | sudo zsh

printf "\n$yellow[+] Done, don't forget to follow the next steps as documented in the file README.md\n"$end;
