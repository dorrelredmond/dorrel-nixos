{ pkgs, inputs, user, ... }: {
  imports = [
    ./catppuccin.nix
    ./firefox.nix
    ../../common/home
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "25.05";
  };

  nixpkgs.config.allowUnfree = true;

  # let Home Manager manage itself when in standalone mode
  programs.home-manager.enable = true;
}
