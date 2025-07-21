{ config, pkgs, lib, inputs, ...}:
{

  imports = [ 
      inputs.spicetify-nix.nixosModules.spicetify # spicetify config in common folder
  ];

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
    pamixer
    catppuccinifier-cli

    # GUI Applications & Tools
    dropbox
    chromium # browser
    solaar # logitech unified receiver settings
    bottles
    krita
    obsidian # note taking
    pavucontrol # audio controls
    hardinfo2 # System information and benchmarks for Linux systems
    kdePackages.gwenview # image viewer
    feh # minimal image viewer
    strawberry # audio player
    protonvpn-gui # VPN Service
    kdePackages.isoimagewriter # Write hybrid ISO files onto USB disks
    kdePackages.partitionmanager # Manage the disk devices, partitions and file systems on your computer
    kdePackages.kcharselect
    font-manager
    catppuccinifier-gui
    qpwgraph # pipewire patchbay
    rofimoji # emote picker using rofi

    # User Styles
    catppuccin
    papirus-folders
    nwg-look
    libsForQt5.qt5ct
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum

    # System Packages
    hyprpolkitagent # PolicyKit
    hyprlock # lock screen
    hypridle # idle daemon
    hyprpicker # color picker
    hyprshot # screenshot utility
    hyprsysteminfo
    hyprcursor
    wlogout
    playerctl
    waybar_git
    swaynotificationcenter # notification daemon
    libnotify # required by mako
    swww # wallpaper manager
    rofi-wayland
    wayland-utils # Wayland utilities
    wl-clipboard # Command-line copy/paste utilities for Wayland
    wtype # fake keyboard/mouse input, window manager, etc for wayland
    cliphist #clipboard manager
    networkmanagerapplet
    kdePackages.dolphin # GUI File Manager
    kdePackages.qtsvg # svg icon support in Dolphin
    kdePackages.kio-fuse #to mount remote filesystems via FUSE in Dolphin
    kdePackages.kio-extras #extra protocols support (sftp, fish and more) in Dolphin
    
  ];

}
