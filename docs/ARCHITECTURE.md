# GuNix OS - Arquitetura em Camadas

## 🔴 CAMADA 1: BOOTLOADER & KERNEL

O que precisa:
- [ ] GRUB (bootloader)
- [ ] Linux Kernel
- [ ] Linux Firmware (drivers básicos)
- [ ] EFI Boot support
- [ ] Boot configuration

**Status:** ✅ Incluído no script (packages.txt)

---

## 🟠 CAMADA 2: SISTEMA BASE

O que precisa:
- [ ] Base packages (glibc, bash, coreutils)
- [ ] Filesystem support (ext4, etc)
- [ ] Essential libraries
- [ ] Package manager (pacman)
- [ ] Sudo/permissions
- [ ] Network tools

**Arquivos:**
- `scripts/packages.txt` - base packages
- `scripts/install.sh` - instalação base

**Status:** 🟡 Parcial - precisa expandir packages.txt

---

## 🟡 CAMADA 3: DRIVERS & HARDWARE

O que precisa:
- [ ] GPU drivers (nvidia/amd/intel)
- [ ] Audio drivers (alsa/pulseaudio)
- [ ] Network drivers
- [ ] Touchpad drivers
- [ ] Sensor drivers

**Próximos passos:**
- Detectar hardware comum
- Criar script de driver detection
- Adicionar drivers opcionais

**Status:** ❌ Não iniciado

---

## 🟢 CAMADA 4: DISPLAY SERVER & COMPOSITOR

### Opção A: Hyprland (Wayland)
- [ ] Wayland
- [ ] Hyprland
- [ ] XWayland (compatibilidade)
- [ ] Dunst (notificações)
- [ ] Wofi (launcher)
- [ ] Hyprpaper (wallpaper)

**Arquivos:**
- `config/hyprland/hyprland.conf`
- `config/hyprland/hyprpaper.conf`

**Status:** ✅ Config base pronta

### Opção B: GNOME (X11/Wayland)
- [ ] GNOME Desktop
- [ ] GNOME Extensions
- [ ] GDM (login manager)
- [ ] Nautilus (file manager)

**Arquivos:**
- `config/gnome/gnome-settings.dconf`

**Status:** ✅ Config base pronta

---

## 🔵 CAMADA 5: APLICAÇÕES ESSENCIAIS

O que precisa:
- [ ] Terminal (kitty/alacritty)
- [ ] Text editor (vim/nano)
- [ ] File manager (incluído no DE)
- [ ] Browser (firefox/chromium)
- [ ] Git (version control)
- [ ] Build tools (base-devel)

**Status:** 🟡 Parcial - vim/nano em packages.txt

---

## 🟣 CAMADA 6: DESENVOLVIMENTO (OPCIONAL)

O que precisa:
- [ ] Compiler toolchain (gcc/clang)
- [ ] Node.js / Python / Rust
- [ ] Docker (containerization)
- [ ] Git
- [ ] Code editor (VS Code / Neovim)

**Status:** ❌ Não iniciado

---

## 🔴 CAMADA 7: CUSTOMIZAÇÃO & BRANDING

O que precisa:
- [ ] GTK Theme (GuNix brand colors)
- [ ] Icon Theme
- [ ] Wallpapers
- [ ] Boot splash
- [ ] Grub theme
- [ ] Lock screen customization

**Arquivos existentes:**
- `GuNix/logo/` - logos
- `GuNix/png/` - assets

**Status:** 🟡 Design existe, precisa integrar

---

## 📋 CHECKLIST POR PRIORIDADE

### 🚀 Fase 1: CORE (Essencial)
- [ ] Refinar packages.txt (Camada 2)
- [ ] Testar script de instalação
- [ ] Escolher entre Hyprland e GNOME
- [ ] Setup básico funcionando

### 🔧 Fase 2: DRIVERS (Importante)
- [ ] Detectar GPUs comuns
- [ ] Adicionar drivers opcionais
- [ ] Audio stack completo
- [ ] Teste em múltiplos hardwares

### 🎨 Fase 3: POLISH (Refinamento)
- [ ] Tema customizado (cores GuNix)
- [ ] Wallpapers e branding
- [ ] Grub theme
- [ ] Desktop setup automático

### 💻 Fase 4: EXTRAS (Futuro)
- [ ] Dev tools
- [ ] Gaming support
- [ ] Container support
- [ ] Customização avançada

---

## 📁 ESTRUTURA DO REPOSITÓRIO

```
GuNix-OS/
├── scripts/
│   ├── install.sh          ✅ Base
│   ├── packages.txt        🟡 Precisa expandir
│   ├── hardware-detect.sh  ❌ TODO
│   └── post-install.sh     ❌ TODO
├── config/
│   ├── hyprland/           ✅ Base
│   ├── gnome/              ✅ Base
│   └── themes/             ❌ TODO
├── branding/
│   ├── wallpapers/         ❌ TODO
│   ├── grub-theme/         ❌ TODO
│   └── gtk-theme/          ❌ TODO
└── docs/
    ├── ARCHITECTURE.md     ✅ Este arquivo
    ├── INSTALL.md          ✅ 
    └── CONTRIBUTING.md     ✅
```

---

## 🎯 Próximos Passos Imediatos

1. **Expandir packages.txt** com essentials
2. **Testar script** em VM com Arch ISO
3. **Decidir:** Hyprland ou GNOME como padrão?
4. **Criar hardware-detect.sh**
5. **Começar tema GuNix**
