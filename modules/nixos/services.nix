{
  # Configure keymap in X11
  services.xserver.xkb = {
      layout = "us";
      variant = "";
  };

  services.udisks2.enable = true;
    
  # System Services Configuration
  services = {
    # Bluetooth Support
    blueman.enable = true;

    # Enable Printing
    printing.enable = true;

    # Enable pulseaudio for Audio
    pulseaudio.enable = false;

    # Enable SDDM 
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    displayManager.sddm.package = pkgs.kdePackages.sddm;

    # Enable Pipewire for Audio
    pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };
  };
}