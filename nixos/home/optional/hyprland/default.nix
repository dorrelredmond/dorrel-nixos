{
  config,
  lib,
  ...
}: {
  home.file = {
    ".config/hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/optional/hyprland/hypr";
    };

    ".config/Kvantum" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/optional/hyprland/Kvantum";
    };

    ".config/qt5ct" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/optional/hyprland/qt5ct";
    };

    ".config/qt6ct" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/optional/hyprland/qt6ct";
    };

    ".config/quickshell" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/optional/hyprland/quickshell";
    };

    ".config/rofi" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/optional/hyprland/rofi";
    };

    ".config/rofimoji.rc" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/optional/hyprland/rofimoji.rc";
    };

    ".config/swappy" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/optional/hyprland/swappy";
    };

    ".config/swaync" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/optional/hyprland/swaync";
    };
  };
}
