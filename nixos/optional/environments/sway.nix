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
    swayimg # image viewer
    
    # Utilities
    mako # notification system developed by swaywm maintainer

  ];
}