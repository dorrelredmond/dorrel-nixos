{pkgs, ...}: {
  # Devlopment Related Packages
  environment.systemPackages = with pkgs; [
    # Git Packages
    git
    git-lfs
    gh
    lazygit

    # Charm Tools
    gum # glamorous shell scripts
    glow # nicer markdown renderer

    # Text Editors
    vscodium
    neovim

    # Language Servers
    lua-language-server
    rust-analyzer
    typst

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
