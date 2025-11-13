{
  config,
  pkgs,
  user,
  ...
}: {
  imports = [
    ../../nixos/home/required
    ../../nixos/home/optional/hyprland
    ../../nixos/home/optional/vr
  ];

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
