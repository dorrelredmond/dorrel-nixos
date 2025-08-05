#! /run/current-system/sw/bin/bash

echo -e "\nAre you updating a nix or darwin install?"
read installType

echo -e "\nEnter System Configuration to use (i.e., desktop or macbook)"
read systemConfig

echo -e "\nEnter Home Manager Configuration to use"
read homeConfig

echo -e "\nBeginning Flake Lock File Updates"
nix flake update --commit-lock-file
echo -e "\nSuccess"

if [ $installType == "nix" ]
then
echo -e "\nBeginning System Package Updates"
sudo nixos-rebuild switch --flake .#$systemConfig --upgrade
echo -e "\nSuccess"

elif [ $installType == "darwin" ]
then
echo -e "\nBeginning System Package Updates"
darwin-rebuild switch --flake .#$systemConfig --upgrade
echo -e "\nSuccess"
fi

echo -e "\nBeginning Home Manager Updates"
home-manager switch --flake .#$homeConfig
echo -e "\nSuccess"