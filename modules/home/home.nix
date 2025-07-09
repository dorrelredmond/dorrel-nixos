{ homeStateVersion, user, ... }:

{
  imports = [
    ./environment # environment variables & path
    ./programs # ways to configure packages
    ./themes # themes for applications
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
