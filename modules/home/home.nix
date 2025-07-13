{ homeStateVersion, user, inputs, ... }: {
  imports = [
    ./environment # environment variables & path
    ./programs # ways to configure packages
    ./themes # themes for applications
    inputs.home-manager.nixosModules.default
  ];

  home-manager = {
    verbose = true;
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "bak";
  };

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };

  # let Home Manager manage itself when in standalone mode
  programs.home-manager.enable = true;
}
