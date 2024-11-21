#!/bin/bash

# Install Non-Aur Packages
sudo pacman -S --needed lxqt xfwm4 podman-docker distrobox qbittorrent rofi vivaldi vivaldi-ffmpeg-codecs alacritty kitty galculator flameshot nemo obsidian thunderbird calibre syncthing zathura zathura-pdf-mupdf evince quodlibet nicotine+ yt-dlp bat helix atuin starship fzf unarchiver btop ncdu tealdeer brightnessctl cmake clang lazygit tmux nnn pinta

# Install Aur Packages
yay -S --needed quickemu arcolinux-logout megasync-bin visual-studio-code-bin icu69 stremio floorp-bin proton-vpn-gtk-app

# Hyprland Setup (Non-Aur Packages)
sudo pacman -S --needed hyprland waybar swaybg
# Hyprland Setup (Aur Packages)
yay -S --needed hyprshade
