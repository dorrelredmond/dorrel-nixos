{pkgs, ...}: {
  # Qt-Based Packages
  environment.systemPackages = with pkgs; [
    # Music & Audio
    kdePackages.k3b # CD/DVD burning & ripping
    kid3-qt # audio tag editor
    strawberry # music player

    # Communication
    kdePackages.konversation # IRC client
    kdePackages.tokodon # Mastodon client

    # Misc
    tellico # collection management
    kdePackages.arianna # epub reader
    kdePackages.kasts # Podcasts
    subtitlecomposer # subtitle editor

    # KDE Games
    kdePackages.kpat # patience
    kdePackages.kmines # minesweeper
    kdePackages.kmahjongg # mahjongg
    kdePackages.ksudoku # sudoku
    kdePackages.knights #chess
    kdePackages.palapeli # jigsaw puzzles
    kdePackages.kapman # Pac-Man clone
    kdePackages.kolf # Mini golf
    kdePackages.kreversi # reversi
    kdePackages.knavalbattle # Battleship
    kdePackages.kigo # Go
    kdePackages.kblocks # Tetris clone
    kdePackages.kbreakout # Breakout clone
    kdePackages.ksquares # Dots and Boxes
    kdePackages.kdiamond # Bejeweled
    kdePackages.granatier # Bomberman
    kdePackages.ksirk # Risk
  ];
}
