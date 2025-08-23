{ config, pkgs, inputs, user, ... }: 
{
  imports = [
    ./catppuccin.nix
    ../../common/home
    ./programs
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "25.05";
  };

  # Set File Locations for configuration files that do not work or are more difficult to setup with Nix
  home.file = {
    "calibre" = {
      source = ./config/calibre;
      recursive = true;
    };
    "hypr" = {
      source = ./config/hypr;
      recursive = true;
    };
    "Kvantum" = {
      source = ./config/Kvantum;
      recursive = true;
    };
    "pipewire" = {
      source = ./config/pipewire;
      recursive = true;
    };
    "qBittorrent" = {
      source = ./config/qBittorrent;
      recursive = true;
    };
    "qt5ct" = {
      source = ./config/qt5ct;
      recursive = true;
    };
    "qt6ct" = {
      source = ./config/qt6ct;
      recursive = true;
    };
    "solaar" = {
      source = ./config/solaar;
      recursive = true;
    };
    "strawberry" = {
      source = ./config/strawberry;
      recursive = true;
    };
    "swappy" = {
      source = ./config/swappy;
      recursive = true;
    };
    "swaync" = {
      source = ./config/swaync;
      recursive = true;
    };
    "waybar" = {
      source = ./config/waybar;
      recursive = true;
    };
    "zathura" = {
      source = ./config/zathura;
      recursive = true;
    };
    "rofimoji.rc" = {
      source = ./config/rofimoji.rc;
    };
  };
}
