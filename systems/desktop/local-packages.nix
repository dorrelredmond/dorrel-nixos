{ pkgs, ... }: {

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

  # General Packages
  environment.systemPackages = with pkgs; [    
    # CLI
    protonup
    
    # Gaming Applications & Tools
    protonup-qt
    heroic
    r2modman

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
}
