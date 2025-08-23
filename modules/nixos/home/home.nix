{ config, pkgs, inputs, user, ... }: 
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

  # Set File Locations for configuration files that do not work or are more difficult to setup with Nix
  home.file."config" = {
    source = ./config;
    recursive = true;
  };
}
