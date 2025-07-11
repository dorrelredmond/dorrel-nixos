{ config, pkgs, ...}:
{
  environment.systemPackages = [
    pkgs.bottles
  ];
}
