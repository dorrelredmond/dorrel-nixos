{ config, pkgs, user, ... }: 
{
  imports = [
    ../../common/home
    ../../darwin/home
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "25.05";
  };
}
