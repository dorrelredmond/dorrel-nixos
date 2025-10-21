{pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Menus
    rofi # powerful app launcher and menu
    rofimoji # emote picker using rofi
    
    # Image Tools
    grim # screenshot functionality
    slurp # screenshot functionality
    swappy # snapshot and editor tool
    swww # wallpaper manager

    # Clipboard Utils
    wl-clipboard # Command-line copy/paste utilities for Wayland
    wtype # fake keyboard/mouse input, window manager, etc for wayland
    cliphist #clipboard manager

    # Misc Packages
    wayland-utils # Wayland utilities
  ];
}