{ pkgs, config, ... }:
{
  imports = [
    ../../modules/darwin
  ];

  # User Configuration
  users.users.dorrelredmond.home = "/Users/dorrelredmond";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}