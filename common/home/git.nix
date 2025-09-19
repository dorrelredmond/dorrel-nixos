{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "dorrelredmond";
    userEmail = "dorrelredmond@gmail.com";
  };
}