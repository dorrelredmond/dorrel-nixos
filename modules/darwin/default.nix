{ pkgs, lib, inputs, user, home-manager, ... }: {
  imports = [
    ./darwin-packages.nix
    ./nix.nix
    ./options.nix
    ../common
  ];
}