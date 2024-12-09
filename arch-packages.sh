#!/bin/bash

# TERMINAL UTILITIES
sudo pacman -S --needed alacritty kitty bat fzf unarchiver tealdeer brightnessctl atuin yt-dlp tmux gdu micro btop

# DEVELOPER PROGRAMS
sudo pacman -S --needed podman-docker distrobox helix ruff-lsp python-black pyright cmake clang lazygit
yay -S --needed visual-studio-code-bin icu69 

# GUI UTILITIES & PRODUCTIVITY APPS
sudo pacman -S --needed vivaldi vivaldi-ffmpeg-codecs obsidian flameshot nemo okular galculator qbittorrent pinta bitwarden zathura zathura-pdf-mupdf 
yay -S --needed localsend betterbird-bin megasync-bin proton-vpn-gtk-app zen-browser-avx2-bin

# GUI ENTERTAINMENT (NON-GAMING) APPS
sudo pacman -S --needed vlc mpv quodlibet nicotine+ 
yay -S --needed stremio

# DESKTOP & WINDOW MANAGER UTILITIES
sudo pacman -S --needed feh rofi polybar waybar swaybg parcellite lxqt-powermanagement volumeicon
yay -S --needed arcolinux-logout 

# EXTRA/BACKUP WINDOW MANAGER
yay -S --needed zwm-git
mv zwm.desktop /usr/share/xsessions/
