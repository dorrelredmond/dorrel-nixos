{
  imports = [
    ./programs
  ];

  # Set File Locations for configuration files that do not work or are more difficult to setup with Nix
  home.file = {
    "bat" = {
      source = ./config/bat;
      recursive = true;
    };
    "btop" = {
      source = ./config/btop;
      recursive = true;
    };
    "fastfetch" = {
      source = ./config/fastfetch;
      recursive = true;
    };
    "mpv" = {
      source = ./config/mpv;
      recursive = true;
    };
    "nvim" = {
      source = ./config/nvim;
      recursive = true;
    };
    "ranger" = {
      source = ./config/ranger;
      recursive = true;
    };
  };
}
