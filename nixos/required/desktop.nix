{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  # Environment Variables
  environment.variables.EDITOR = "nvim";

  # This is using a rec (recursive) expression to set and access XDG_BIN_HOME within the expression
  # For more on rec expressions see https://nix.dev/tutorials/first-steps/nix-language#recursive-attribute-set-rec
  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    # Not officially in the specification
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [
      "${XDG_BIN_HOME}"
    ];
  };

  environment.sessionVariables = {
    # If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  # Enable the X11 Windowing System
  services.xserver.enable = true;

  # Common Desktop Packages
  environment.systemPackages = with pkgs; [
    # Office and Productivity
    libreoffice
    obsidian
    calibre

    # Graphics
    blender
    scribus
    darktable
    inkscape
    davinci-resolve
    krita
    gimp3
  ];

  #security Configuration
  security.polkit.enable = true;
}
