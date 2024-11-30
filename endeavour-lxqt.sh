#!/bin/bash

# TERMINAL UTILITIES
sudo pacman -S --needed alacritty kitty bat fzf unarchiver tealdeer brightnessctl atuin yt-dlp tmux gdu

# DEVELOPER PROGRAMS
sudo pacman -S --needed podman-docker distrobox helix ruff-lsp python-black pyright cmake clang lazygit
yay -S --needed visual-studio-code-bin icu69 

# GUI UTILITIES & PRODUCTIVITY APPS
sudo pacman -S --needed vivaldi vivaldi-ffmpeg-codecs thunderbird obsidian flameshot nemo okular galculator qbittorrent pinta
yay -S --needed localsend megasync-bin proton-vpn-gtk-app zen-browser-avx2-bin

# GUI ENTERTAINMENT APPS
sudo pacman -S --needed quodlibet nicotine+
yay -S --needed stremio 

# DESKTOP & WINDOW MANAGER UTILITIES
sudo pacman -S --needed lxqt xfwm4 rofi polybar waybar swaybg 
yay -S --needed arcolinux-logout 

# HYPRLAND
sudo pacman -S --needed hyprland 
yay -S --needed hyprshade
