# Installation Guide

GuNix OS is built on top of Arch Linux. We provide a post-installation script to set up the GuNix environment.

## Requirements

- Arch Linux ISO (latest)
- At least 4GB RAM
- 20GB disk space (minimum)
- EFI boot system (modern computers)
- Internet connection

## Step 1: Install Arch Linux Base

1. **Download and boot** Arch Linux ISO from https://archlinux.org/download/
2. **Follow the official Arch Wiki** installation guide: https://wiki.archlinux.org/title/Installation_guide
   - Partition your disk (EFI + root)
   - Format partitions
   - Install base system with `pacstrap`
   - Configure `fstab`, locale, hostname, and bootloader

3. **Don't reboot yet!** Continue to Step 2

## Step 2: GuNix OS Post-Installation Setup

Once you have a working Arch system:

### Option A: Internet Download (Recommended)
```bash
# Clone the repository
git clone https://github.com/ChicoGC/GuNix-OS.git
cd GuNix-OS

# Run the post-installation script
sudo bash scripts/install.sh
```

### Option B: Offline (USB/Local)
```bash
# If you have the files locally
sudo bash /path/to/GuNix-OS/scripts/install.sh
```

## Step 3: Post-Setup

The script will:
- Install GuNix packages
- Install your chosen DE (Hyprland or GNOME)
- Copy configurations

After the script finishes:

```bash
# Create a user
sudo useradd -m -G wheel username
sudo passwd username

# Enable sudo for wheel group
sudo visudo
# Uncomment: %wheel ALL=(ALL:ALL) ALL

# Reboot
sudo reboot
```

## Troubleshooting

### "Can't find packages.txt"
Make sure you're running the script from the correct directory or adjust the path.

### Display server won't start
- Verify drivers are installed (check GPU)
- Check logs: `journalctl -xe`

### Network issues
```bash
sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager
```

### Need help?
- Check [Arch Wiki](https://wiki.archlinux.org/)
- Join our Discord: https://discord.gg/qtHZwzvRvR
- Open an issue on [GitHub](https://github.com/ChicoGC/GuNix-OS/issues)
