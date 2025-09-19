{ lib, inputs, config, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Automatic Updating
  system = {
    autoUpgrade = {
      enable = true;
      dates = "02:00";
      randomizedDelaySec = "45min";
      persistent = true;
    };
  };

  nix = {
    # Automatic Garbage Cleanup
    gc = {
        automatic = true;
        dates = "daily";
        options = "--delete-older-than 30d";
        persistent = true;
    };

    # Automatic Optimization
    optimise.automatic = true;

    settings = {
        # Substituers
        substituters = [
          "https://cache.nixos.org/"
          "https://nix-community.cachix.org"
          "https://hyprland.cachix.org"
        ];
        trusted-substituters = [  
          "https://hyprland.cachix.org"
        ];
        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        ];

        # Configure download settings for better reliability
        connect-timeout = 60;  # Increase connection timeout (seconds)
        stalled-download-timeout = 300;  # Increase stalled download timeout (seconds)
        download-attempts = 5;  # Increase number of download attempts

        # Enable more verbose output for troubleshooting
        show-trace = true;
    
        # Automatically optimise symlinks
        auto-optimise-store = true;

        # Don't warn if the current working tree is dirty
        # I don't need the warning because I'm working on it right now
        warn-dirty = false;
  
        # Enable Flakes Support
        experimental-features = [ 
          "flakes"
          "nix-command"
        ];
    };
  };
}