{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./local-packages.nix
    ./nvidia.nix
    ../../modules/nixos
  ];

  environment.systemPackages = [ pkgs.home-manager ];

  networking.hostName = "desktop";

  system.stateVersion = "25.05";
}
