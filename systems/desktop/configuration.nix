{ pkgs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./local-packages.nix
    ../../modules/nixos
  ];

  environment.systemPackages = [ pkgs.home-manager ];

  networking.hostName = "desktop";

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  # nvidia hardware settings
  hardware.nvidia = {
    open = true;
    modesetting.enable = true; # Modesetting is required.
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    nvidiaSettings = true; # Nvidia Settings Menu accessible via `nvidia-settings`
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  system.stateVersion = "25.05";
}
