{ pkgs, config, lib, inputs, ... }:
{
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
    extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
  };
  
  #security Configuration
  security.pam.services.hyprlock = {};

  environment.systemPackages = with pkgs; [

    # File Management
    kdePackages.filelight
    kdePackages.partitionmanager
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.qtsvg # svg icon support in Dolphin
    kdePackages.kio-fuse # mount remote filesystems via FUSE in Dolphin
    kdePackages.kio-extras # extra protocols support (sftp, fish and more) in Dolphin

    # User Styles
    catppuccin
    catppuccin-kde
    papirus-folders
    papirus-icon-theme
    nwg-look
    libsForQt5.qt5ct
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum

    wayland-utils # Wayland utilities
    
    # Clipboard Utils
    wl-clipboard # Command-line copy/paste utilities for Wayland
    wtype # fake keyboard/mouse input, window manager, etc for wayland
    cliphist #clipboard manager


    # Hyprland Packges
    hyprpolkitagent # PolicyKit
    hyprlock # lock screen
    hypridle # idle daemon
    hyprpicker # color picker
    hyprsysteminfo
    hyprsunset
    hyprcursor
    grim
    slurp
    wlogout
    waybar
    eww #widget system
    swaynotificationcenter # notification daemon
    libnotify
    swww # wallpaper manager
    swappy # snapshot and editor tool
    rofi # powerful app launcher and menu
    rofimoji # emote picker using rofi
  ];
}