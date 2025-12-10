{
  pkgs,
  config,
  ...
}: {

  imports = [ 
    #aagl.nixosModules.default 
  ];

  nix.settings = {
    substituters = ["https://ezkea.cachix.org"];
    trusted-public-keys = ["ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="];
  };

  # Enable Gamemode
  programs.gamemode.enable = true;

  # Enable Waydroid for Android app support
  virtualisation.waydroid.enable = true;

  # An Anime Team Game Launchers - Adds launcher and /etc/hosts rules
  #programs.anime-games-launcher.enable = true; # Universal Launcher
  programs.anime-game-launcher.enable = true;
  programs.honkers-railway-launcher.enable = true;
  programs.honkers-launcher.enable = true;
  programs.sleepy-launcher.enable = true;
  #programs.wavey-launcher.enable = true;

  # Gaming Related Packages
  environment.systemPackages = with pkgs; [
    # Generic Game Launchers
    heroic # 3rd-Party Games Launcher
    #r2modman # Thunderstore Mod Manager

    # Individual Games/Launchers
    osu-lazer
    vintagestory # voxel sandbox adventure
    xivlauncher # Final Fantasy XIV Launcher
    airshipper # Veloren Launcher
    luanti # formerly Minetest
    #modrinth-app # Minecraft Launcher

    # Prism Launcher Settings for Minecraft
    (prismlauncher.override {
      # Add binary required by some mods
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
