{pkgs, ...}: {
  # Media Packages
  environment.systemPackages = with pkgs; [
    # Reading
    calibre
    #hakuneko

    # Music
    spotify
    mpd # music player daemon (required backend for rmpc)
    rmpc # Terminal Based Music Player
    cava # audio visualizer
    strawberry # music player
    kdePackages.kasts # Podcasts

    # Video
    mpv

    # Editing
    kdePackages.k3b # CD/DVD burning & ripping
    kid3-qt # audio tag editor
  ];
}
