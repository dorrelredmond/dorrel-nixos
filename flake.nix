{
  description = "Dorrels Nix Configurations";

  inputs = 
  {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

  outputs = { self, nixpkgs, nixpkgs-xr, home-manager, catppuccin, dolphin-overlay, nix-darwin, ... } @ inputs:

  let
    user = "dorrel";
  in 
  {

    # NixOS Configurations
    nixosConfigurations = 
    {
      desktop = nixpkgs.lib.nixosSystem 
      {
        system = "x86_64-linux";
        specialArgs = { inherit inputs user; };
        modules = 
        [
          ./systems/desktop/configuration.nix
          catppuccin.nixosModules.catppuccin

          # Overlay Settings
          ({ pkgs, ... }:{
              nixpkgs.overlays = [
                  dolphin-overlay.overlays.default
              ];
          })

          # Home Manager Settings
          home-manager.nixosModules.home-manager 
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "bak";
            home-manager.extraSpecialArgs = { inherit inputs user; };
            home-manager.users.${user} = 
            {
              imports = 
              [
                ./systems/desktop/home.nix 
                catppuccin.homeModules.catppuccin
              ];
            };
          }
        ];
      };
    };
    
    # Build darwin flake using:
    # $ sudo darwin-rebuild switch --flake .#macbook
    darwinConfigurations = 
    {
      macbook = nix-darwin.lib.darwinSystem 
      {
        system = "x86_64-darwin";
        specialArgs = { inherit inputs; };
        modules = 
        [ 
          ./systems/Dorrels-Macbook-Pro/configuration.nix

          # Home Manager Settings
          home-manager.darwinModules.home-manager 
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "bak";
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.dorrelredmond = 
            {
              imports = 
              [
                ./systems/Dorrels-Macbook-Pro/home.nix
                catppuccin.homeModules.catppuccin
              ];
            };
          }
	      ];
      };
    };
  };
}
