{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./mounts.nix
    ../nixos/modules
  ];

  networking.hostName = "Amethyst";

  # Enable Logitech Hardware Support
  hardware.logitech.wireless.enable = true;

  # Enable ratbagd mouse support for MMO mouse
  #services.ratbagd.enable = true;

  # Machine Specific Packages
  environment.systemPackages = with pkgs; [
    solaar # logitech unified receiver settings
    #piper # gtk frontend for ratbagd mouse configs
  ];

  system.stateVersion = "25.05";
}
