{
  imports = [
    ./programs
  ];

  # Set File Locations for configuration files that do not work or are more difficult to setup with Nix
  home.file."${config.xdg.configHome}" = {
    source = ./config;
    recursive = true;
  };
}
