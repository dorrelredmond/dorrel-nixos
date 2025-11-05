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

  services = {
    udisks2.enable = true;
    devmon.enable = true;
    gvfs.enable = true;
    printing.enable = true;
  };

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
      noto-fonts-color-emoji
      noto-fonts-monochrome-emoji

      # Hans Sans Fonts
      source-han-sans
      source-han-serif

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
    kitty # terminal emulator
    qbittorrent

    # System Information and Monitoring
    fastfetch
    btop

    # Fun Utilities
    sl
    lolcat

    # File Management
    yazi # terminal file manager
    unzip
    zip
    ntfs3g # ntfs drive support
    gvfs # various drive support
    trash-cli # recycle bin, but terminal
    dust # terminal disk usage calculator
    vimv-rs # batch rename files

    # Media Tools
    ffmpeg
    imagemagick
    yt-dlp
    tenacity
    mediainfo

    # Misc CLI Tools
    starship
    wget # web downloads
    eza # ls alternative
    bat # cat alternative
    fzf # fuzzyfinder
    zoxide # smarter cd command (inspired by z and autojump)

    # Android Debugging
    android-tools

    # System Management
    home-manager
    font-manager
    protonvpn-gui

    # System Information and Monitoring
    hardinfo2
  ];
}
