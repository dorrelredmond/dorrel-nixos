{ pkgs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./mounts.nix
    ../../nixos/required
    ../../nixos/optional/graphics/nvidia.nix
    
    # Display Manager & Desktop Environment
    ../../nixos/optional/loginManager/sddm.nix
    ../../nixos/optional/environments/hyprland.nix
    ../../nixos/optional/environments/gnome.nix
    ../../nixos/optional/environments/sway.nix
    ../../nixos/optional/apps/qt-apps.nix
    ../../nixos/optional/apps/wayland-apps.nix
    
    # Misc Packages
    ../../nixos/optional/vr
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
