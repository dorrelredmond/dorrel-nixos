{pkgs, ...}: {
  # Boot Loader Configurations
  boot.loader = {
    systemd-boot = {
      enable = true;
      consoleMode = "max";
    };
    efi.canTouchEfiVariables = true;
  };

  # NTFS Support
  boot.supportedFilesystems = ["ntfs"];

  # Use Latest Linux Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # TTY Settings
  console = {
    earlySetup = true;
    packages = with pkgs; [terminus_font];
    font = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
  };
}
