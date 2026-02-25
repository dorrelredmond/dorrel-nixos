{pkgs, ...}: {
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
    ani-cli # CLI tool to browse and play anime
  ];
}
