{ pkgs, ... }:
{
  # Development Related Packages
  environment.systemPackages = with pkgs; [
    vscodium
    git
    neovim

    alejandra
  ];
}