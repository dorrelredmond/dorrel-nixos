{pkgs, ...}: {
  # Devlopment Related Packages
  environment.systemPackages = with pkgs; [
    # Git Packages
    git
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

    # JDK
    jdk
    jdk8 
    jdk17
    jdk21

    # Other Development Tools
    alejandra
  ];
}
