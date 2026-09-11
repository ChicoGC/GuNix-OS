#!/bin/bash

# GuNix OS Post-Installation Setup Script
# Run this AFTER installing Arch Linux base system

set -e

echo "GuNix OS - Post Installation Setup"
echo "===================================="
echo ""

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# Detect script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Choose Desktop Environment
echo "Choose your desktop environment:"
echo "1) Hyprland (Wayland, tiling)"
echo "2) GNOME (Modern, user-friendly)"
read -p "Enter choice (1 or 2): " de_choice

# Update system
echo ""
echo "Updating system packages..."
pacman -Syu --noconfirm

# Install base packages
echo "Installing GuNix OS base packages..."
if [ -f "$SCRIPT_DIR/packages.txt" ]; then
    pacman -S --noconfirm --needed $(cat "$SCRIPT_DIR/packages.txt" | tr '\n' ' ')
else
    echo "Warning: packages.txt not found"
fi

# Install chosen DE
echo ""
case $de_choice in
    1)
        echo "Installing Hyprland desktop environment..."
        pacman -S --noconfirm hyprland hyprpaper wofi dunst kitty
        echo "Copying Hyprland config..."
        mkdir -p /root/.config/hypr
        cp -r ../config/hyprland/* /root/.config/hypr/ 2>/dev/null || echo "Config files not available locally"
        ;;
    2)
        echo "Installing GNOME desktop environment..."
        pacman -S --noconfirm gnome gnome-extra
        systemctl enable gdm
        echo "GNOME will be configured on first login"
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

# Apply GRUB theme
echo ""
if [ -d /boot/grub ] && [ -d "$SCRIPT_DIR/../config/grub-theme" ]; then
    echo "Applying GuNix OS GRUB theme..."
    mkdir -p /boot/grub/themes/gunix
    cp -r "$SCRIPT_DIR/../config/grub-theme/"* /boot/grub/themes/gunix/
    if grep -q "^GRUB_THEME=" /etc/default/grub; then
        sed -i 's|^GRUB_THEME=.*|GRUB_THEME="/boot/grub/themes/gunix/theme.txt"|' /etc/default/grub
    else
        echo 'GRUB_THEME="/boot/grub/themes/gunix/theme.txt"' >> /etc/default/grub
    fi
    grub-mkconfig -o /boot/grub/grub.cfg
else
    echo "Skipping GRUB theme (GRUB not found or theme files missing)"
fi

# Apply os-release branding
echo "Applying GuNix OS branding..."
cat > /etc/os-release <<'EOF'
NAME="GuNix OS"
PRETTY_NAME="GuNix OS"
ID=gunix
ID_LIKE=arch
BUILD_ID=rolling
ANSI_COLOR="38;2;23;147;209"
HOME_URL="https://github.com/ChicoGC/GuNix-OS"
DOCUMENTATION_URL="https://github.com/ChicoGC/GuNix-OS/tree/main/docs"
SUPPORT_URL="https://discord.gg/qtHZwzvRvR"
BUG_REPORT_URL="https://github.com/ChicoGC/GuNix-OS/issues"
EOF

echo ""
echo "✓ GuNix OS setup complete!"
echo ""
echo "Next steps:"
echo "  1. Create a user: useradd -m -G wheel username"
echo "  2. Enable sudo: visudo (uncomment %wheel)"
echo "  3. Reboot: reboot"
echo ""
echo "Welcome to GuNix OS! 💚💛"
