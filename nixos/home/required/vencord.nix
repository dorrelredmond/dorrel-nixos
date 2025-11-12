
{ config, lib, ... }: {
    home.file = {
        ".config/Vencord" = {
            source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/required/config/Vencord";
        };
    };
}
