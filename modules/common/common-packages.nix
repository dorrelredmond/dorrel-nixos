{ config, lib, pkgs, ... }:
{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [

        # Desktop Apps
        vesktop #discord alternative client
        discord
        alacritty #terminal
        firefox # browser
	    spotify
        vscodium # text editor
        mpv # video player
        speedcrunch # Calculator
	    qbittorrent

        # CLI Tools
        git
        gh
        wget
        alejandra
        ffmpeg
        unzip
        yt-dlp
        zip
        bat
        eza
        fastfetch
        fish
        starship
	    imagemagick

        # TUI Tools
        btop
        lazygit
        neovim
        cava
        ranger # file manager

    ];
}
