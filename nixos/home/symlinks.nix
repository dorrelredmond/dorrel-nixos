{
  config,
  lib,
  ...
}: {
  home.file = {
    ".config/fastfetch" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/dotfiles/fastfetch/";
    };

    ".mozilla/firefox/default/chrome/userChrome.css" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/dotfiles/firefox/userChrome.css";
    };

    ".config/hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/dotfiles/hypr/";
    };

    ".config/Kvantum" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/dotfiles/Kvantum/";
    };

    ".config/mpv" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/dotfiles/mpv/";
    };

    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/dotfiles/nvim/";
    };

    ".config/qt5ct" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/dotfiles/qt5ct/";
    };

    ".config/qt6ct" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/dotfiles/qt6ct/";
    };

    ".config/quickshell" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/dotfiles/quickshell/";
    };

    ".config/rmpc" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/dotfiles/rmpc/";
    };

    ".config/rofi" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/dotfiles/rofi/";
    };

    ".config/rofimoji.rc" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/dotfiles/rofimoji.rc";
    };

    ".config/starship.toml" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/dotfiles/starship.toml";
    };

    ".config/swappy" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/dotfiles/swappy/";
    };

    ".config/swaync" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/dotfiles/swaync/";
    };
    
    ".config/Typora/themes" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/dotfiles/Typora/themes/";
    };

    ".config/Vencord/themes" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/dotfiles/Vencord/themes/";
    };

    ".config/waybar" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/dotfiles/waybar/";
    };

    ".config/wlogout" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/dotfiles/wlogout/";
    };

    ".config/yazi" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/dotfiles/yazi/";
    };

  };
}
