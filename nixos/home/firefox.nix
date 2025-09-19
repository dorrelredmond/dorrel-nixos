{ config, pkgs, inputs, lib, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.tqzkbjfz = {
      extensions = {
        force = true;
        packages = with inputs.firefox-addons.packages."x86_64-linux"; [
          bitwarden
          firefox-color
          indie-wiki-buddy
          new-tab-override
          return-youtube-dislikes
          sponsorblock
          stylus
          violentmonkey
          to-google-translate
          ublock-origin
        ];
      };        
    };
  };
}