{
  nix = {
    # Automatic Garbage Cleanup
    gc = {
        automatic = true;
        options = "--delete-older-than 14d";
    };

    settings = {
        # Substituers
        substituters = ["https://hyprland.cachix.org"];
        trusted-substituters = ["https://hyprland.cachix.org"];
        trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    
        # automatically optimise symlinks
        auto-optimise-store = true;
    };

    experimental-features = [ 
        # Enable flakes
        "flakes"

        # Enables the nix3 commands, a requirement for flakes
        "nix-command"
    ];
    

    # Don't warn if the current working tree is dirty
    # I don't need the warning because I'm working on it right now
    warn-dirty = false;
  };
}