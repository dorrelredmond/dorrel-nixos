{
  description = "Dorrels Nix Configurations";

  inputs = 
  {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };


  };

  outputs = { self, nixpkgs, home-manager, catppuccin, dolphin-overlay, stylix, ... } @ inputs:

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
          stylix.nixosModules.stylix
          
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

      ## Insert Additional Systems Here
    };
  };
}
