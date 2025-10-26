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
    kdePackages.okular
    kdePackages.gwenview
    kdePackages.ffmpegthumbs
    feh # minimal image viewer

    # File Management
    kdePackages.ark
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

    # Notifications
    libnotify # notification daemon
    swaynotificationcenter # notification daemon

    # Panels
    waybar

    # Hyprland Packges
    hyprpolkitagent # PolicyKit
    hyprlock # lock screen
    hypridle # idle daemon
    hyprpicker # color picker
    #hyprsysteminfo
    wlogout
    hyprsunset
    hyprcursor
  ];
}
