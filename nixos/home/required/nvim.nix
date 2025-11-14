{
  config,
  lib,
  ...
}: {
  home.file = {
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/dorrel/dorrel-nixos/nixos/home/required/config/nvim";
    };
  };
}
