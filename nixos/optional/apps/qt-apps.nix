{ pkgs, ... }:
{
  # System Packages
  environment.systemPackages = with pkgs; [
    # Music
    strawberry
    
    # Images
    feh
  ];
}