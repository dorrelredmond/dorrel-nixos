{
  description = "Dorrels Nix Configurations";

  inputs = {
    # Primary Package Supplier
    nixpkgs.url = "nixpkgs/nixos-25.11";

    # Manager Userspace With Nix
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ### Theme Management
    catppuccin = {
      url = "github:catppuccin/nix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    catppuccin,
    ...
  } @ inputs: let
    user = "dorrel";
  in {
    # NixOS Configurations
    nixosConfigurations = {
      desktop =
        nixpkgs.lib.nixosSystem
        {
          system = "x86_64-linux";
          specialArgs = {inherit inputs user;};
          modules = [
            catppuccin.nixosModules.catppuccin

            ./systems/desktop/configuration.nix

            # Home Manager Settings
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "bak";
                extraSpecialArgs = {inherit inputs user;};
                users.${user} = {
                  imports = [
                    ./systems/desktop/home.nix
                    catppuccin.homeModules.catppuccin
                  ];
                };
              };
            }
          ];
        };

      ## Insert Additional Systems Here
    };
  };
}
