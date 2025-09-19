{ pkgs, config, ... }:
{
  services = {
    # Enable Pipewire for Audio
    security.rtkit.enable = true;
    pulseaudio.enable = false;
    pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };
  };
  
  # Audio Related Packages
  environment.systemPackages = with pkgs; [
    pavucontrol # audio controls
    qpwgraph  # PipeWire graph manager
    wireplumber
    playerctl
    pamixer
  ];
}