{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  imports = [
    ../apps/qt-apps.nix
  ];

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
    zathura # minimal pdf viewer
    imv # miniminal image viewer
    grim # screenshot functionality
    slurp # screenshot functionality
    swappy # snapshot and editor tool
    swww # wallpaper manager

    # File Management
    kdePackages.partitionmanager
    lxqt.pcmanfm-qt
    lxqt.lxqt-archiver
    lxqt.qtxdg-tools
    lxqt.lxqt-menu-data
    shared-mime-info
    kdePackages.qtimageformats

    # User Styles
    catppuccin
    catppuccin-qt5ct
    papirus-folders
    papirus-icon-theme
    nwg-look # GTK Theming
    libsForQt5.qt5ct
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum

    # Menus
    rofi # powerful app launcher and menu
    rofimoji # emote picker using rofi

    # Clipboard Utils
    wl-clipboard # Command-line copy/paste utilities for Wayland
    wtype # fake keyboard/mouse input, window manager, etc for wayland
    cliphist # clipboard manager

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
    hyprsunset
    hyprcursor

    # Misc Packages
    wayland-utils # Wayland utilities
    speedcrunch # Calculator
    lxqt.pavucontrol-qt # Pulseaudio Mixer
  ];
}
