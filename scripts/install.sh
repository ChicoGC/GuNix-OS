#!/bin/bash

# GuNix OS Installation Script

set -e

echo "Welcome to GuNix OS Installer!"
echo "==============================="
echo ""

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# Choose Desktop Environment
echo "Choose your desktop environment:"
echo "1) Hyprland (Wayland, tiling)"
echo "2) GNOME (Modern, user-friendly)"
read -p "Enter choice (1 or 2): " de_choice

# Update system
echo "Updating system..."
pacman -Syu --noconfirm

# Install base packages
echo "Installing base packages..."
pacman -S --noconfirm --needed - < packages.txt

# Install chosen DE
case $de_choice in
    1)
        echo "Installing Hyprland..."
        pacman -S --noconfirm hyprland hyprpaper wofi dunst
        ;;
    2)
        echo "Installing GNOME..."
        pacman -S --noconfirm gnome gnome-extra
        systemctl enable gdm
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

echo ""
echo "Installation complete!"
echo "Reboot your system to start using GuNix OS"
