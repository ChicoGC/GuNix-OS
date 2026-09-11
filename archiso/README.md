# GuNix OS - Archiso Build

Este diretório contém a configuração do [archiso](https://wiki.archlinux.org/title/Archiso) usada para gerar a ISO oficial do GuNix OS.

## Requisitos

- Uma máquina (ou VM) rodando **Arch Linux** (não funciona no Windows/WSL sem ajustes)
- Pacote `archiso` instalado:
```bash
sudo pacman -S archiso
```

## Estrutura

```
archiso/
├── profiledef.sh       # Configuração principal da ISO (nome, modos de boot, etc)
├── packages.x86_64      # Pacotes incluídos no live environment
├── pacman.conf          # Config do pacman usada no build
├── airootfs/            # Arquivos que vão direto pro sistema de arquivos da ISO
│   ├── etc/
│   │   ├── os-release   # Identidade do sistema (GuNix OS)
│   │   ├── issue        # Banner de login (TTY)
│   │   └── motd         # Mensagem de boas-vindas
│   ├── root/             # Home do root no live environment
│   └── usr/local/bin/
│       └── gunix-install # Comando pra iniciar a instalação
├── syslinux/             # Boot menu (BIOS)
├── efiboot/              # Boot menu (UEFI)
├── branding/             # Logos usados no boot
└── build.sh              # Script que monta tudo e gera a .iso
```

## Como buildar

```bash
sudo bash build.sh
```

A ISO final vai aparecer em `archiso/out/gunixos-*.iso`.

## Como testar

Recomendado testar em uma VM (QEMU/VirtualBox) antes de gravar em um pendrive:

```bash
qemu-system-x86_64 -m 4096 -enable-kvm -cdrom out/gunixos-*.iso
```

## Gravando em um pendrive

```bash
sudo dd bs=4M if=out/gunixos-*.iso of=/dev/sdX status=progress oflag=sync
```

⚠️ Substitua `/dev/sdX` pelo dispositivo correto do seu pendrive. Isso apaga todo o conteúdo dele.

## Branding

Os logos usados no boot (GRUB, syslinux) vêm de `archiso/branding/` e `config/grub-theme/`, copiados de `GuNix/logo/` e `GuNix/png/`. Para trocar, basta substituir os PNGs nessas pastas antes do build.
