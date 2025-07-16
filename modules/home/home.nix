{ user, ... }: {
  imports = [
    
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "25.05";
  };

  catppuccin.enable = true;

  # let Home Manager manage itself when in standalone mode
  programs.home-manager.enable = true;
}
