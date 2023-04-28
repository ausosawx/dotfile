#!/bin/bash

git init
git submodule add https://github.com/seebi/dircolors-solarized shell/plugins/dircolors-solarized
git submodule add https://github.com/zsh-users/zsh-syntax-highlighting shell/plugins/zsh-syntax-highlighting
git submodule add https://github.com/zsh-users/zsh-completions shell/plugins/zsh-completions
git submodule add https://github.com/zsh-users/zsh-autosuggestions shell/plugins/zsh-autosuggestions
git submodule add https://github.com/alexanderjeurissen/ranger_devicons ranger/plugins/ranger_devicons
git submodule add https://github.com/catppuccin/bat.git bat/themes
git submodule add https://github.com/catppuccin/btop.git btop/themes
git submodule add https://github.com/catppuccin/obs.git
git submodule add https://github.com/catppuccin/zathura.git zathura/themes
git submodule add https://github.com/catppuccin/cava.git cava/catppuccin
git submodule add https://github.com/ausosawx/nvim.git
git submodule add https://github.com/anishathalye/dotbot
git config -f .gitmodules submodule.dotbot.ignore dirty
cp dotbot/tools/git-submodule/install .
