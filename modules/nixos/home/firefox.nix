{pkgs, inputs, ... }:
{
  nixpgks.config.allowUnfree = true;
  programs.firefox = {
    enable = true;
    profiles.default = {
      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        enhancer-for-youtube
        firefox-color
        indie-wiki-buddy
        new-tab-override
        return-youtube-dislikes
        sponsorblock
        stylus
        tampermonkey
        to-google-translate
        ublock-origin
      ];
      extensions.force = true;
    };
  };
}