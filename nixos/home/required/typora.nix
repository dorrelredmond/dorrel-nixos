{
  config,
  lib,
  ...
}: {
  home.file = {
    ".config/Typora/themes" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/required/config/Typora/themes/";
    };
  };
}
