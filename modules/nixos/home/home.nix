{ config, pkgs, inputs, user, ... }: 
{
  imports = [
    ./catppuccin.nix
    ../../common/home
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "25.05";
  };
}
