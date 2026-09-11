#!/usr/bin/env bash
#
# Builds the GuNix OS ISO using archiso.
# Must be run on an Arch Linux machine with the `archiso` package installed.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
OUT_DIR="$SCRIPT_DIR/out"
WORK_DIR="$SCRIPT_DIR/work"

if ! command -v mkarchiso &> /dev/null; then
    echo "Error: mkarchiso not found. Install it with: pacman -S archiso"
    exit 1
fi

if [[ $EUID -ne 0 ]]; then
    echo "Error: this script must be run as root"
    exit 1
fi

echo "Bundling GuNix OS scripts and configs into the ISO..."
mkdir -p "$SCRIPT_DIR/airootfs/root/GuNix-OS"
cp -r "$REPO_DIR/scripts" "$SCRIPT_DIR/airootfs/root/GuNix-OS/"
cp -r "$REPO_DIR/config" "$SCRIPT_DIR/airootfs/root/GuNix-OS/"

echo "Building ISO..."
mkarchiso -v -w "$WORK_DIR" -o "$OUT_DIR" "$SCRIPT_DIR"

echo ""
echo "✓ Build complete! ISO available in: $OUT_DIR"
