# Introduction

This is my ParrotOS configuration. I have decided to publish it for everyone out there, feel free to use it and optimize it to your liking. :)

Tested in:
`ParrotOS 4.11 MATE` with **4 GB** of RAM.

# Overview

![changer](media/changer.gif)

This is the outcome of my dotfiles configuration. 

> note: This is a highly compressed gif that's why the bitrate is so low.

# Installation

I recommend having 4 GB of RAM or more because alacritty takes quite an amount of memory when compiling/building it. I installed this from the home folder at `/home/kali/kali-config` location.

![image](https://user-images.githubusercontent.com/83516002/125367032-e7334b80-e366-11eb-8935-fbd634bb0b84.png)

Make sure to disable sleep because the script can take a while to finish doing it's stuff. This is **optional** but recommended.

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

![slim](media/slim.png)

Choose slim as the default login manager.

![nodejs](media/nodejs-prompt.png)

When prompted here type `y` for yes. This will install node.js which is needed for the coc plugin in neovim.

3. Reboot the machine

```bash
reboot
```

![bspwm-login](media/bspwm-login.png)

Once you have rebooted the machine, select bspwm as the window manager and then login.

# Next Steps

If you want to know how it works or if you want to configure the settings to your own liking, continue reading the next sections.

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

`picom` Transparency Configuration

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

