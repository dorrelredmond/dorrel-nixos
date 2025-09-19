{ pkgs, ... }:
{
  # Devlopment Related Packages
  environment.systemPackages = with pkgs; [
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

    # Other Develiopment Tools
    git

  ];
}