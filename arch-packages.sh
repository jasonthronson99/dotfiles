#!/bin/bash

# TERMINAL UTILITIES
sudo pacman -S --needed alacritty kitty bat fzf unarchiver tealdeer brightnessctl atuin yt-dlp tmux gdu

# DEVELOPER PROGRAMS
sudo pacman -S --needed podman-docker distrobox helix ruff-lsp python-black pyright cmake clang lazygit
yay -S --needed visual-studio-code-bin icu69 

# GUI UTILITIES & PRODUCTIVITY APPS
sudo pacman -S --needed vivaldi vivaldi-ffmpeg-codecs thunderbird obsidian flameshot nemo okular galculator qbittorrent pinta
yay -S --needed localsend megasync-bin proton-vpn-gtk-app zen-browser-avx2-bin thorium-browser-bin

# GUI ENTERTAINMENT (NON-GAMING) APPS
sudo pacman -S --needed vlc mpv quodlibet nicotine+ 
yay -S --needed stremio

# DESKTOP & WINDOW MANAGER UTILITIES
sudo pacman -S --needed feh rofi polybar waybar swaybg 
yay -S --needed arcolinux-logout 

