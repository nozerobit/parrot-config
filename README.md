# Introduction

This is my ParrotOS configuration. I have decided to publish it for everyone out there, feel free to use it and optimize it to your liking. :)

Tested in:
`ParrotOS 4.11.2 MATE Security Edition` with **4 GB** of RAM and **40 GB** of Disk Space.

ISO Name:
Parrot-security-4.11.2_amd64.iso

# Overview

https://user-images.githubusercontent.com/83516002/125391826-a3efd180-e394-11eb-87ca-02253bc0cf6b.mp4

This is the outcome of my dotfiles configuration. 

> note: This is a highly compressed video that's why the bitrate is so low.

# Installation

I recommend having 4 GB of RAM or more because alacritty takes quite an amount of memory when compiling/building it. I installed this from the home folder at `~/parrot-config` location.

![image](https://user-images.githubusercontent.com/83516002/125367032-e7334b80-e366-11eb-8935-fbd634bb0b84.png)

This is **optional** but recommended.

1. Clone this repo and change the directory

```bash
cd ~ && git clone https://github.com/wixnic/parrot-config.git && cd parrot-config
```

> IMPORTANT: cd ~ (clone this in the home folder, otherwise modify the script and change some directories in the script)

2. Run the script

```bash
./install.sh
```

The installation can take a while because it downloads a lot of things, especially because of the nerd-fonts. The time that it takes to finish will depend mostly on your internet download bandwidth provided by your ISP.

![image](https://user-images.githubusercontent.com/83516002/125388435-004ff280-e38f-11eb-92a9-4d7c0fe9bf01.png)

![image](https://user-images.githubusercontent.com/83516002/125376924-89f5c500-e37b-11eb-878b-894d2c79b80f.png)

![image](https://user-images.githubusercontent.com/83516002/125388480-13fb5900-e38f-11eb-98d5-1ecc5b0e645f.png)

Choose slim as the default login manager.

![image](https://user-images.githubusercontent.com/83516002/125377441-81ea5500-e37c-11eb-88ab-ff1919ec9aa1.png)

When prompted here type `y` for yes. This will install node.js which is needed for the coc plugin in neovim.

3. Reboot the machine

```bash
reboot
```

![image](https://user-images.githubusercontent.com/83516002/125377817-279dc400-e37d-11eb-9769-31cf3aaa5588.png)

Once you have rebooted the machine, enter your credentials and then login.

4. Open zsh with Windows + Enter

![image](https://user-images.githubusercontent.com/83516002/125389017-10b49d00-e390-11eb-9365-66a040522cac.png)

Wait for powerlevel10K, this is done very quickly.

![image](https://user-images.githubusercontent.com/83516002/125377681-f1604480-e37c-11eb-90a2-04cb418a9c7a.png)

To fix this error just do Windows + Alt + W. This will execute the `changer` script which changes your environment.

After generating wal cache files, create a Symlink to the root directory for the `root` user this will share the cache.

```
sudo ln -s /home/wixnic/.cache/wal /root/.cache/wal
```

# Possible Alacritty Error - This may not apply to everyone

If you press Windows + Enter and nothing is happening, then most likely Alacritty failed to compile but you can fix it easily by doing this:

![image](https://user-images.githubusercontent.com/83516002/125389659-18c10c80-e391-11eb-8f07-4167838aa91f.png)

Open the gnome-terminal with rofi using Windows + D and search for `gnome-terminal`, press the Enter key and type this in the terminal:

```
cd ~/parrot-config/alacritty && cargo build --release && sudo cp target/release/alacritty /usr/local/bin
```

If it fails then you can try increasing the RAM or creating swap partition as follows:


Create the swap space
```
dd if=/dev/zero of=/mnt/swapfile bs=4096 count=2097152
```
Assign the right permissions.
```
chmod 600 /mnt/swapfile
```
After defining our partition, we need to format it for "swap mode" so run mkswap command on the newly created swap partition. Make sure to choose the correct partition number which you need to enable swap.
```
mkswap /mnt/swapfile
```
Enable swap 
```
swapon /mnt/swapfile
```
Now try to compile alacritty again.

More info here: https://github.com/alacritty/alacritty/blob/master/INSTALL.md

# Next Steps

If you want to know how it works or if you want to configure the settings to your own liking, continue reading the next sections.

## Full Screen Fix

User Windows + Alt + R to fix the polybar when changing screen resolution.

## Configuration Files Locations After Installation

If you which to change some settings, here are the locations of the configuration files.

`alacritty` Terminal Configuration

```shell
~/.config/alacritty/alacritty.yml
```

`bspwm` WM Configuration

```shell
~/.config/bspwm/bspwmrc
```

`sxhkd` Keyboard Shortcuts Configuration

```shell
~/.config/sxhkd/sxhkdrc
```

`picom` Transparency Configuration (Using compton instead for stability)

```shell
~/.config/picom/picom.conf
```

`nvim` Terminal Text Editor Configuration

```shell
~/.config/nvim/init.vim
```

`polybar` Workspace and Desktop Panel Configuration

```shell
~/.config/polybar/colorblocks/launch.sh
```

`rofi` Program Launcher Configuration

```shell
~/.config/rofi/config
```

`zsh` Shell Configuration

```shell
~/.zshrc
```

## sxhkd shortcuts

Windows + Enter : Open the terminal-emulator (alacritty).

Windows + W : Close the current window.

Windows + Alt + R : Restart the bspwm configuration.

Windows + Alt + Q : Logout.

Windows + (⬆⬅⬇➡) : Move through the windows in the current workspace.

Windows + D : Open Rofi and Esc to exit.

Windows + (1,2,3,4,5,6,7,8,9) : Change the workspace.

Windows + T : Change current window to "terminal" (normal) mode. It helps us when the window is in full or floating screen mode.

Windows + M : Change the current window to "full" mode. Press the same keys to return to "terminal" (normal) mode.

Windows + F : Change the current window to full screen mode (it occupies everything including the polybar).

Windows + S : Change the current window to "floating" mode.

Windows + Alt + (1,2,3,4,5,6,7,8,9) : Move the current window to another workspace.

Windows + Alt + (⬆⬅⬇➡) : Resize current window (only works if you are in terminal or floating mode).

Windows + Ctrl + (⬆⬅⬇➡) : Change the position of the current window (only works in floating mode).

Windows + Ctrl + Alt + (⬆⬅⬇➡) : Show a preselection and then open a window (a terminal, firefox, a file, etc.).

Windows + Ctrl + Space: Undo the preselection.

> Note that when we refer to the Windows key, it may change depending on the selected pointer \ _modifier, found in the file ~/.config/bspwm/bspwmrc

### Special sxhkd Shortcuts

Windows + Alt + W: Shuffle through wallpapers with pywal (This will change all the colors according to the wallpaper). ✨

Print: Take a screenshot with `flameshot`.

## lxappearance | Customize Look and Feel

Launch `lxappearance` a.k.a Customize Look and Feel with rofi (Windows + D).

![lxappearance theme](media/lxappearance-widget.png)

Change the theme to `Arc-Dark`.

![lxapperance icon](media/lxappearance-icontheme.png)

Change the icon to `Papirus-Dark`.

## Ristretto Image Viewer

![Ristretto](media/pictures.png)

Open the `Thunar File Manager` which you can launch with `rofi`, the shortcut for rofi is `Windows + D`, once you are in Thunar, navigate to the Pictures directory. Right click on a picture, a nice comfortable image viewer is  `ristretto`, which I recommend using.

# Picom Configuration

If you want to add transparency to an application you should use the `xprop WM_CLASS` command and select the windows/application that you want to apply transparency on, once you click with the cursor on that application you will get the output of the name, copy that name and added it to your `~/.config/picom/picom.conf` file.

Example:

```shell-session
opacity-rule = [
        "95:class_g = 'Alacritty'",
        "99:class_g = 'Code'",
        "99:class_g = 'Sublime_text'"
        "85:class_g = 'YOUR_APPLICATION_NAME'"
];
```

# Neovim

Run this commands as your `user` and as the `root` user to correctly install/update the neovim plugins.

```bash
nvim
```

1. Inside nvim, press the `:` (colon key) and type the following:

```shell
:PlugUpdate
```

2. Check Health

```shell
:checkhealth
```

3. coc Intellisense

```shell
:CocInstall coc-json coc-tsserver coc-python coc-snippets coc-vimlsp
```

4. Search

```shell
:FZF
:Rg
:BLines
:Lines
```

## nvim health check

![nvim checkhealth](media/nvim-checkhealth.png)

In nvim you can perform a health check if there are any errors with some plugins.

# Neovim Shortcuts
```vim
" Navigation
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use **alt** which is M + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" I hate escape more than anything else, quick and dirty Escape
inoremap jk <Esc>
inoremap kj <Esc>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da
```
## Do you want more coc extensions for nvim?

Check out coc extensions here: https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions

## Do you want more themes for nvim?

Check out this repo: https://github.com/rafi/awesome-vim-colorschemes 

## Do you want to configure coc.nvim?

Check out this wiki: https://github.com/neoclide/coc.nvim/wiki/Using-the-configuration-file

# Errors

If you're getting errors with compiling alacritty then increase the RAM or create a swap partition.

# References

If you want learn more about it, check out this repos.

Configurations:
- https://github.com/baskerville/bspwm
- https://github.com/baskerville/sxhkd
- https://github.com/jwilm/alacritty 
- https://github.com/ibhagwan/picom.git
- https://github.com/VaughnValle/blue-sky.git
- https://github.com/davatorium/rofi
- https://github.com/ohmyzsh/ohmyzsh
- https://github.com/gpakosz/.tmux.git

Fonts:
- https://github.com/ryanoasis/nerd-fonts.git

nvim Plugins:
- https://github.com/sheerun/vim-polyglot
- https://github.com/jiangmiao/auto-pairs
- https://github.com/joshdick/onedark.vim
- https://github.com/neoclide/coc.nvim
- https://github.com/vim-airline/vim-airline
- https://github.com/vim-airline/vim-airline-themes
- https://github.com/kevinhwang91/rnvimr
- https://github.com/liuchengxu/vim-which-key
- https://github.com/junegunn/fzf
- https://github.com/airblade/vim-rooter

