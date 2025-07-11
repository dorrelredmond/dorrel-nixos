{ pkgs, ... }:
{
    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [

    # Desktop Apps
    obsidian
    vesktop
    discord
    pavucontrol

    # CLI Tools
    protonup
    wget
    alejandra
    ffmpeg
    unzip
    yt-dlp
    zip
    ntfs3g
    ];
}
