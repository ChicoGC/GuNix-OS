# GNOME Configuration

GuNix OS default configuration for GNOME.

## Installation

GNOME stores preferences in dconf. To apply our defaults:

```bash
dconf load / < gnome-settings.dconf
```

## Customization

### Theme
Place custom GTK themes in: `~/.themes/`

### Icons
Place custom icon sets in: `~/.icons/`

### Extensions
Install GNOME extensions from: https://extensions.gnome.org/

### Settings
Edit `gnome-settings.dconf` to change:
- Theme preferences
- Keyboard shortcuts
- Desktop behavior
- Panel configuration

## Default Extensions (Optional)

- Dash to Dock - Better application dock
- GSConnect - Android integration
- Clipboard Manager - Enhanced clipboard

See [GNOME Documentation](https://help.gnome.org/) for more.
