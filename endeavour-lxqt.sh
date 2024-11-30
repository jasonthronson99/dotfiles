#!/bin/bash

# TERMINAL UTILITIES
sudo pacman -S --needed bat fzf unarchiver tealdeer brightnessctl atuin

# DEVELOPER PROGRAMS
sudo pacman -S --needed podman-docker distrobox helix
yay -S --needed visual-studio-code-bin icu69 
# Productivity Packages
sudo pacman -S --needed thunderbird obsidian flameshot nemo okular
yay -S --needed localsend  

# Entertainment Packages
sudo pacman -S --needed quodlibet nicotine+
yay -S --needed stremio 
# Install Non-Aur Packages
sudo pacman -S --needed lxqt xfwm4 qbittorrent rofi vivaldi vivaldi-ffmpeg-codecs alacritty kitty galculator calibre yt-dlp helix starship ncdu cmake clang lazygit tmux nnn pinta

# Install Aur Packages
yay -S --needed quickemu arcolinux-logout megasync-bin floorp-bin proton-vpn-gtk-app
# LXQT Desktop
sudo pacman -S --needed lxqt xfwm4
# Basic Window Manager Utilities
sudo pacman -S --needed rofi
yay -S --needed arcolinux-logout
# Hyprland Packages
sudo pacman -S --needed hyprland waybar swaybg
yay -S --needed hyprshade
