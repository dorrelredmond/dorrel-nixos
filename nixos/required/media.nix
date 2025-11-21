{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [
    inputs.spicetify-nix.nixosModules.spicetify
  ];

  # Media Packages
  environment.systemPackages = with pkgs; [
    # Reading
    calibre
    hakuneko

    # Music
    spotify
    mpd # music player daemon (required backend for rmpc)
    rmpc # Terminal Based Music Player
    cava # audio visualizer

    # Video
    mpv
    inputs.yt-x.packages."${system}".default # YouTube in the Terminal
    ani-cli # CLI tool to browse and play anime
  ];

  # Spicetify Configuration
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      beautifulLyrics
      autoSkipExplicit
      fullAppDisplay
      volumePercentage
    ];
    enabledCustomApps = with spicePkgs.apps; [
      marketplace # strictly used to browse available options easier
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
    alwaysEnableDevTools = true;
  };
}
