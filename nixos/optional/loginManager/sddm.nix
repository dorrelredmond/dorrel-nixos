{pkgs, ...}: {
  services = {
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    catppuccin-sddm
  ];
}
