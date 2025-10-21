{ config, pkgs, ... }:
{
  services.desktopManager.gnome.enable = true;

  # To disable installing GNOME's suite of applications
  # and only be left with GNOME shell.
  #services.gnome.core-apps.enable = false;
  #services.gnome.core-developer-tools.enable = false;
  #services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour 
    gnome-user-docs
  ];

  # Gnome Specific Packages
  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.arc-menu
    gnomeExtensions.pop-shell

    gnome-tweaks
    gnome-extension-manager
  ];
}
