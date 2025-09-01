{ config, pkgs, inputs, user, ... }: 
let 
  configPath = "/home/dorrel/dorrel-nixos/modules/nixos/home";
in 
{
  imports = [
    ./catppuccin.nix
    ../../common/home
    ./programs
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "25.05";
  };
}
