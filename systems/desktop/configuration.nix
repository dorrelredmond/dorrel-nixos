{ pkgs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./local-packages.nix
    ../../modules/nixos
  ];

  # Add Media Drive `/dev/sdc1`
  fileSystems."/mnt/media" = { 
    device = "/dev/disk/by-uuid/5BEA62CB-F420-88BC-EAE2-50F3780C9616";
    fsType = "none";
    options = [
      "nofail"
    ];
  };

  environment.systemPackages = [ pkgs.home-manager ];

  networking.hostName = "desktop";

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  environment.sessionVariables = {
    # If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

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
