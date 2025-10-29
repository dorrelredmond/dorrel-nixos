{
  pkgs,
  config,
  ...
}: {
  # Enable Gamemode
  programs.gamemode.enable = true;

  # Enable Waydroid for Android app support
  virtualisation.waydroid.enable = true;

  # Gaming Related Packages
  environment.systemPackages = with pkgs; [
    # Game Launchers
    heroic # 3rd-Party Games Launcher
    r2modman # Thunderstore Mod Manager
    xivlauncher # Final Fantasy XIV Launcher
    modrinth-app
    #lutris

    # Prism Launcher Settings for Minecraft
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

    # Gaming Utilities
    protonup-ng # CLI Proton Installer
    protonup-qt # GUI Proton Installer
    mangohud
    waydroid-helper
    sgdboop

    # Games
    osu-lazer
    #superTux
    #superTuxKart
    #extremetuxracer
    #chromium-bsu
    #openarena
    #xonotic
    #gzdoom
    #enigma

    # Emulators
    #retroarch-full
    #ryubing
    #dolphin-emu
    #cemu
    #ppsspp
    #pcsx2
    #desmume
  ];

  # Steam Settings
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    gamescopeSession.enable = true;
  };

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/dorrel/.steam/root/compatibilitytools.d";
  };
}
