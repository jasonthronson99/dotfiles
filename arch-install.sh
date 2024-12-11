#!/bin/bash

# MOVING FILES & FOLDERS
cp .bash_aliases ~/
TARGET_DIR = "$HOME/.config"
mkdir -p "$TARGET_DIR"

for item in *; do
    if [ -d "$item" ]; then
        echo "Copying directory: $item"
        cp -r "$item" "$TARGET_DIR"
    fi
done

# INSTALLING YAY
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
cd ../
rm -rf yay/

# TERMINAL UTILITIES
sudo pacman -S --needed alacritty kitty bat fzf unarchiver tealdeer brightnessctl atuin yt-dlp tmux gdu micro helix btop sc cmake clang podman-docker distrobox 

# DEVELOPER PROGRAMS
sudo pacman -S --needed lazygit
yay -S --needed visual-studio-code-bin icu69 

# GUI UTILITIES & PRODUCTIVITY APPS
sudo pacman -S --needed obsidian flameshot nemo okular galculator qbittorrent pinta zathura zathura-pdf-mupdf 
yay -S --needed localsend betterbird-bin megasync-bin proton-vpn-gtk-app zen-browser-avx2-bin

# GUI ENTERTAINMENT APPS
sudo pacman -S --needed vlc quodlibet nicotine+ gst-plugins-base gst-plugins-base-libs gst-plugin-pipewire gst-plugins-good gst-plugins-bad gst-plugins-bad-libs
yay -S --needed stremio freetube

# WINDOW MANAGER (EDIT WINDOW MANAGER HERE)
sudo pacman -S --needed i3-wm 
yay -S --needed autotiling

# DESKTOP & WINDOW MANAGER UTILITIES
sudo pacman -S --needed network-manager-applet gnome-tweaks rofi lxappearance sddm
yay -S --needed arcolinux-logout

# SDDM
sudo systemctl enable sddm.service

echo "Choose Your WM Type:"
echo "1) X11"
echo "2) Wayland"
read -p "Enter Your Choice (1-2): " choice

case $choice in
    1)
        echo "Installing X11 Utilities:"
        sudo pacman -S --needed feh polybar parcellite volumeicon lxqt-powermanagement picom xclip
        ;;
    2)
        echo "Installing Wayland Utilities:"
        sudo pacman -S --needed waybar swaybg wl-clipboard
        ;;
esac

