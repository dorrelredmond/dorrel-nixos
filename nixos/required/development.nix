{pkgs, ...}: {
  # Devlopment Related Packages
  environment.systemPackages = with pkgs; [
    # Git Packages
    git
    gh
    lazygit
    sourcegit # GUI git client (FOSS)

    # Text Editors
    vscodium
    neovim

    # JetBrains IDEs
    jetbrains.rider
    jetbrains.clion
    jetbrains.goland
    jetbrains.webstorm
    jetbrains.rust-rover
    jetbrains.idea-community
    jetbrains.pycharm-community

    # Unity
    unityhub

    # Godot
    godot-mono

    # Other Development Tools
    alejandra
  ];
}
