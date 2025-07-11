{
  config,
  pkgs,
  ...
}:
{
    # Enable OpenGL
    hardware.graphics.enable = true;

    # Load nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
        open = true;
        modesetting.enable = true; # Modesetting is required.
        powerManagement.enable = true;
        powerManagement.finegrained = false;
        nvidiaSettings = true; # Nvidia Settings Menu accessible via `nvidia-settings`
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
}
