{
  imports = [
    ./cli # command line interface app configurations
    ./gui # graphical interface app configurations
    ./services # system services environment config
    ./tui # terminal interface app configurations
    ./home-packages.nix # packages that do not require any configurations
  ];
}
