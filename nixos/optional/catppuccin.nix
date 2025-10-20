{ pkgs, ... }:
{
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  environment.systemPackages = with pkgs; [  
    catppuccinifier-cli
  ];
}