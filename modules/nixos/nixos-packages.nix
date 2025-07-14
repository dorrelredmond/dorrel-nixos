{ config, pkgs, lib, ...}:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs = {
    appimage = {
      enable = true;
      binfmt = true;
    };
  };

  environment.systemPackages = with pkgs; [
    # CLI Tools
    git
    gh
    neovim

    # GUI Applications & Tools
    solaar
    bottles
    pavucontrol
  ];
}
