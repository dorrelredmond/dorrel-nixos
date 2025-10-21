{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;

    package = (
      pkgs.mpv-unwrapped.wrapper {
        scripts = with pkgs.mpvScripts; [
          uosc
          sponsorblock
          mpv-playlistmanager
          thumbfast
        ];

        mpv = pkgs.mpv-unwrapped.override {
          waylandSupport = true;
        };
      }
    );

    config = {
      ytdl-format = "bestvideo+bestaudio";

      ## Video
      profile="high-quality";
      vo="gpu-next";
      scale-antiring=0.6;

      # Dither
      # This must be set to match your monitor's bit depth
      dither-depth = 8;

      ## Behavior (personal preference)
      keep-open="no";
      save-position-on-quit="no";

      ## Screenshots
      screenshot-format="png";
      screenshot-dir="~/Pictures/mpv";
      screenshot-template="%F-%p-%n";
      screenshot-high-bit-depth="no";

      ## Language Priority
      
      ## Sub
      ## Add enm before eng for honorifics
      #slang=eng,en
      #alang=jpn,ja

      ## Dub
      slang="zxx,eng,en";
      alang="eng,en";
      subs-with-matching-audio="forced";

      # uosc provides seeking & volume indicators (via flash-timeline and flash-volume commands)
      # if you decide to use them, you don't need osd-bar
      osd-bar="no";

      # uosc will draw its own window controls and border if you disable window border
      border="no";
    };
  };

}