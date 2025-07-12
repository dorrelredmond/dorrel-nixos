{ config, pkgs, lib, ...}:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Logitech Hardware Support
  hardware.logitech.wireless.enable = true;

  environment.systemPackages = with pkgs; [
    solaar
    bottles
  ];
}
