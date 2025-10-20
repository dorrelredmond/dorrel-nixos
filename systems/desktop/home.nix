{ config, pkgs, user, ... }: 
{
  imports = [
    ../../nixos/home/required
    ../../nixos/home/optional/hyprland_kde
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    preferXdgDirectories = true;
    stateVersion = "25.05";
  };

  xdg = {
    enable = true;
    autostart.enable = true;
  };
}
