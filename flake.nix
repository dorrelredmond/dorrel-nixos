{
  description = "Dorrels Nix Configurations";

  inputs = {
    # Primary Package Supplier
    #
    # you may also notice that I don't use a `github:` url for nixpkgs this is
    # beacuse we can save 15mb of data by using the channel tarball this is not
    # a major saving but it is nice to have
    # https://deer.social/profile/did:plc:mojgntlezho4qt7uvcfkdndg/post/3loogwsoqok2w
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.xz";

    # Improved Hardware Support
    nixos-hardware = {
      type = "github";
      owner = "NixOS";
      repo = "nixos-hardware";
    };

    # Manager Userspace With Nix
    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ### System Tools

    # Declarative Firefox Extensions
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ### Media Tools

    # customize spotify
    spicetify-nix = {
      type = "github";
      owner = "Gerg-L";
      repo = "spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # YouTube in the terminal
    yt-x = {
      type = "github";
      owner = "Benexl";
      repo = "yt-x";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ### Theme Management
    catppuccin = {
      type = "github";
      owner = "catppuccin";
      repo = "nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
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
            nixos-hardware.nixosModules.common-gpu-nvidia-nonprime
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
