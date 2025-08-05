{ config, nur, pkgs, inputs, user, lib, ... }: 
let
  nur-no-pkgs = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/main.tar.gz") {};
in
{
  imports = [
    ./catppuccin.nix
    ../../common/home
    lib.attrValues nur-no-pkgs.repos.moredhel.hmModules.rawModules
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
