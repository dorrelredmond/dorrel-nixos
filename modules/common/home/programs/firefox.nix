{pkgs, inputs, firefox-addons, ... }:
{
  programs.firefox = let
    linuxAddons = inputs.firefox-addons.packages."x86_64-linux";
    darwinAddons = inputs.firefox-addons.packages."x86_64-darwin";
  in {
    enable = true;
    profiles.default = {

      search.engines = {
        "Nix Packages" = {
          urls = [{
            template = "https://search.nixos.org/packages";
            params = [
              { name = "type"; value = "packages"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          }];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };

        "Nix Options" = {
            definedAliases = [ "@no" ];
            urls = [{
              template = "https://search.nixos.org/options";
              params = [
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
        };
      
        bing.metaData.hidden = true;
        google.metaData.alias = "@g"; # builtin engines only support specifying one additional alias
      };
      search.force = true;

      bookmarks = [
        {
          name = "NixOS Package Search";
          tags = [ "nixos" ];
          keyword = "nixos";
          url = "https://search.nixos.org/packages";
        }
      ];

      settings = {
          # Performance settings
          "gfx.webrender.all" = true; # Force enable GPU acceleration
          "media.ffmpeg.vaapi.enabled" = true;
          "widget.dmabuf.force-enabled" = true; # Required in recent Firefoxes

          # Hide the "sharing indicator", it's especially annoying
          # with tiling WMs on wayland
          "privacy.webrtc.legacyGlobalIndicator" = false;

          # Actual settings
          "sidebar.verticalTabs" = true;
          "app.shield.optoutstudies.enabled" = false;
          "app.update.auto" = false;
          "browser.bookmarks.restore_default_bookmarks" = false;
          "browser.contentblocking.category" = "strict";
          "browser.ctrlTab.recentlyUsedOrder" = false;
          "browser.discovery.enabled" = false;
          "browser.laterrun.enabled" = false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" =
            false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" =
            false;
          "browser.newtabpage.activity-stream.feeds.snippets" = false;
          "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned" = "";
          "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines" = "";
          "browser.newtabpage.activity-stream.section.highlights.includePocket" =
            false;
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.pinned" = false;
          "browser.protections_panel.infoMessage.seen" = true;
          "browser.quitShortcut.disabled" = true;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.ssb.enabled" = true;
          "browser.toolbars.bookmarks.visibility" = "never";
          "browser.urlbar.placeholderName" = "DuckDuckGo";
          "browser.urlbar.suggest.openpage" = false;
          "datareporting.policy.dataSubmissionEnable" = false;
          "datareporting.policy.dataSubmissionPolicyAcceptedVersion" = 2;
          "dom.security.https_only_mode" = true;
          "dom.security.https_only_mode_ever_enabled" = true;
          "extensions.getAddons.showPane" = false;
          "extensions.htmlaboutaddons.recommendations.enabled" = false;
          "extensions.pocket.enabled" = false;
          "identity.fxaccounts.enabled" = false;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
      };

      extensions = {
          linuxAddons.bitwarden = true;
          linuxAddons.enhancer-for-youtube = true;
          linuxAddons.firefox-color = true;
          linuxAddons.indie-wiki-buddy = true;
          linuxAddons.new-tab-override = true;
          linuxAddons.return-youtube-dislikes = true;
          linuxAddons.sponsorblock = true;
          linuxAddons.stylus = true;
          linuxAddons.tampermonkey = true;
          linuxAddons.to-google-translate = true;
          linuxAddons.ublock-origin = true;

          darwinAddons.bitwarden = true;
          darwinAddons.enhancer-for-youtube = true;
          darwinAddons.firefox-color = true;
          darwinAddons.indie-wiki-buddy = true;
          darwinAddons.new-tab-override = true;
          darwinAddons.return-youtube-dislikes = true;
          darwinAddons.sponsorblock = true;
          darwinAddons.stylus = true;
          darwinAddons.tampermonkey = true;
          darwinAddons.to-google-translate = true;
          darwinAddons.ublock-origin = true;
      };
        
    };
  };
}