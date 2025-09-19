{
  nix = {
    # Automatic Garbage Cleanup
    gc = {
        automatic = true;
        options = "--delete-older-than 3d";
    };

    # automatically optimise symlinks
    optimise.automatic = true;

    settings = {
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