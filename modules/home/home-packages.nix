{ pkgs, ... }:
{
    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [

        # Desktop Apps
        obsidian
        vesktop
        discord
        vesktop
        alacritty
        chromium
        firefox
	krita

        # CLI Tools
        protonup
        wget
        alejandra
        ffmpeg
        unzip
        yt-dlp
        zip
        ntfs3g
        bat
        eza
        fastfetch
        fish
        gh
        git
        starship

        # TUI Tools
        btop
        lazygit
        neovim
	cava

    ];
}
