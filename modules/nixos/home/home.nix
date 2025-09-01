{ config, pkgs, inputs, user, ... }: 
let 
  configPath = "/home/dorrel/dorrel-nixos/modules/nixos/home";
in 
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
      source = config.lib.file.mkOutOfStoreSymlink "${configPath}/config/calibre";
      recursive = true;
    };
    ".config/hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink "${configPath}/config/hypr";
      recursive = true;
    };
    ".config/Kvantum" = {
      source = config.lib.file.mkOutOfStoreSymlink "${configPath}/config/Kvantum";
      recursive = true;
    };
    ".config/pipewire" = {
      source = config.lib.file.mkOutOfStoreSymlink "${configPath}/config/pipewire";
      recursive = true;
    };
    ".config/qBittorrent" = {
      source = config.lib.file.mkOutOfStoreSymlink "${configPath}/config/qBittorrent";
      recursive = true;
    };
    ".config/qt5ct" = {
      source = config.lib.file.mkOutOfStoreSymlink "${configPath}/config/qt5ct";
      recursive = true;
    };
    ".config/qt6ct" = {
      source = config.lib.file.mkOutOfStoreSymlink "${configPath}/config/qt6ct";
      recursive = true;
    };
    ".config/solaar" = {
      source = config.lib.file.mkOutOfStoreSymlink "${configPath}/config/solaar";
      recursive = true;
    };
    ".config/strawberry" = {
      source = config.lib.file.mkOutOfStoreSymlink "${configPath}/config/strawberry";
      recursive = true;
    };
    ".config/swappy" = {
      source = config.lib.file.mkOutOfStoreSymlink "${configPath}/config/swappy";
      recursive = true;
    };
    ".config/swaync" = {
      source = config.lib.file.mkOutOfStoreSymlink "${configPath}/config/swaync";
      recursive = true;
    };
    ".config/waybar" = {
      source = config.lib.file.mkOutOfStoreSymlink "${configPath}/config/waybar";
      recursive = true;
    };
    ".config/zathura" = {
      source = config.lib.file.mkOutOfStoreSymlink "${configPath}/config/zathura";
      recursive = true;
    };
    ".config/rofimoji.rc" = {
      source = config.lib.file.mkOutOfStoreSymlink "${configPath}/config/rofimoji.rc";
    };
  };
}
