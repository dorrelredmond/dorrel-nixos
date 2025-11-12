
{ config, lib, ... }: {
    home.file = {
        ".config/yt-x/yt-x.conf" = {
            source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/required/config/yt-x/yt-x.conf";
        };
    };
}
