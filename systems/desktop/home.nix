{ config, pkgs, user, ... }: 
{
  imports = [
    ../../common/home
    ../../nixos/home
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
