{ pkgs, inputs, ... }:
{
  imports = [ 
      inputs.spicetify-nix.nixosModules.spicetify # spicetify config in common folder
  ];

  # Media Packages
  environment.systemPackages = with pkgs; [
    strawberry
    mpv
    feh
    catppuccinifier-cli
  ];
}