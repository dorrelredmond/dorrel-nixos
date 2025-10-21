{ config, lib, pkgs, inputs, ... }:
let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  imports = [ 
      inputs.spicetify-nix.nixosModules.spicetify
  ];

  # Media Packages
  environment.systemPackages = with pkgs; [
    # Music
    spotify
    rmpc # Terminal Based Music Player
    
    # Video
    mpv
    inputs.yt-x.packages."${system}".default # YouTube in the Terminal
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