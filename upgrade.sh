#! /run/current-system/sw/bin/bash

echo "Are you updating a "nix" or "darwin" install?"
read installType


if [ installType == "nix" ]
then
echo "Enter NixOS Configuration to use"
read nixConfig

echo "Enter Home Manager Configuration to use"
read homeConfig

nix flake update
sudo nixos-rebuild switch --flake .#$nixConfig --upgrade
home-manager switch --flake .#$homeConfig

elif [installType == "darwin" ]
then
echo "Enter Darwin Configuration to use"
read darwinConfig

echo "Enter Home Manager Configuration to use"
read homeConfig

nix flake update
sudo darwin-rebuild switch --flake .#$darwin --upgrade
home-manager switch --flake .#$homeConfig

fi