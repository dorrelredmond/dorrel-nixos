{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./mounts.nix
    ../../nixos/required
    ../../nixos/optional/graphics/nvidia.nix

    # Display Manager & Desktop Environment
    ../../nixos/optional/loginManager/sddm.nix
    ../../nixos/optional/environments/hyprland.nix

    # Misc Packages
    ../../nixos/optional/vr
    ../../nixos/optional/gaming.nix
    ../../nixos/optional/services.nix
  ];

  networking.hostName = "desktop";

  # Enable Logitech Hardware Support
  hardware.logitech.wireless.enable = true;

  # Enable ratbagd mouse support for MMO mouse
  services.ratbagd.enable = true;

  # Machine Specific Packages
  environment.systemPackages = with pkgs; [
    solaar # logitech unified receiver settings
    piper # gtk frontend for ratbagd mouse configs
  ];

  system.stateVersion = "25.05";
}
