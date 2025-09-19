{ config, pkgs, inputs, user, ... }: 
{
  imports = [
    inputs.home-manager.darwinModules.home-manager

    ./catppuccin.nix
    ../../common/home
    ./programs
  ];

  home-manager = {
    backupFileExtension = "bak";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs user; };
  };

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "25.05";
  };
}
