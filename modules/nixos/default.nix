{ pkgs, lib, inputs, user, home-manager, ... }: {
    imports = [
        ./boot.nix
        ./catppuccin.nix
        ./environment.nix
        ./hardware.nix
        ./networking.nix
        ./nix.nix
        ./nixos-packages.nix
        ./security.nix
        ./services.nix
        ./system.nix
        ./timezone.nix
        ./users.nix
        ../common
    ];
}
