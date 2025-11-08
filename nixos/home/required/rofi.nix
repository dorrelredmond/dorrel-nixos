{ config, lib, ... }: {
    home.file = {
        ".config/rofi" = {
            source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/required/config/rofi";
        };
        ".config/rofimoji.rc" = {
            source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/required/config/rofimoji.rc";
        };
    };
}
