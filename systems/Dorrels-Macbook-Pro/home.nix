{ config, pkgs, ... }: 
{
  imports = [
    ../../common/home
    ../../darwin/home
  ];

  home = {
    username = "dorrelredmond";
    homeDirectory = "/Users/dorrelredmond";
    stateVersion = "25.05";
  };
}
