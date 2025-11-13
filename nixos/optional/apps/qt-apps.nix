{pkgs, ...}: {
  # Qt-Based Packages
  environment.systemPackages = with pkgs; [
    # Music & Audio
    kdePackages.k3b # CD/DVD burning & ripping
    kid3-qt # audio tag editor

    # Communication
    kdePackages.konversation # IRC client

    # Misc
    qdirstat # disk usage analyzer
    tellico # collection management
    kdePackages.kasts # Podcasts
    subtitlecomposer # subtitle editor

    # KDE Games
    kdePackages.kpat # patience
    kdePackages.kmines # minesweeper
    kdePackages.kmahjongg # mahjongg
    kdePackages.ksudoku # sudoku
    kdePackages.knights #chess
    kdePackages.kapman # Pac-Man clone
    kdePackages.kreversi # reversi
    kdePackages.knavalbattle # Battleship
    kdePackages.kblocks # Tetris clone
    kdePackages.kbreakout # Breakout clone
    kdePackages.kdiamond # Bejeweled
    kdePackages.granatier # Bomberman
  ];
}
