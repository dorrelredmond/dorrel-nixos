{
  config,
  lib,
  ...
}: {
  home.file = {
    ".config/rmpc" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/required/config/rmpc";
    };
  };
}
