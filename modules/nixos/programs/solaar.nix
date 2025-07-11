{ config, pkgs, lib, ...}:
{
    # Enable Logitech Hardware Support
    hardware.logitech.wireless.enable = true;

  environment.systemPackages = [
    pkgs.solaar
  ];
}
