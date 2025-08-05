#! /run/current-system/sw/bin/bash

nix flake update
sudo nixos-rebuild switch --flake .#desktop --upgrade
home-manager switch --flake .#desktop