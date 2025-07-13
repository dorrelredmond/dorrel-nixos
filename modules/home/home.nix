{ homeStateVersion, user, ... }: {
  imports = [
    ./environment # environment variables & path
    ./programs # ways to configure packages
    ./themes # themes for applications
    ./home-manager.nix # home manager specific options
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };

  # let Home Manager manage itself when in standalone mode
  programs.home-manager.enable = true;
}
