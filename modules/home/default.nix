{
  _class = "homeManager";

  imports = [
    ./environment # environment variables & path
    ./home.nix # home settings
    ./programs # ways to configure packages
    ./themes # themes for applications
  ];
}
