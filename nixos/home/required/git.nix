{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "dorrelredmond";
      user.email = "dorrelredmond@gmail.com";
    };
  };
}