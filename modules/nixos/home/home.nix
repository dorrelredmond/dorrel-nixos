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
    ".config/calibre" = {
      source = ./config/calibre;
      recursive = true;
    };
    ".config/hypr" = {
      source = ./config/hypr;
      recursive = true;
    };
    ".config/Kvantum" = {
      source = ./config/Kvantum;
      recursive = true;
    };
    ".config/pipewire" = {
      source = ./config/pipewire;
      recursive = true;
    };
    ".config/qBittorrent" = {
      source = ./config/qBittorrent;
      recursive = true;
    };
    ".config/qt5ct" = {
      source = ./config/qt5ct;
      recursive = true;
    };
    ".config/qt6ct" = {
      source = ./config/qt6ct;
      recursive = true;
    };
    ".config/solaar" = {
      source = ./config/solaar;
      recursive = true;
    };
    ".config/strawberry" = {
      source = ./config/strawberry;
      recursive = true;
    };
    ".config/swappy" = {
      source = ./config/swappy;
      recursive = true;
    };
    ".config/swaync" = {
      source = ./config/swaync;
      recursive = true;
    };
    ".config/waybar" = {
      source = ./config/waybar;
      recursive = true;
    };
    ".config/zathura" = {
      source = ./config/zathura;
      recursive = true;
    };
    ".config/rofimoji.rc" = {
      source = ./config/rofimoji.rc;
    };
  };
}
