#!/usr/bin/env bash

# Check release
if [ ! -f /etc/arch-release ] ; then
    exit 0
fi

# Check for updates
ofc=$(paru -Qu | wc -l)

# Calculate total available updates
upd=$((ofc))
echo "$upd"

# Show tooltip
if [ $upd -eq 0 ] ; then
    echo " Packages are up to date"
else
    echo "󱓽 Official $ofc"
fi

# Trigger upgrade
if [ "$1" == "up" ] ; then
    foot --title systemupdate sh -c 'paru -Syu'
fi

