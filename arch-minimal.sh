#!/bin/bash

# First Make Sure You're At The Home Directory
cd
mkdir ~/Downloads/
cd
sudo mkdir /usr/share/xsessions/
cd
# Update System
sudo pacman -Syyu
# Install Aur-Helper
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
rm -rf yay/
# Install Non-Aur Packages
sudo pacman -S --needed gst-plugins-good gst-plugins-bad reflector alsa-utils exa bash-completion python openssh neofetch vlc qbittorrent sddm rofi network-manager-applet xfce4-screensaver vivaldi alacritty kitty galculator flameshot nemo obsidian thunderbird calibre syncthing zathura zathura-pdf-mupdf quodlibet nicotine+ yt-dlp bat helix neovim atuin starship fzf unarchiver btop ncdu tealdeer brightnessctl trash-cli zoxide pyright python-black python-pipx cmake lazygit zellij tmux r bash-language-server pinta

# Install Aur Packages
yay -S --needed reflector-simple reflector-bash-completion arcolinux-logout megasync-bin visual-studio-code-bin stremio rstudio-desktop-bin floorp-bin appimagelauncher proton-vpn-gtk-app

# Enable SDDM Service
systemctl enable sddm.service 

# Tiling Window Manager Script

menu() {
  echo "Choose Your Environment: "
  echo "1) Hyprland"
  echo "2) Zwm"
  echo "3) Exit"

  read -p "Enter Choice [1-3]: " choice

  case $choice in
    1)
      sudo pacman -S --needed hyprland && yay -S --needed hyprshade pyprland
      echo "Installing Supplementary Hyprland Packages"
      sudo pacman -S --needed swaybg waybar
      mv zwm.desktop ~/Downloads/ && mv testwall.png ~/Downloads/
      exit 0  
      ;;
    2)
      yay -S --needed zwm-git
      echo "Installing Supplementary Zwm Packages"
      sudo pacman -S --needed polybar feh picom redshift volumeicon parcellite lxqt-powermanagement
      mv zwm.desktop /usr/share/xsessions/
      mv testwall.png ~/Downloads/
      exit 0  
      ;;
    3)
      echo "Exiting..."
      exit 0  
      ;;
  esac
}

while true; do
  menu
done

