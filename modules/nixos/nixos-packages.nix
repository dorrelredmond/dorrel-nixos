{ config, pkgs, lib, inputs, ...}:
{
  imports = [ 
      inputs.spicetify-nix.nixosModules.spicetify # spicetify config in common folder
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Appimage Support
  programs = {
    appimage = {
      enable = true;
      binfmt = true;
    };
  };

  # Hyprland Window Manager Configuration
  programs.hyprland = {
      enable = true;
      # set the flake package
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      # make sure to also set the portal package, so that they are in sync
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
  };

  # XDG Portal Settings
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
  };

  environment.systemPackages = with pkgs; [
    # CLI Tools
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
    feh # minimal image viewer
    strawberry # audio player
    protonvpn-gui # VPN Service
    kdePackages.isoimagewriter # Write hybrid ISO files onto USB disks
    kdePackages.partitionmanager # Manage the disk devices, partitions and file systems on your computer
    font-manager
    qpwgraph # pipewire patchbay
    rofimoji # emote picker using rofi
    swappy # snapshot and editor tool

    # User Styles
    catppuccin
    papirus-folders
    nwg-look
    libsForQt5.qt5ct
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum

    # System Packages
    wireplumber
    ntfs3g
    gvfs
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
    playerctl
    waybar_git
    eww #widget system
    swaynotificationcenter # notification daemon
    libnotify
    swww # wallpaper manager
    rofi-wayland
    wayland-utils # Wayland utilities
    wl-clipboard # Command-line copy/paste utilities for Wayland
    wtype # fake keyboard/mouse input, window manager, etc for wayland
    cliphist #clipboard manager
    kdePackages.dolphin # GUI File Manager
    kdePackages.qtsvg # svg icon support in Dolphin
    kdePackages.kio-fuse #to mount remote filesystems via FUSE in Dolphin
    kdePackages.kio-extras #extra protocols support (sftp, fish and more) in Dolphin
    
  ];

}
