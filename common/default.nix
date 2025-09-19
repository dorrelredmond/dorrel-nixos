{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./communication.nix
    ./development.nix
    ./media.nix
    ./utilities.nix
  ];
}