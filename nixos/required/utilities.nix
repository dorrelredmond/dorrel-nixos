{pkgs, ...}: {
  # Enable Appimage Support
  programs = {
    appimage = {
      enable = true;
      binfmt = true;
    };
  };

  # Enable ADB support
  programs.adb.enable = true;

  services.udisks2.enable = true;
  services.printing.enable = true;

  # Configure Flatpak
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    path = [pkgs.flatpak];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  # Custom Fonts
  fonts = {
    packages = with pkgs; [
      # Noto Fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      noto-fonts-color-emoji
      noto-fonts-monochrome-emoji

      # Hans Sans Fonts
      source-han-sans
      source-han-sans-japanese
      source-han-serif-japanese

      # Nerd Fonts
      nerd-fonts.iosevka
      nerd-fonts.fira-code
      nerd-fonts.liberation
      nerd-fonts.sauce-code-pro
      nerd-fonts.mononoki
      nerd-fonts.fantasque-sans-mono
      nerd-fonts.hack

      # Misc Fonts
      font-awesome
    ];

    fontconfig.defaultFonts = {
      serif = ["Noto Serif" "Source Han Serif"];
      sansSerif = ["Noto Sans" "Source Han Sans"];
    };
  };

  environment.systemPackages = with pkgs; [
    kitty # terminal emulatoror
    qbittorrent

    # System Information and Monitoring
    fastfetch
    btop

    # Graphics
    blender
    scribus
    darktable
    inkscape

    # Fun Utilities
    sl
    lolcat

    # File Management
    yazi
    unzip
    zip

    # Media Tools
    ffmpeg
    imagemagick
    yt-dlp
    cava
    handbrake
    tenacity

    # Misc CLI Tools
    starship
    eza
    bat
    wget
    fzf

    # Android Debugging
    android-tools

    # System Management
    home-manager
    font-manager
    protonvpn-gui

    # System Information and Monitoring
    hardinfo2

    # File Management
    ntfs3g
    gvfs
  ];
}
