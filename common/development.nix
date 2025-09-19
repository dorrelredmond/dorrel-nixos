{ pkgs, ... }:
{
  # Development Related Packages
  environment.systemPackages = with pkgs; [
    # Git Packages
    git
    gh
    lazygit
    sourcegit # GUI git client (FOSS)
    
    # Text Editors
    vscodium
    neovim

    alejandra
  ];
}