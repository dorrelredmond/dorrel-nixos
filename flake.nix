{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    waybar.url = "github:Alexays/Waybar/master";

    catppuccin.url = "github:catppuccin/nix";

  };

  outputs = { self, nixpkgs, home-manager, hyprland, catppuccin, ... } @ inputs:

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
          catppuccin.nixosModules.catppuccin
          ({ pkgs, ... }:{
              nixpkgs.overlays = [
                  (_: _: { waybar_git = inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.waybar; })
              ];
          })
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
          ./modules/home/home.nix
          catppuccin.homeModules.catppuccin
        ];
      };
    };

    # TODO Darwin Home Configs
  };
}
