{pkgs, inputs, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      extensions = {
        force = true;
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
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
      };
    };
  };
}