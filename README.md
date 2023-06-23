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

> **Warning**  
> This is my own [Hyprland](https://github.com/hyprwm/Hyprland) based dotfiles. So make sure you have at least skimmed throuth my [installation process](https://github.com/ausosawx/archlinux-docs) to check if satisfying some basic requirements.

## Fast Recovery

There is a script at [pkglist/scripts/install.sh](https://github.com/ausosawx/dotfile/blob/master/pkglist/scripts/install.sh) which can help you complete almost everything.

> **Note**  
> Before running the script make sure you have **`Good Network`**, otherwise refer to **[Priority](#priority)** first.

> **Warning**  
> There are some packages I maintain for myself. Also they exist in the [pkglist/pkglist_newest.txt](https://github.com/ausosawx/dotfile/blob/master/pkglist/pkglist_newest.txt). If you want to use, there is a script at [arch/build/update-repo.sh](https://github.com/ausosawx/build/blob/master/nvchecker/update-repo.sh). Refer to [README.md](https://github.com/ausosawx/build/blob/master/README.md) for more details.

**Remember** there is still something else you may need or want to set.

- [check nvidia](#check-nvidia)
- [set ssh](#ssh)
- [set pacman](#pacman)
- [waybar](#waybar)

## Manual Recovery

### Priority

Suppose you have just finished the basic installation and now in the `tty`.

I recommand installing [paru](https://github.com/Morganamilo/paru) first as a powerful `AUR` helper.

```bash
$ sudo pacman -S paru-git
```

It is better to operate in a graphical interface(`hyprland` for me). So let's do it now.

Install a terminal. [foot](https://codeberg.org/dnkl/foot) will be recommended under `wayland`

```bash
$ paru -S foot
```

Install `hyprland`

```bash
$ paru -S hyprland-git
```

Before entering `Hyprland`, you must change the default terminal from `kitty` to `foot`.

```bash
$ mkdir -p ~/.config/hypr && cd ~/.config/hypr
$ cp /usr/share/hyprland/hyprland.conf .
$ sed -i "s/.*kitty$/bind = \$mainMod,RETURN,exec,foot/" hyprland.conf
```

Now you can type `Hyprland` in `tty` to enter `Linux World` !

> **Note**  
> Before anything else, make sure of smooth `scientific network`. I would recommend [clash meta](https://github.com/MetaCubeX/Clash.Meta) for the beginning
> thouth I use [dae](https://github.com/daeuniverse/dae) now.

```bash
$ paru -S clash-meta
$ sudo setcap cap_net_bind_service,cap_net_admin=+ep /usr/bin/clash-meta # Tun mode need some rights
$ mkdir -p ~/.config/clash-meta && cd ~/.config/clash-meta
$ clash-meta -d . # get your config.yaml first
```

### Packages

| Package                          | Description                                              | Dependencies                                                        |
| -------------------------------- | -------------------------------------------------------- | ------------------------------------------------------------------- |
| adobe-source-han-sans-otc-fonts  | sans CJK fonts                                           | None                                                                |
| adobe-source-han-serif-otc-fonts | serif CJK fonts                                          | None                                                                |
| aria2                            | Download utility                                         | None                                                                |
| authy                            | Two factor authentication(github)                        | None                                                                |
| bat                              | better cat                                               | None                                                                |
| bitwarden                        | password manager                                         | None                                                                |
| blueman                          | Bluetooth Manager                                        | None                                                                |
| bluez-utils                      | Development and debugging utilities for the bluetooth    | None                                                                |
| btop                             | system monitor                                           | None                                                                |
| grub-theme-vimix                 | grub theme                                               | None                                                                |
| cava                             | Audio Visualizer                                         | None                                                                |
| chafa                            | Image-to-text converter(for foot terminal preview)       | None                                                                |
| clang                            | C language family frontend for LLVM                      | None                                                                |
| clash-meta-alpha-git             | Clash Kernel                                             | None                                                                |
| cliphist-git                     | clipboard history "manager"                              | None                                                                |
| cronie                           | scheduled daemon                                         | None                                                                |
| ctpv-git                         | Fast image previews for lf                               | None                                                                |
| dae                              | transparent proxy                                        | None                                                                |
| dbeaver                          | SQL Client                                               | None                                                                |
| docker                           | lightweight container                                    | None                                                                |
| dog                              | Command-line DNS client like dig                         | None                                                                |
| dunst                            | notification-daemon                                      | None                                                                |
| elinks                           | feature-rich text mode web browser                       | None                                                                |
| expac                            | alpm data (pacman database) extraction utility           | None                                                                |
| fcitx5-anthy-git                 | anthy input method                                       | None                                                                |
| fcitx5-chinese-addons-git        | Addons related to Chinese                                | None                                                                |
| fcitx5-configtool-git            | Config tools for Fcitx5                                  | None                                                                |
| fcitx5-git                       | input method                                             | None                                                                |
| fcitx5-gtk-git                   | Gtk im module for fcitx5                                 | None                                                                |
| fcitx5-pinyin-moegirl            | Fcitx 5 Pinyin Dictionary from zh.moegirl.org.cn         | None                                                                |
| fcitx5-pinyin-zhwiki             | Fcitx 5 Pinyin Dictionary from zh.wikipedia.org          | None                                                                |
| fcitx5-qt6-git                   | Fcitx Qt Library, for Qt6                                | None                                                                |
| fd                               | alternative to find                                      | None                                                                |
| firefox-nightly-en-us            | browser                                                  | pipewire related                                                    |
| foot                             | terminal                                                 | foot-terminfo                                                       |
| fzf                              | fuzzy finder                                             | None                                                                |
| github-cli                       | The GitHub CLI                                           | None                                                                |
| gnome-keyring                    | Stores passwords and encryption keys                     | None                                                                |
| go                               | mainly for local compilation(dae-git)                    | None                                                                |
| goldendict-git                   | dictionary                                               | None                                                                |
| graphite-cursor-theme-git        | cursor theme                                             | None                                                                |
| grim                             | Screenshot utility for Wayland                           | None                                                                |
| gtk2                             |                                                          |                                                                     |
| gtk4                             |                                                          |                                                                     |
| highlight                        | source code highlighter                                  | None                                                                |
| hyprpicker-git                   | Wayland color picker                                     | None                                                                |
| imv                              | Image viewer                                             | None                                                                |
| inetutils                        | provide hostname command etc                             | None                                                                |
| inkscape                         | vector graphics editor                                   | gvfs-mtp                                                            |
| iperf3                           | Network tool                                             | None                                                                |
| jq                               | JSON processor                                           | None                                                                |
| koodo-reader-bin                 | pdf reader                                               | None                                                                |
| lazygit                          | lazy git                                                 | None                                                                |
| lf-sixel-git                     | lf fork supporting sixel                                 | None                                                                |
| libc++                           | LLVM C++ standard library                                | None                                                                |
| libreoffice-fresh                | LibreOffice                                              | None                                                                |
| libreoffice-fresh-zh-cn          | Chinese (simplified) language pack for LibreOffice Fresh | None                                                                |
| libxcrypt-compat                 | Modern library for one-way hashing of passwords          | None                                                                |
| light                            | change brightness                                        | None                                                                |
| lldb                             | debugger                                                 | None                                                                |
| llvm                             | Compiler infrastructure                                  | None                                                                |
| man-db                           | reading man pages                                        | None                                                                |
| pacman-contrib                   | package dependency tree viewer                           | None                                                                |
| mariadb                          | SQL database server                                      | None                                                                |
| moreutils                        | growing collection of the unix tools                     | None                                                                |
| mpv                              | media playe                                              | None                                                                |
| mtr                              | Combines the functionality of traceroute and ping        | None                                                                |
| namcap-git                       | A Pacman package analyzer                                | None                                                                |
| neofetch                         | display system information                               | None                                                                |
| neovim-git                       | editor                                                   | None                                                                |
| network-manager-applet           | Applet for managing network connections                  | None                                                                |
| nodejs                           |                                                          |                                                                     |
| noto-fonts-git                   | Google Noto TTF fonts(include additional variants)       | None                                                                |
| npm                              | package manager for javascript                           | None                                                                |
| nvchecker-git                    | check new version of package                             | None                                                                |
| obs-studio                       | live streaming and recording                             | None                                                                |
| opensmtpb                        | mail transfer agent                                      | None                                                                |
| otf-font-awesome                 | Iconic font                                              | None                                                                |
| pamixer                          | Pulseaudio command-line mixer like amixer                | None                                                                |
| pavucontrol                      | PulseAudio Volume Control                                | None                                                                |
| pipewire                         | multimedia framework                                     | lib32-pipewire pipewire-alsa pipewire-jack pipewire-pulse           |
| polkit-gnome                     | Legacy polkit authentication agent                       | None                                                                |
| python-pynvim                    | Python client for Neovim                                 | None                                                                |
| python-requests                  | Python HTTP for Humans                                   | None                                                                |
| qt5-wayland                      | Provides APIs for Wayland                                | None                                                                |
| qtcreator                        | IDE                                                      | None                                                                |
| ripgrep                          | search tool                                              | None                                                                |
| rofi-lbonn-wayland-only-git      | application launcher                                     | None                                                                |
| rustup                           | Rust toolchain installer                                 | None                                                                |
| slurp                            | Select a region in a Wayland compositor                  | None                                                                |
| spotify                          | music player                                             | None                                                                |
| swaylock-effects                 | Screen locker for Wayland                                | None                                                                |
| telegram-desktop                 |                                                          |                                                                     |
| thunar                           | file manager                                             | gvfs thunar-volman thunar-archive-plugin tumbler(ffmpegthumbnailer) |
| tlp                              | Linux Advanced Power Management                          | tlp-rdw smartmontools ethtool                                       |
| traceroute                       | Tracks the route                                         | None                                                                |
| trash-cli                        | Command line trashcan                                    | None                                                                |
| tree                             | directory listing program                                | None                                                                |
| ttf-iosevkaterm-nerd             | monospace font                                           | None                                                                |
| ttf-twemoji                      | emoji font                                               | None                                                                |
| tutanota-desktop-bin             | tutanota client                                          | None                                                                |
| typst                            | markup-based typesetting system                          | None                                                                |
| unrar unzip                      | uncompression                                            | None                                                                |
| vimix-gtk-themes-git             | gtk theme                                                | None                                                                |
| vimix-icon-theme                 | icon theme                                               | None                                                                |
| vlc-git                          | multi-platform MPEG, VCD/DVD, and DivX player            | None                                                                |
| vscodium-bin                     | editor                                                   | None                                                                |
| waybar-hyprland-git              | Wayland bar                                              | None                                                                |
| wget                             | retrieve files from the Web                              | None                                                                |
| wl-clipboard                     | Command-line copy/paste utilities for Wayland            | None                                                                |
| wlogout                          | Logout menu for wayland                                  | None                                                                |
| xarchiver                        | GTK+ frontend to various command line archivers          | zip p7zip                                                           |
| xdg-desktop-portal-hyprland-git  | xdg-desktop-portal backend for hyprland                  | None                                                                |
| yt-dlp                           | youtube-dl fork                                          | None                                                                |
| zathura                          | pdf reader                                               | zathura-pdf-poppler                                                 |
| zotero-bin                       | research organize                                        | None                                                                |
| zsh                              | shell                                                    | None                                                                |
| swappy                           | A Wayland native snapshot and editor tool                | None                                                                |
| swww-git                         | Wayland Wallpaper daemon                                 | None                                                                |

### Graphics

#### install graphics

Refer to [archwiki](https://wiki.archlinux.org/)

```bash
# intel:
$ paru -S lib32-mesa vulkan-intel lib32-vulkan-intel mesa-utils libva-utils
$ paru -S intel-media-driver (firefox hardware video acceleration)

# nvidia:
$ paru -S nvidia
```

Remember to `reboot` to let it take effect.

Under wayland I have `alias prime-run="GBM_BACKEND=nvidia-drm __GLX_VENDOR_LIBRARY_NAME=nvidia"`,so there is no need
to install prime-run as it is just the similar scripts.

#### check nvidia

```bash
$ GBM_BACKEND=nvidia-drm __GLX_VENDOR_LIBRARY_NAME=nvidia glxgears
$ nvidia-smi
```

### Neovim

See [neovim](https://github.com/ausosawx/dotfiles/tree/master/nvim) for requirements.

### Explanation About The Packages

#### ssh

```bash
$ ssh-keygen -t rsa -C "your_email@example.com"               # ssh-key
$ cat ~/.ssh/id_rsa.pub                                       # add to your github
```

#### bluetooth

```bash
$ sudo systemctl enable --now bluetooth
$ sudo gpasswd -a $USER lp
```

Before using a bluetooth device, check if it is disabled by rfkill.

#### pacman

To make paru more beautiful,recommend opening the `Color` option

```bash
$ sudo nvim /etc/pacman.conf
```

Then uncomment the `Color` option

#### thunar

- In order to mount the windows disk,you must dowmload a [Authentication agent](https://wiki.archlinux.org/title/Polkit),
  in my case, I install `polkit-gnome`.

#### waybar

Pay attention to verifying that the scripts under the waybar are valid and whether some packages are lacking

#### group

```bash
$ sudo gpasswd -a $USER input # add to input
```

#### light

To let light to adjust backlight, you need to add user to `video group` and `reboot`

```bash
$ sudo gpasswd -a $USER video
```

# Install

Clone the repo to a dir(maybe ~/.dotfile),and then run install

```bash
$ git clone git@github.com:thedawnboy/dotfiles.git ~/.dotfiles/
$ cd .dotfiles
$ ./install
```

**Reboot to enjoy your arch journey!**

# More things

Obviously, there are more things to do to make the system more multi-functional and efficient.

So there is another file to take notes of some important settings,problems and so on.

Refer to [after_install.md](https://github.com/ausosawx/archlinux-docs/blob/master/after_install.md) for more info.
