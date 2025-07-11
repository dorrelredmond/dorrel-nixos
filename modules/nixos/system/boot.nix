{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # NTFS Support
  boot.supportedFilesystems = ["ntfs"];
}
