{ config, lib, pkgs, inputs, ... }:
let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
    # Media Packages
    environment.systemPackages = with pkgs; [
	      spotify
        mpv # video player
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
