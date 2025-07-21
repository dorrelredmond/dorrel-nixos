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

    dolphin-overlay.url = "github:rumboon/dolphin-overlay";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

  };

  outputs = { self, nixpkgs, spicetify-nix, home-manager, hyprland, catppuccin, dolphin-overlay, ... } @ inputs:

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
          spicetify-nix.nixosModules.default
          catppuccin.nixosModules.catppuccin
          ({ pkgs, ... }:{
              nixpkgs.overlays = [
                  (_: _: { waybar_git = inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.waybar; })
                  dolphin-overlay.overlays.default
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
