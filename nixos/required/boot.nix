{ pkgs, ... }:
{
  # Boot Loader Configurations
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # NTFS Support
  boot.supportedFilesystems = ["ntfs"];

  # Use Latest Linux Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
}