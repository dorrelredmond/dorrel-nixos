{pkgs, ...}: {
  # GTK Based Packages
  environment.systemPackages = with pkgs; [
    pavucontrol # audio mixer
  ];
}
