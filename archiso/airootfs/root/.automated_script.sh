#!/usr/bin/env bash
#
# GuNix OS live environment welcome script

if [[ "$(tty)" == "/dev/tty1" ]]; then
    clear
    cat /etc/issue
    echo ""
    echo "Run 'gunix-install' to start installing GuNix OS to disk."
    echo ""
fi
