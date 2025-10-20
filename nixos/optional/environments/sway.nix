{ config, pkgs, lib, ... }:
{
  # enable Sway window manager
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  security.pam.services.swaylock = {};
  security.polkit.enable = true;

  # Enable the gnome-keyring secrets vault. 
  # Will be exposed through DBus to programs willing to store secrets.
  services.gnome.gnome-keyring.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Image Tools
    grim # screenshot functionality
    slurp # screenshot functionality
    swappy # snapshot and editor tool
    swww # wallpaper manager
    swayimg # image viewer
    
    # Text Tools
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    
    # Utilities
    mako # notification system developed by swaywm maintainer
    

  ];
}