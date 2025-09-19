{ pkgs, lib, inputs, user, home-manager, ... }: {
    imports = [
        ./audio.nix
        ./bluetooth.nix
        ./boot.nix
        ./catppuccin.nix
        ./communication.nix
        ./desktop.nix
        ./developement.nix
        ./locale.nix
        ./media.nix
        ./networking.nix
        ./nix.nix
        ./user.nix
        ./utilities.nix
    ];
}
