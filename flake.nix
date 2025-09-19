{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    waybar.url = "github:Alexays/Waybar/master";

    nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";

    catppuccin.url = "github:catppuccin/nix";

    dolphin-overlay.url = "github:rumboon/dolphin-overlay";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nixpkgs-xr, home-manager, hyprland, catppuccin, dolphin-overlay, nix-darwin, ... } @ inputs:

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
          nixpkgs-xr.nixosModules.nixpkgs-xr

          # Overlay Settings
          ({ pkgs, ... }:{
              nixpkgs.overlays = [
                  (_: _: { waybar_git = inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.waybar; })
                  dolphin-overlay.overlays.default
              ];
          })

          # Home Manager Settings
          home-manager.nixosModules.home-manager {
            home-manager.users.${user} = {
              imports = [
                ./modules/nixos/home/home.nix 
                catppuccin.homeModules.catppuccin
              ];
            };
          }
        ];
      };
    };
    
    # Build darwin flake using:
    # $ sudo darwin-rebuild switch --flake .#macbook
    darwinConfigurations = {
      macbook = nix-darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        specialArgs = { inherit inputs; };
        modules = [ 
          ./systems/Dorrels-Macbook-Pro/configuration.nix

          # Home Manager Settings
          home-manager.darwinModules.home-manager {
            home-manager.users.dorrelredmond = {
              imports = [
                ./modules/darwin/home/home.nix
                catppuccin.homeModules.catppuccin
              ];
            };
          }
	      ];
      };
    };
  };
}
