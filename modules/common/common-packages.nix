{ config, lib, pkgs, inputs, ... }:
let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
 
    nixpkgs.config.allowUnfree = true;

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

    environment.systemPackages = with pkgs; [

        # Desktop Apps
        firefox # web browser
        vesktop #discord alternative client
        discord
	      spotify
        vscodium # text editor
        mpv # video player
	      qbittorrent
        zathura # PDF viewer
        thunderbird # email client
        kitty # terminal emulator

        # CLI Tools
        starship
        eza
        gh
        wget
        alejandra
        ffmpeg
        unzip
        yt-dlp
        zip
        bat
        fastfetch
	      imagemagick

        # TUI Tools
        btop
        lazygit
        neovim
        cava
        ranger # file manager
        w3m # mostly for image previews in ranger

    ];
}
