{ config, nur, pkgs, inputs, user, ... }: 
let
  nur-no-pkgs = import (builtins.fetchTarball {
      # Get the revision by choosing a version from https://github.com/nix-community/NUR/commits/main
      url = "https://github.com/nix-community/NUR/archive/3a6a6f4da737da41e27922ce2cfacf68a109ebce.tar.gz";
      # Get the hash by running `nix-prefetch-url --unpack <url>` on the above url
      sha256 = "04387gzgl8y555b3lkz9aiw9xsldfg4zmzp930m62qw8zbrvrshd";
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
