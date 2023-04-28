<!--toc:start-->

- [Before Install](#before-install)
  - [Fast Recovery](#fast-recovery)
  - [Manual Recovery](#manual-recovery)
    - [Priority](#priority)
    - [Start](#start)
    - [Graphics](#graphics)
      - [install graphics](#install-graphics)
      - [check nvidia](#check-nvidia)
    - [Neovim](#neovim)
    - [Explanation About The Packages](#explanation-about-the-packages)
      - [ssh](#ssh)
      - [bluetooth](#bluetooth)
      - [pacman](#pacman)
      - [thunar](#thunar)
      - [waybar](#waybar)
      - [group](#group)
      - [mpd](#mpd)
      - [light](#light)
- [Install](#install)
- [More things](#more-things)
<!--toc:end-->

# Before Install

This is my own `wayfire` and `hyprland` based dotfiles.
So make sure you have at least skimmed throuth my
[installation process](https://github.com/ausosawx/archlinux-docs)
to see if satisfying some basic requirements.

## Fast Recovery

In the `./pkglist/scripts/` there is a `install.sh` script,which can help you complele
most of the work.

So just clone the repo somewhere and run the `install.sh`.**But I still recommend
finishing [Priority](#priority) first**,because a `good network`
is needed.You know what I mean.

Wait for it to end.

**Remember there is still something else you may need or want to set.**

- [check nvidia](#check-nvidia)
- [set ssh](#ssh)
- [set pacman](#pacman)
- [waybar](#waybar)

## Manual Recovery

### Priority

Suppose you have just finished the basic installation and now in the tty.

I recommand installing `paru` first as it can directly install packages from `AUR` and more conveniently.

```bash
sudo pacman -S paru-git
```

It is better to operate in a graphical interface(`wayfire` or `hyprland` for me).So let's do it now.

Install a terminal.

```bash
paru -S kitty
```

Install `wayfire`

```bash
paru -S wayfire-lily-git # It is more stable than wayfire-git from archlinuxcn
```

Before entering `wayfire`, you must change the default terminal as `wayfire` use `alacritty`.

```bash
mkdir ~/.config
cp /usr/share/wayfire.ini ~/.config/
```

Now you can type `wayfire` in `tty` to enter! Then you can install all the packages needed.

Before installing everything, I recommend setting up `proxy` first as some packages need `scientific network`.`clash` is a good option.

```bash
paru -S clash-verge
paru -S clash-meta

# tun mode need some rights
sudo setcap cap_net_bind_service,cap_net_admin=+ep /usr/bin/clash-meta
```

Set up clash-verge

- open `Tun Mode`
- Clash Field all checked except `redir-port`

### Start

```bash
# Browser
paru -S firefox-beta-bin
paru -S pipewire pipewire-pulse lib32-pipewire pipewire-alsa pipewire-jack      ## firefox needs

# fonts
paru -S noto-fonts noto-fonts-cjk noto-fonts-emoji
paru -S ttf-sourcecodepro-nerd

# tutanoto email desktop
paru -S tutanota-desktop

# passwd manager
paru -S bitwarden

# bluetooth
paru -S blueberry
paru -S bluez-utils

# rank mirrors
paru -S pacman-contrib

# input
paru -S fcitx5-git fcitx5-chinese-addons fcitx5-gtk
paru -S fcitx5-configtool
paru -S fcitx5-pinyin-moegirl fcitx5-pinyin-zhwiki      # Chinese

# process
paru -S btop                                            # process viewer

# useful tools
paru -S neofetch                                        # system info
paru -S aria2 yt-dlp wget                               # download tools
paru -S cava                                            # interesting sound present
paru -S man-db                                          # help tool
paru -S light                                           # adjust backlight
paru -S swaylock                                        # lock screen
paru -S wlogout                                         # log out
paru -S wl-clipboard                                    # wayland cut
paru -S mako                                            # notifications
paru -S gnome-keyring                                   # system keychain to encrypt sensitive details such as credentials and alarms
paru -S rofi                                            # launcher
paru -S lazygit                                         # git
paru -S expac                                           # list packages installation info
paru -S docker
paru -S goldendict-git                                  # useful dictionary
paru -S maxima tk                                       # useful math tools

# file related
paru -S ranger                                          # ranger
paru -S bat                                             # preview
paru -S python-pillow                                   # ranger preview pictures
paru -S highlight atool ffmpegthumbnailer               # ranger need
paru -S trash-cli

paru -S zathura zathura-pdf-poppler poppler-data        # pdf reader
paru -S koodo-reader-bin                                # pdf reader
paru -S sioyek                                          # pdf reader

paru -S thunar thunar-archive-plugin                    # thunar
paru -S thunar-volman gvfs-mtp gvfs tumbler             # thunar options
paru -S xarchiver polkit-gnome                          # thunar options
paru -S p7zip                                           # thunar options

paru -S fzf fd                                          # fuzzy search

paru -S zotero-bin                                      # research

# editor
paru -S vscodium-bin                                    # vscode open source
paru -S libreoffice-fresh-zh-cn                         # work tools
paru -S qtcreator lldb                                  # nice editor
paru -S qt6                                             # qt6
paru -S dbeaver                                         # database manager

# shell
paru -S zsh                                             # shell
paru -S inetutils                                       # provide hostname command

# video related
paru -S obs-studio qt5-wayland                          # obs
paru -S xdg-desktop-portal-wlr                          # obs need
paru -S mpv                                             # video player
paru -S vlc-git                                         # video player

# pictures related
paru -S swaybg-git                                      # background
paru -S slurp grim                                      # capture
paru -S imv                                             # picture reader
paru -S nomacs qt5-imageformats                         # picture view
paru -S inkscape                                        # vector graphics editor

# music related
paru -S mpd ncmpcpp mpc                                 # music player
paru -S spotify                                         # music player

# bar
paru -S waybar-hyprland-git playerctl                   # waybar
paru -S otf-font-awesome                                # waybar options
paru -S pavucontrol                                     # volume control
paru -S network-manager-applet                          # network tray

# theme
paru -S vimix-gtk-themes-git vimix-icon-theme           # theme
paru -S graphite-cursor-theme-git                       # cursor style
paru -S catppuccin-mocha-grub-theme-git                 # grub theme

# latex
recommend manual installation

# communication
paru -S telegram-desktop

# else
paru -S gtk4
```

### Graphics

#### install graphics

Refer to [archwiki](https://wiki.archlinux.org/)

```bash
intel:
paru -S lib32-mesa vulkan-intel lib32-vulkan-intel mesa-utils libva-utils
paru -S intel-media-driver (firefox hardware video acceleration)

nvidia:
paru -S nvidia nvidia-settings lib32-nvidia-utils
```

Remember to `reboot` to let it take effect.

Under wayland I have `alias prime-run="GBM_BACKEND=nvidia-drm __GLX_VENDOR_LIBRARY_NAME=nvidia"`,so there is no need
to install prime-run as it is just the similar scripts.

#### check nvidia

```bash
GBM_BACKEND=nvidia-drm __GLX_VENDOR_LIBRARY_NAME=nvidia glxgears
nvidia-smi(check if glxgears exists)
```

### Neovim

See [neovim](https://github.com/ausosawx/dotfiles/tree/master/nvim) for requirements.

### Explanation About The Packages

#### ssh

```bash
ssh-keygen -t rsa -C "your_email@example.com"               # ssh-key
cat ~/.ssh/id_rsa.pub                                       # add to your github
```

#### bluetooth

```bash
sudo systemctl enable --now bluetooth
sudo gpasswd -a $USER lp
```

Before using a bluetooth device, check if it is disabled by rfkill.

#### pacman

To make paru more beautiful,recommend opening the `Color` option

```bash
sudo nvim /etc/pacman.conf
```

Then uncomment the `Color` option

#### thunar

- In order to mount the windows disk,you must dowmload a [Authentication agents](https://wiki.archlinux.org/title/Polkit),
  in my case, I install `polkit-gnome` as in the wayfire.ini, I let it autostart with wayfire.

#### waybar

Pay attention to verifying that the scripts under the waybar are valid and whether some packages are lacking

#### group

```bash
sudo gpasswd -a $USER input                   # add to input
```

#### mpd

```bash
systemctl enable --now --user mpd       # autostart
mkdir ~/Music                           # must
```

#### light

To let light to adjust backlight, you need to add user to `video group` and `reboot`

```bash
sudo gpasswd -a $USER video
```

# Install

Clone the repo to a dir(maybe ~/.dotfile),and then run install

```bash
git clone git@github.com:thedawnboy/dotfiles.git ~/.dotfiles/
cd .dotfiles
./install
```

**Reboot to enjoy your arch journey!**

# More things

Obviously,there are more things to do to make the system more multi-functional and efficient.

So there is another file to take notes of some important settings,problems and so on.

Refer to [after_install.md](https://github.com/ausosawx/archlinux-docs/blob/master/after_install.md) for more info.
