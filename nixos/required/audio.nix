{
  pkgs,
  config,
  ...
}: {
  security.rtkit.enable = true;

  # Configure Pipewire for Audio
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      wireplumber.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  # Audio Related Packages
  environment.systemPackages = with pkgs; [
    wireplumber
    playerctl
    pamixer
    noisetorch
  ];

  #services.pipewire.extraConfig.pipewire."91-null-sinks" = {
  #  "context.objects" = [
  #    {
  #      # A default dummy driver. This handles nodes marked with the "node.always-driver"
  #      # property when no other driver is currently active. JACK clients need this.
  #      factory = "spa-node-factory";
  #      args = {
  #        "factory.name" = "support.node.driver";
  #        "node.name" = "Dummy-Driver";
  #        "priority.driver" = 8000;
  #      };
  #    }
  #    {
  #      factory = "adapter";
  #      args = {
  #        "factory.name" = "support.null-audio-sink";
  #        "node.name" = "Microphone-Proxy";
  #        "node.description" = "Microphone";
  #        "media.class" = "Audio/Source/Virtual";
  #        "audio.position" = "MONO";
  #      };
  #    }
  #    {
  #      factory = "adapter";
  #      args = {
  #        "factory.name" = "support.null-audio-sink";
  #        "node.name" = "Main-Output-Proxy";
  #        "node.description" = "Main Output";
  #        "media.class" = "Audio/Sink";
  #        "audio.position" = "FL,FR";
  #      };
  #    }
  #  ];
  #};

}
