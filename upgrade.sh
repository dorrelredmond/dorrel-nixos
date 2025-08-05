#! /run/current-system/sw/bin/bash

echo "Are you updating a nix or darwin install?"
read installType


if [ $installType == "nix" ]
then
echo "Enter NixOS Configuration to use"
read nixConfig

echo "Enter Home Manager Configuration to use"
read homeConfig

echo -e "\nBeginning Flake Lock File Updates\n"
nix flake update
echo -e "\nSuccess\n"

echo -e "\nBeginning System Package Updates\n"
sudo nixos-rebuild switch --flake .#$nixConfig --upgrade
echo -e "\nSuccess\n"

echo -e "\nBeginning Home Manager Updates\n"
home-manager switch --flake .#$homeConfig
echo -e "\nSuccess\n"

elif [ $installType == "darwin" ]
then
echo "Enter Darwin Configuration to use"
read darwinConfig

echo "Enter Home Manager Configuration to use"
read homeConfig

echo -e "\nBeginning Flake Lock File Updates\n"
nix flake update
echo -e "\nSuccess\n"

echo -e "\nBeginning System Package Updates\n"
darwin-rebuild switch --flake .#$darwin --upgrade
echo -e "\nSuccess\n"

echo -e "\nBeginning Home Manager Updates\n"
home-manager switch --flake .#$homeConfig
echo -e "\nSuccess\n"

fi