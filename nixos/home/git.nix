{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      userName = "dorrelredmond";
      userEmail = "dorrelredmond@gmail.com";
    };
  };
}