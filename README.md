# Dorrel's Custom Nix Configurations

I am still very new to Nix as a whole, and as such, many things likely will not be done in the most optimal way. Despite this, I am using this repo as a way to learn not only Nix, but I am also attempting to learn better git practices. 

This repo may go through many restructures as I attempt to modularize and configure as many aspects as possible of my various machines.

## Basic Folder Structure
 **nixos:** Configurations for NixOS systems
    - **home:** Home Manager Configurations for NixOS based systems
        - **optional:** Optional Configs to be symlinked as needed
        - **required:** Core Required Configs managed with Home Manager
            - **config:** Config Files/Folders to be symlinked to the .config directory
    - **optional:** Optional modules that are enabled per system
        - **apps:** GTK or QT Apps To Match Desired Environment
        - **environments:** Preconfigured Desktop Environments/Window Managers
        - **graphics:** Graphics Drivers
        - **loginManager:** Displaymanagers for Login
        - **vr:** Virtual Reality Configuration
        - **gaming.nix:** Gaming related packages
        - **services.nix:** Locally-hosted services (i.e. Jellyfin)
    - **required:** Core Modules that are requires for all NixOS systems
- **systems:** Machine Specific Configurations
    - **desktop:** Configuration for my desktop

## Scripts

```bash
./config-link.sh
``` 

This script will take the various home/config files and quickly create symlinks to the user's home directory

```bash
./upgrade.sh
```

This script will prompt the user for the type of system and the exact system name to update. The script will then run a `git pull` to ensure the local repo is up-to-date, then update the `flake.nix` file and begin rebuilding the desired system with the `--upgrade` flag applied

## Credits
While I am attempting to primarily only take inspiration from other people's dotfiles, some code snippets are taken verbatim as I slowly work everything up. Thank you to the following people for all of your amazing work and sharing your own configurations! You have truly made things so much easier for me through this process ^-^

- [isabelroses](https://github.com/isabelroses)
- [Andrey0189 (Andrew)](https://github.com/Andrey0189)
- [lukejcollins (Luke)](https://github.com/lukejcollins)
- [TayouVR](https://github.com/TayouVR)

