# Quick Start: Installing Arch Linux

Este é um resumo rápido. Para instruções completas, veja o [Arch Wiki Installation Guide](https://wiki.archlinux.org/title/Installation_guide).

## 1. Boot e Conectar à Internet

```bash
# Verificar conexão
ping archlinux.org

# Se Wi-Fi
iwctl
device list
station <device> scan
station <device> get-networks
station <device> connect <SSID>
```

## 2. Particionar o Disco

```bash
# Ver discos disponíveis
fdisk -l

# Particionar (exemplo para /dev/sda)
fdisk /dev/sda

# Criar partições:
# - 512M boot (EFI) - tipo ef00
# - Resto para root - tipo 8300

# Ou usar parted (mais fácil)
parted /dev/sda
mkpart ESP fat32 1MiB 512MiB
mkpart root ext4 512MiB 100%
set 1 boot on
```

## 3. Formatar Partições

```bash
# EFI
mkfs.fat -F32 /dev/sda1

# Root
mkfs.ext4 /dev/sda2
```

## 4. Montar Partições

```bash
# Mount root
mount /dev/sda2 /mnt

# Mount EFI
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
```

## 5. Instalar Sistema Base

```bash
pacstrap -K /mnt base linux linux-firmware
```

## 6. Gerar fstab

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

## 7. Chroot

```bash
arch-chroot /mnt
```

## 8. Configuração Básica (dentro do chroot)

```bash
# Timezone
ln -sf /usr/share/zoneinfo/Brazil/East /etc/localtime
hwclock --systohc

# Locale
nano /etc/locale.gen
# Descomente: en_US.UTF-8 UTF-8 (ou sua língua)
locale-gen

# Hostname
echo "gunix" > /etc/hostname

# Network
pacman -S networkmanager
systemctl enable NetworkManager
```

## 9. Instalar GRUB (Bootloader)

```bash
pacman -S grub efibootmgr os-prober
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GuNix
grub-mkconfig -o /boot/grub/grub.cfg
```

## 10. Root Password e Sair

```bash
passwd
# Digite senha do root

exit
umount -R /mnt
reboot
```

## 11. Depois do Reboot

```bash
# Login como root

# Conectar à internet (se necessário)
systemctl start NetworkManager

# Clonar GuNix OS repo e rodar pós-instalação
git clone https://github.com/ChicoGC/GuNix-OS.git
cd GuNix-OS
sudo bash scripts/install.sh
```

---

**Dica:** Se der erro em qualquer passo, não desista! Consulte o [Arch Wiki](https://wiki.archlinux.org/title/Installation_guide) - lá tem respostas para tudo.
