{
  config,
  lib,
  ...
}: {
  home.file = {
    ".config/yazi" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/required/config/yazi";
    };
  };
}
