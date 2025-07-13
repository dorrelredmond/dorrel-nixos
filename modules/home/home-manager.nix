{ inputs, ... }: {
    imports = [ inputs.home-manager.nixosModules.default ];

    home-manager = {
        verbose = true;
        useUserPackages = true;
        useGlobalPkgs = true;
        backupFileExtension = "bak";
    };
}
