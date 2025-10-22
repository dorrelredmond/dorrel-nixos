{pkgs, ...}: {
  # User Configuration
  programs.fish.enable = true;
  users = {
    defaultUserShell = pkgs.fish;
    users.dorrel = {
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager" "gamemode" "adbusers" "pipewire"];
    };
  };
}
