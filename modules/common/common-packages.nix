{ config, lib, pkgs, ... }:
{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [

        # Desktop Apps
        obsidian # note taking
        vesktop #discord alternative client
        discord
        alacritty #terminal
        chromium # browser
        firefox # browser
        krita
	    dropbox
	    spotify
        vscodium # text editor
        mpv # video player
        speedcrunch # Calculator

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
        gh
        git
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
