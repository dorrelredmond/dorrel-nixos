{ pkgs, config, lib, inputs, ... }:
{
  # Environment Variables
  environment.variables.QT_QPA_PLATFORMTHEME = "qt5ct";
  environment.variables.EDITOR = "nvim";

  # This is using a rec (recursive) expression to set and access XDG_BIN_HOME within the expression
  # For more on rec expressions see https://nix.dev/tutorials/first-steps/nix-language#recursive-attribute-set-rec
  environment.sessionVariables = rec {
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_STATE_HOME  = "$HOME/.local/state";

    # Not officially in the specification
    XDG_BIN_HOME    = "$HOME/.local/bin";
    PATH = [ 
      "${XDG_BIN_HOME}"
    ];
  };

  environment.sessionVariables = {
    # If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };
  
  # Enable the X11 Windowing System
  #services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment
  services = {
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
  };

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

  # Exclude Specific KDE Packages
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    kate
  ];

  # Common Desktop Packages
  environment.systemPackages = with pkgs; [
    # Office and Productivity
    libreoffice
    obsidian

    # Graphics
    krita
    inkscape
    darktable
    gimp3

    # KDE Packages
    kdePackages.kcalc # Calculator
    kdePackages.kcharselect # Tool to select and copy special characters from all installed fonts
    kdePackages.kclock # Clock app
    kdePackages.kcolorchooser # A small utility to select a color
    kdePackages.kolourpaint # Easy-to-use paint program
    kdePackages.ksystemlog # KDE SystemLog Application
    kdePackages.sddm-kcm # Configuration module for SDDM
    kdiff3 # Compares and merges 2 or 3 files or directories
    kdePackages.isoimagewriter # Program to write hybrid ISO files onto USB disks

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

  #security Configuration
  security = {
      polkit.enable = true;
      pam.services.hyprlock = {};
  };

}