{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:

  let
    user = "dorrel";
  in {

    # NixOS Configurations
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs user; };
        modules = [
          ./systems/desktop/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager = {
              verbose = true;
              useUserPackages = true;
              useGlobalPkgs = true;
              backupFileExtension = "bak";
            };
          }
        ];
      };
    };

    # TODO Darwin Configurations

    # Home Manager Configurations for Unix Systems
    homeConfigurations = {
      desktop = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs user; };
        modules = [
          # Set Home.nix path
          ./modules/home/home.nix

          # Hyprland Configs
          #wayland.windowManager.hyprland = {
          #  enable = true;
          #  # set the flake package
          #  package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
          #  portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
          #};
        ];
      };
    };

    # TODO Darwin Home Configs
  };
}
