{ config, pkgs, lib, ...}:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs = {
    appimage = {
      enable = true;
      binfmt = true;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
  };

  environment.systemPackages = with pkgs; [
    # CLI Tools
    wireplumber
    ntfs3g
    gvfs

    # GUI Applications & Tools
    solaar # logitech unified receiver settings
    bottles
    pavucontrol # audio controls
    hardinfo2 # System information and benchmarks for Linux systems
    nomacs-qt6 # image viewer
    feh # minimal image viewer
    strawberry # audio player
    protonvpn-gui # VPN Service
    kdePackages.isoimagewriter # Write hybrid ISO files onto USB disks
    kdePackages.partitionmanager # Manage the disk devices, partitions and file systems on your computer

    # User Styles
    kdePackages.qt6ct
    libsForQt5.qt5ct
    kdePackages.qtstyleplugin-kvantum # kavantum manager for styling
    nwg-look

    # Hyprland Tools & Applications
    hyprpolkitagent # PolicyKit
    hyprlock # lock screen
    hypridle # idle daemon
    hyprpicker # color picker
    hyprshot # screenshot utility
    hyprsysteminfo
    hyprcursor
    waybar_git
    mako # notification daemon
    libnotify # required by mako
    swww # wallpaper manager
    rofi-wayland
    wayland-utils # Wayland utilities
    wl-clipboard # Command-line copy/paste utilities for Wayland
    cliphist #clipboard manager
    kdePackages.dolphin # GUI File Manager
    networkmanagerapplet

  ];
}
