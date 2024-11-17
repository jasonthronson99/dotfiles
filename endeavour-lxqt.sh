#!/bin/bash

# Install Non-Aur Packages
sudo pacman -S --needed lxqt podman-docker distrobox xfwm4 exa qbittorrent rofi vivaldi vivaldi-ffmpeg-codecs alacritty kitty galculator flameshot nemo obsidian thunderbird calibre syncthing evince quodlibet nicotine+ yt-dlp bat helix atuin fzf unarchiver btop ncdu tealdeer brightnessctl cmake clang lazygit zellij pinta

# Install Aur Packages
yay -S --needed quickemu arcolinux-logout megasync-bin visual-studio-code-bin icu69 stremio floorp-bin appimagelauncher proton-vpn-gtk-app

# Hyprland Setup (Non-Aur Packages)
sudo pacman -S --needed hyprland waybar swaybg
# Hyprland Setup (Aur Packages)
yay -S --needed hyprshade
