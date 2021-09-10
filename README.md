# Introduction

This is my ParrotOS configuration. I have decided to publish it for everyone out there, feel free to use it and optimize it to your liking. :)

Tested in:
`ParrotOS 4.11.2 MATE Security Edition` with **4 GB** of RAM and **60 GB** of Storage Space.

ISO Name:
Parrot-security-4.11.2_amd64.iso

# Installation

I recommend having 4 GB of RAM or more because alacritty takes quite an amount of memory when compiling/building it. I installed this from the home folder at `~/parrot-config` location.

![image](https://user-images.githubusercontent.com/83516002/125367032-e7334b80-e366-11eb-8935-fbd634bb0b84.png)

This is **optional** but recommended.

1. Clone this repo and change the directory

```bash
cd ~ && git clone https://github.com/wixnic/parrot-config.git && cd parrot-config
```

> IMPORTANT: Clone this in the home folder, otherwise modify the script and change some directories in the script,

2. Run the script

```bash
./install.sh
```

The installation can take a while because it downloads a lot of things. The time that it takes to finish will depend mostly on your internet download bandwidth provided by your ISP.

![image](https://user-images.githubusercontent.com/83516002/132793893-6c7e935e-27a7-4c17-8b08-325621ee961b.png)

![image](https://user-images.githubusercontent.com/83516002/125377441-81ea5500-e37c-11eb-88ab-ff1919ec9aa1.png)

When prompted here type `y` for yes. This will install node.js which is needed for the coc plugin in neovim.

3. Reboot the machine

```bash
reboot
```

![image](https://user-images.githubusercontent.com/83516002/132793863-3fbb2e85-7f67-4058-93f7-ec30f1e36528.png)


Once you have rebooted the machine, select bspwm as you desktop environment, enter your credentials and then login.



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

![image](https://user-images.githubusercontent.com/83516002/132793338-7e3140c6-bef1-4292-abb9-460e89e1f7c9.png)

Open the MATE-terminal with rofi using Windows + D and search for `MATE-terminal`, press the Enter key and type this in the terminal:

```
cd ~/parrot-config/alacritty && cargo build --release && sudo cp target/release/alacritty /usr/local/bin
```

This is the output that you should see if alacritty compiles correctly:

![image](https://user-images.githubusercontent.com/83516002/132793536-3207d020-2dbd-4d8f-813f-a9fabf88ed5e.png)

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

### Special sxhkd Shortcuts

Windows + Alt + W: Shuffle through wallpapers with pywal (This will change all the colors according to the wallpaper). ✨

Print: Take a screenshot with `flameshot`.

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

