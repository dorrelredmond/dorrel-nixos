{
  imports = [
    ./programs
  ];

  # Set File Locations for configuration files that do not work or are more difficult to setup with Nix
  home.file = {
    ".config/bat" = {
      source = ./config/bat;
      recursive = true;
    };
    ".config/btop" = {
      source = ./config/btop;
      recursive = true;
    };
    ".config/fastfetch" = {
      source = ./config/fastfetch;
      recursive = true;
    };
    ".config/mpv" = {
      source = ./config/mpv;
      recursive = true;
    };
    ".config/nvim" = {
      source = ./config/nvim;
      recursive = true;
    };
    ".config/ranger" = {
      source = ./config/ranger;
      recursive = true;
    };
  };
}
