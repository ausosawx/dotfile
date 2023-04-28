#!/bin/bash

# Define info func
Parent_thread() {
	echo -e "\033[1;32m==>\033[0m \033[1;37m$1...\033[0m"
}

Child_thread() {
	echo -e "\033[1;34m  ->\033[0m \033[1;37m$1...\033[0m"
}

Warning() {
	echo -e "\033[1;33m::\033[0m \033[1;37m$1\033[0m"
}

Error() {
	echo -e "\033[1;31merror:\033[0m \033[1;37m$1.\033[0m"
}

# Cd to the parent directory of install script
cd "$(dirname "$0")" || exit 1

# Install `paru` first to avoid some problems
Parent_thread "Install paru-git"
sudo pacman -S --needed paru-git

# Check pkglist file
pkglist_newest="../pkglist_newest.txt"
pkglist_all_newest="../pkglist_all_newest.txt"
if [[ ! -f "$pkglist_all_newest" && ! -f "$pkglist_newest" ]]; then
	Error "pkglist file does not exit in the upper directory"
	exit 1
fi

# Install packages
Parent_thread "Install packages"

if ! grep -Fxvqf <(paru -Qq) "$pkglist_newest"; then
	:
elif ! paru -S --needed $(grep -Fxvf <(paru -Qq) "$pkglist_newest"); then
	Error "failed , please try again"
	exit 1
fi

# System settings
Parent_thread "System settings"

# Systemctl
Child_thread "Systemctl settings"
sudo systemctl enable --now bluetooth
systemctl enable --now --user mpd

# Rustup
Child_thread "Rustup install the toolchain"
rustup default stable

# Change default shell
Child_thread "Change shell to zsh"
if ! echo "$SHELL" | grep -q "/usr/bin/zsh"; then
	chsh -s /usr/bin/zsh
fi

# Add user to groups
Child_thread "Add user to groups"
group=("video" "lp" "input")
for element in "${group[@]}"; do
	if ! groups | grep -q "$element"; then
		sudo gpasswd -a "$USER" "$element"
	fi
done

# Check the owner
bool=

while true; do
	Warning "Are you the owner of the repository and already setting the ssh? [Y/n]"
	read -r input

	case $input in
	[yY][eE][sS] | [yY])
		bool=true
		break
		;;
	[nN][oO] | [nN])
		bool=false
		break
		;;

	*)
		Error "invalid input"
		;;
	esac
done

# Clone archlinux-docs
while true; do
	Warning "Do you want to clone the archlinux-docs? [Y/n]"
	read -r input

	case $input in
	[yY][eE][sS] | [yY])
		Parent_thread "Clone archlinux-docs"

		ARCHDOC_DIR="$HOME/Data/archlinux-docs"

		if [ -d "$ARCHDOC_DIR" ]; then
			mv "$ARCHDOC_DIR" "$ARCHDOC_DIR".bak
			Warning "Has made a backup of archlinux-docs into archlinux-docs.bak"
		fi

		if $bool; then
			git clone git@github.com:ausosawx/archlinux-docs.git "$ARCHDOC_DIR"
		else
			git clone https://github.com/ausosawx/archlinux-docs.git "$ARCHDOC_DIR"
		fi

		break
		;;
	[nN][oO] | [nN])
		break
		;;

	*)
		Error "invalid input"
		;;
	esac
done

# Clone dotfiles
Parent_thread "Clone dotfiles"
Warning "Default cloning to ~/.dotfiles. Feel free to exit and change it. Continue? [Y/n]"
while true; do
	read -r input

	case $input in
	[yY][eE][sS] | [yY])
		break
		;;
	[nN][oO] | [nN])
		exit 0
		;;

	*)
		Error "invalid input"
		;;
	esac
done

DOT_DIR="$HOME/.dotfiles"

if [ -d "$DOT_DIR" ]; then
	mv "$DOT_DIR" "$DOT_DIR".bak
	Warning "Has made a backup of .dotfiles into .dotfiles.bak"
fi

# Confirm install
if ($bool && git clone git@github.com:ausosawx/dotfiles.git "$DOT_DIR") || (! $bool && git clone https://github.com/ausosawx/dotfiles.git "$DOT_DIR"); then
	while true; do
		Warning "Are you sure to install? [Y/n]"
		read -r input

		case $input in
		[yY][eE][sS] | [yY])
			cd "$DOT_DIR" || exit 1
			./install
			break
			;;
		[nN][oO] | [nN])
			exit 1
			;;

		*)
			Error "invalid input"
			;;
		esac
	done
else
	Error "failed, please make sure you have cloned the dotfiles"
	exit 1
fi

# Confirm reboot to take effect
while true; do
	Warning "Reboot now to take effect? [Y/n]"
	read -r input

	case $input in
	[yY][eE][sS] | [yY])
		reboot || sudo reboot
		exit 0
		;;

	[nN][oO] | [nN])
		exit 0
		;;

	*)
		Error "invalid input"
		;;
	esac
done
