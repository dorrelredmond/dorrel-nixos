{ nixpkgs, home-manager, ... }: @ inputs
{
  imports = [ inputs.home-manager.nixosModules.default ];

  home-manager = {
    verbose = true;
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "bak";
    };

  # we should define guaranteed common modules here
  sharedModules = [ ../../home/default.nix ];
}
