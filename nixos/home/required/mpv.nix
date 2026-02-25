{
  config,
  lib,
  ...
}: {
  home.file = {
    ".config/mpv" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/required/config/mpv/";
    };
  };
}
