{ config, pkgs, inputs, user, ... }: 
{
  imports = [
    ./catppuccin.nix
    ../../common/home
  ];
  
  nixpkgs.config.allowUnfree = true;

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "25.05";
  };


  # let Home Manager manage itself when in standalone mode
  programs.home-manager.enable = true;
}
