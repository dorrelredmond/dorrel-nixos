{ pkgs, ... }:
{

  # Enable Appimage Support
  programs = {
    appimage = {
      enable = true;
      binfmt = true;
    };
  };

  # Enable ADB support
  programs.adb.enable = true;
    
  # ADB udev rules
  services.udev.packages = [
    pkgs.android-udev-rules
  ];

  services.udisks2.enable = true;
  services.printing.enable = true;

  # Configure Flatpak
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  environment.systemPackages = with pkgs; [
    cmake
    
    # System Management
    home-manager
    font-manager
    protonvpn-gui
    
    # System Information and Monitoring
    hardinfo2
    
    # File Management
    ntfs3g
    gvfs
  ];
}