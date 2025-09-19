{ pkgs, config, lib, ... }:
{
  # GPU driver
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
}