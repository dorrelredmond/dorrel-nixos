{
  nix = {
    # Automatic Garbage Cleanup
    gc = {
        automatic = true;
        options = "--delete-older-than 14d";
    };

    settings = {
        # automatically optimise symlinks
        auto-optimise-store = true;
        
        # Don't warn if the current working tree is dirty
        # I don't need the warning because I'm working on it right now
        warn-dirty = false;
  
        experimental-features = [ 
            # Enable flakes
            "flakes"

            # Enables the nix3 commands, a requirement for flakes
            "nix-command"
        ];
    };
  };
}