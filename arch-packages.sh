#!/bin/bash

# TERMINAL UTILITIES
sudo pacman -S --needed alacritty kitty bat fzf unarchiver tealdeer brightnessctl atuin yt-dlp tmux gdu micro helix btop sc cmake clang podman-docker distrobox 

# DEVELOPER PROGRAMS
sudo pacman -S --needed ruff-lsp python-black pyright lazygit vscode-html-languageserver vscode-css-languageserver lua-language-server typescript-language-server
yay -S --needed visual-studio-code-bin icu69 

# GUI UTILITIES & PRODUCTIVITY APPS
sudo pacman -S --needed obsidian flameshot nemo okular galculator qbittorrent pinta zathura zathura-pdf-mupdf 
yay -S --needed localsend betterbird-bin megasync-bin proton-vpn-gtk-app zen-browser-avx2-bin

# GUI ENTERTAINMENT APPS
sudo pacman -S --needed vlc mpv quodlibet nicotine+ 
yay -S --needed stremio

# WINDOW MANAGER
sudo pacman -S --needed i3-wm

# DESKTOP & WINDOW MANAGER UTILITIES
sudo pacman -S --needed network-manager-applet feh rofi polybar waybar swaybg parcellite lxqt-powermanagement volumeicon gnome-tweaks lxappearance sddm picom
yay -S --needed arcolinux-logout 

sudo systemctl enable sddm.service
