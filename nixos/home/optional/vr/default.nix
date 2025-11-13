{ config, lib, ... }: {
    home.file = {

        ".config/wivrn" = {
            source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/optional/vr/wivrn/";
        };

        ".config/wlxoverlay" = {
            source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/optional/vr/wlxoverlay/";
        };

    };
}
