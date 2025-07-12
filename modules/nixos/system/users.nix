{ pkgs, user, home-manager, ... }: {

  home-manager.users.${user} = {
    programs = {
      fish.enable = true;
    };
  };

  users = {
    defaultUserShell = pkgs.fish;
    users.${user} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };

}
