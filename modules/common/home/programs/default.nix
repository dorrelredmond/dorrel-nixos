{
  imports = [
    ./firefox.nix
    ./fish.nix
    ./git.nix
    ./kitty.nix
    ./starship.nix
  ];

  # Set File Locations for configuration files that do not work properly using Nix
  home.file = {
    ".config/fastfetch/config.jsonc".source = ../config/fastfetch/config.jsonc;
  };
}