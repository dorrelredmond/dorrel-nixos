{ pkgs, ... }:
{
  # Configure keymap in X11
  services.xserver.xkb = {
      layout = "us";
      variant = "";
  };

  # ADB udev rules
  services.udev.packages = [
    pkgs.android-udev-rules
  ];


  services.udisks2.enable = true;
    
  # System Services Configuration
  services = {
    # Enable Printing
    printing.enable = true;

    # Enable pulseaudio for Audio
    pulseaudio.enable = false;

    # Enable SDDM & KDE
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;

    # Enable Pipewire for Audio
    pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };
  };

  # Configure Flatpak
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
