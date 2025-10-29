{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  # Environment Variables
  environment.variables.QT_QPA_PLATFORMTHEME = "qt5ct";

  # Hyprland Window Manager Configuration
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # XDG Portal Settings
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.kdePackages.xdg-desktop-portal-kde];
  };

  nix.settings = {
    # Substituers
    substituters = [
      "https://hyprland.cachix.org"
    ];
    trusted-substituters = [
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  #security Configuration
  security.pam.services.hyprlock = {};

  environment.systemPackages = with pkgs; [
    # Images & Documents
    kdePackages.okular # document viewer
    #kdePackages.gwenview # image viewer
    feh # minimal image viewer
    grim # screenshot functionality
    slurp # screenshot functionality
    swappy # snapshot and editor tool
    swww # wallpaper manager

    # File Management
    kdePackages.ark
    kdePackages.filelight
    kdePackages.partitionmanager
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.qtsvg # svg icon support in Dolphin
    kdePackages.kio-fuse # mount remote filesystems via FUSE in Dolphin
    kdePackages.kio-extras # extra protocols support (sftp, fish and more) in Dolphin
    kdePackages.ffmpegthumbs

    # User Styles
    catppuccin
    catppuccin-kde
    papirus-folders
    papirus-icon-theme
    nwg-look
    libsForQt5.qt5ct
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum

    # Menus
    rofi # powerful app launcher and menu
    rofimoji # emote picker using rofi

    # Clipboard Utils
    wl-clipboard # Command-line copy/paste utilities for Wayland
    wtype # fake keyboard/mouse input, window manager, etc for wayland
    cliphist #clipboard manager
    
    # Notifications
    libnotify # notification daemon
    swaynotificationcenter # notification daemon

    # Panels & Widgets
    waybar
    quickshell

    # Hyprland Packges
    hyprpolkitagent # PolicyKit
    hyprlock # lock screen
    hypridle # idle daemon
    hyprpicker # color picker
    wlogout
    hyprsunset
    hyprcursor

    # Misc Packages
    wayland-utils # Wayland utilities
    kdePackages.kcalc # Calculator
  ];
}
