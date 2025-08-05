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

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, hyprland, catppuccin, dolphin-overlay, ... } @ inputs:

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
                  dolphin-overlay.overlays.default
              ];
          })
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
          ./modules/nixos/home/home.nix
          catppuccin.homeModules.catppuccin
        ];
      };
    };

    # TODO Darwin Home Configs
    # TODO Add spicefity to Darwin Configs https://wiki.nixos.org/wiki/Spicetify-Nix
  };
}
