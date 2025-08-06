{
  # Boot Configurations
  boot =
  {
      # Bootloader.
      loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
      };

      # NTFS Support
      supportedFilesystems = ["ntfs"];

      # Select Kernel
      kernelPackages = pkgs.linuxPackages_latest;
  };
}