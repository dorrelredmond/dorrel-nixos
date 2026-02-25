# Dorrel's Custom Nix Configurations

I am still very new to Nix as a whole, and as such, many things likely will not be done in the most optimal way. Despite this, I am using this repo as a way to learn not only Nix, but I am also attempting to learn better git practices. 

This repo may go through many restructures as I attempt to modularize and configure as many aspects as possible of my various machines.

Initially I had attempted to make this repo useful for several devices. However, my use case has changed over time as I noticed how complex everything was getting for no reason. I only have a single NixOS system, and as such, saw no reason to have the excess files and folders, simplifying everything to be more optimal for a singular system.

## Basic Folder Structure
- **desktop:** Configuration for my desktop
- **nixos:** Configurations for NixOS systems
    - **home:** Home Manager Configurations
        - **dotfiles:** Config Files/Folders to be symlinked to the .config directory
    - **modules:** Core Modules that are required for my NixOS system
    - **vr:** Virtual Reality Configuration

## Scripts

```bash
./upgrade.sh
```

The script will run a `git pull` to ensure the local repo is up-to-date, then update the `flake.nix` file and begin rebuilding my desktop

## Credits
While I am attempting to primarily only take inspiration from other people's dotfiles, some code snippets are taken verbatim as I slowly work everything up. Thank you to the following people for all of your amazing work and sharing your own configurations! You have truly made things so much easier for me through this process ^-^

- [isabelroses](https://github.com/isabelroses)
- [Andrey0189 (Andrew)](https://github.com/Andrey0189)
- [lukejcollins (Luke)](https://github.com/lukejcollins)
- [TayouVR](https://github.com/TayouVR)

