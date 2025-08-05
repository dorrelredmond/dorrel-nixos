{ config, nur, pkgs, inputs, user, ... }: 
let
  nur-no-pkgs = import (builtins.fetchTarball {
      url = "https://github.com/nix-community/NUR/archive/main.tar.gz";
      sha256 = "0ss4ildiliwm66323ssvpn66g662cj3360j6fs6c2jrrdql0pj3q";
    }){};
in
{
  imports = [
    ./catppuccin.nix
    ../../common/home
    (import "lib.attrValues nur-no-pkgs.repos.moredhel.hmModules.rawModules")
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
