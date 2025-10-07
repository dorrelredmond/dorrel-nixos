{ config, pkgs, lib, inputs, ...}:
{

  imports = [ 
      inputs.spicetify-nix.darwinModules.spicetify # spicetify config in common folder
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

  environment.systemPackages = with pkgs; [
   fish
  ];

}