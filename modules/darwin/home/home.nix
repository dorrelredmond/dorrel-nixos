{ config, pkgs, inputs, ... }: 
{
  imports = [
    ./catppuccin.nix
    ../../common/home
    ./programs
  ];

  home = {
    username = dorrelredmond;
    homeDirectory = "/home/dorrelredmond";
    stateVersion = "25.05";
  };
}
