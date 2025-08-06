{
  # Enable Flakes Support
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # substituters
  nix.settings = {
      substituters = ["https://hyprland.cachix.org"];
      trusted-substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  # Automatic Cleanup
  nix = {
      gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 30d";
      };
      settings.auto-optimise-store = true;
  };
}