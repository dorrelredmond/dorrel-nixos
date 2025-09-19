{ config, pkgs, inputs, user, ... }: 
{
  imports = [
    inputs.home-manager.nixosModules.home-manager

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
    preferXdgDirectories = true;
    stateVersion = "25.05";
  };

  xdg = {
    enable = true;
    autostart.enable = true;
  };
}
