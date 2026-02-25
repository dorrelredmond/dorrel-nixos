{pkgs, ...}: {
  # Qt-Based Packages
  environment.systemPackages = with pkgs; [
    # Music & Audio
    kdePackages.k3b # CD/DVD burning & ripping
    kid3-qt # audio tag editor
    strawberry # music player

    # Communication
    kdePackages.konversation # IRC client

    # Misc
    qdirstat # disk usage analyzer
    kdePackages.kasts # Podcasts
    subtitlecomposer # subtitle editor

  ];
}
