{ pkgs, ... }: {

  programs = {
    gamemode.enable = true;
    firefox.enable = true;
  };

  # Steam Settings
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    gamescopeSession.enable = true;
  };

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/user/.steam/root/compatibilitytools.d";
  };

  # General Packages
  environment.systemPackages = with pkgs; [

    # KDE Tools
    kdePackages.kate
    kdePackages.kcalc # Calculator
    kdePackages.kcharselect # Tool to select and copy special characters from all installed fonts
    kdePackages.kcolorchooser # A small utility to select a color
    kdePackages.kolourpaint # Easy-to-use paint program
    kdePackages.ksystemlog # KDE SystemLog Application
    kdePackages.sddm-kcm # Configuration module for SDDM
    kdiff3 # Compares and merges 2 or 3 files or directories
    kdePackages.isoimagewriter # Optional: Program to write hybrid ISO files onto USB disks
    kdePackages.partitionmanager # Optional Manage the disk devices, partitions and file systems on your computer
    hardinfo2 # System information and benchmarks for Linux systems
    wayland-utils # Wayland utilities
    wl-clipboard # Command-line copy/paste utilities for Wayland

    # Gaming Applications & Tools
    protonup
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
