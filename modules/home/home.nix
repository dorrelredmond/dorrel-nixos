{ homeStateVersion, user, ... }: {
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
}
