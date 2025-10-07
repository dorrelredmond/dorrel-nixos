{ pkgs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./mounts.nix
    ../../common
    ../../nixos/required
    ../../nixos/optional/vr
    ../../nixos/optional/graphics/nvidia.nix
    ../../nixos/optional/gaming.nix
    ../../nixos/optional/services.nix
  ];

  networking.hostName = "desktop";

  # Enable Logitech Hardware Support
  hardware.logitech.wireless.enable = true;
  
  # Machine Specific Packages
  environment.systemPackages = with pkgs; [
    solaar # logitech unified receiver settings
  ];

  system.stateVersion = "25.05";
}
