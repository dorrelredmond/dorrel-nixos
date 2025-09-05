{ pkgs, config, self, ... }:
{
  imports = [
    ../../modules/darwin
  ];

  # User Configuration
  users.users.dorrelredmond.home = "/Users/dorrelredmond";

  # Set Git commit hash for darwin-version
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}