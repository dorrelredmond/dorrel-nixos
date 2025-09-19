#! /run/current-system/sw/bin/bash

echo -e "\nAre you updating a nix or darwin install?"
read installType

echo -e "\nEnter System Configuration to use (i.e., desktop or macbook)"
read systemConfig

echo -e "\nNotice\nRequesting Latest Build Configuration"
if git pull ; then
    echo -e "\nRequest Confirmed: Acquisition of the Latest System Configuration Successful"
else
    echo -e "\nNotice\nAn Error Has Occurred"
    exit 1
fi

echo -e "\nNotice\nRequesting Updates: Flake Lock\n"
if nix flake update --commit-lock-file ; then
    echo -e "\nRequest Confirmed\nUpdate: Flake Lock Acquisition Successful"
else
    echo -e "\nNotice\nAn Error Has Occurred"
    exit 1
fi

echo -e "\nNotice\nRequesting Updates: System Packages\n"

if [ $installType == "nix" ]; then
    if sudo nixos-rebuild switch --flake .#$systemConfig --upgrade; then
        echo -e "\nRequest Confirmed\nUpdates: System Packages Acquisition Successful"
    else
        echo -e "\nNotice\nAn Error Has Occurred"
        exit 1
    fi
elif [ $installType == "darwin" ]; then
   if sudo darwin-rebuild switch --flake .#$systemConfig; then
        echo -e "\nRequest Confirmed\nUpdates: System Packages Acquisition Successful"
    else
        echo -e "\nNotice\nAn Error Has Occurred"
        exit 1
    fi
else
    echo -e "\nNotice\nAn Error Has Occurred"
    exit 1
fi

echo -e "\nNotice\nThe system has now been fully upgraded"
