{ pkgs, ... }:
{
  # Qt-Based Packages
  environment.systemPackages = with pkgs; [
    # Music
    strawberry
  ];
}