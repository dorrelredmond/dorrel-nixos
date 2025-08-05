#! /run/current-system/sw/bin/bash

echo -e "\nAre you updating a nix or darwin install?"
read installType

echo -e "\nEnter System Configuration to use (i.e., desktop or macbook)"
read systemConfig

echo -e "\nEnter Home Manager Configuration to use"
read homeConfig

echo -e "\nNotice\nRequesting Updates: Flake Lock\n"
nix flake update --commit-lock-file
echo -e "\nUpdates: Flake Lock Acquisition Successful"

if [ $installType == "nix" ]
then
echo -e "\nNotice\nRequesting Updates: System Packages\n"
sudo nixos-rebuild switch --flake .#$systemConfig --upgrade
echo -e "\nUpdates: System Packages Acquisition Successful"

elif [ $installType == "darwin" ]
then
echo -e "\nNotice\nRequesting Updates: System Packages\n"
darwin-rebuild switch --flake .#$systemConfig --upgrade
echo -e "\nUpdates: System Packages Acquisition Successful"
fi

echo -e "\nNotice\nRequesting Updates: Home Manager\n"
home-manager switch --flake .#$homeConfig
echo -e "\nUpdates: Home Manager Acquisition Successful"

echo -e "\nThe system has now been fully upgraded"