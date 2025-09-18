{ pkgs, config, ... }: {
  # General Packages
  environment.systemPackages = with pkgs; [    
    # CLI
    protonup
    
    # Gaming Applications & Tools
    protonup-qt # GUI Proton Installer
    heroic # 3rd-Party Games Launcher
    r2modman # Thunderstore Mod Manager
    xivlauncher # Final Fantasy XIV Launcher
    wlx-overlay-s # VR Desktop Overlay

    (prismlauncher.override {
     # Add binary required by some mod
     additionalPrograms = [ffmpeg];

     # Change Java runtimes available to Prism Launcher
     jdks = [
       temurin-jre-bin-8 # Eclipse Teurmin openJDK version 8
       temurin-jre-bin-17 # Eclipse Teurmin openJDK version 17
       temurin-jre-bin # Eclipse Teurmin openJDK version 21
     ];
    })
  ];

  # Configure WiVRn for OpenXR streaming to standalone headsets (i.e., Quest 3)
  services.wivrn = {
    enable = true;
    openFirewall = true;

    # Write information to /etc/xdg/openxr/1/active_runtime.json, VR applications
    # will automatically read this and work with WiVRn (Note: This does not currently
    # apply for games run in Valve's Proton)
    defaultRuntime = true;

    # Run WiVRn as a systemd service on startup
    autoStart = true;

    # Config for WiVRn (https://github.com/WiVRn/WiVRn/blob/master/docs/configuration.md)
    config = {
      enable = true;
      json = {
        application = [ pkgs.wlx-overlay-s ];
        # 20% foveation scaling
        scale = 0.8;
        # 120 Mbit/s
        bitrate = 120000000;
        encoders = [
          {
            height = 0.25;
            offset_x = 0.0;
            offset_y = 0.75;
            width = 0.5;
          }
          {
            height = 0.75;
            offset_x = 0.0;
            offset_y = 0.0;
            width = 0.5;
          }
          {
            codec = "h264";
            encoder = "x264";
            height = 1.0;
            offset_x = 0.5;
            offset_y = 0.0;
            width = 0.5;
          }
        ];
      };
    };
  };

  programs = {
    gamemode.enable = true;
    firefox.enable = true;

    # Steam Settings
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
      gamescopeSession.enable = true;
    };
  };

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/dorrel/.steam/root/compatibilitytools.d";
  };
}
