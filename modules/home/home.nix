{ homeStateVersion, user, ... }: {
  imports = [
    ./home-packages.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };

  # let Home Manager manage itself when in standalone mode
  programs.home-manager.enable = true;
}
