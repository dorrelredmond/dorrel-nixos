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
    git
    gh
    wireplumber

    # TUI Tools
    neovim

    # GUI Applications & Tools
    solaar # logitech unified receiver settings
    bottles
    pavucontrol # audio controls
    hardinfo2 # System information and benchmarks for Linux systems
    kdePackages.kate
    kdePackages.qt6ct
    libsForQt5.qt5ct
    kdePackages.qtstyleplugin-kvantum # kavantum manager for styling

    # Hyprland Tools & Applications
    (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental = true" ];
      }) # system panel
    )
    mako # notification daemon
    libnotify # required by mako
    swww # wallpaper manager
    rofi-wayland
    wayland-utils # Wayland utilities
    wl-clipboard # Command-line copy/paste utilities for Wayland
    cliphist #clipboard manager
    kdePackages.dolphin # GUI File Manager

  ];
}
