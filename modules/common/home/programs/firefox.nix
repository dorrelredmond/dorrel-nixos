{pkgs, inputs, ... }:
let
  linuxAddons = inputs.firefox-addons.packages."x86_64-linux";
  darwinAddons = inputs.firefox-addons.packages."x86_64-darwin";
in

{
  programs.firefox = {
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
          linuxAddons.bitwarden
          linuxAddons.enhancer-for-youtube
          linuxAddons.firefox-color
          linuxAddons.indie-wiki-buddy
          linuxAddons.new-tab-override
          linuxAddons.return-youtube-dislikes
          linuxAddons.sponsorblock
          linuxAddons.stylus
          linuxAddons.tampermonkey
          linuxAddons.to-google-translate
          linuxAddons.ublock-origin

          darwinAddons.bitwarden
          darwinAddons.enhancer-for-youtube
          darwinAddons.firefox-color
          darwinAddons.indie-wiki-buddy
          darwinAddons.new-tab-override
          darwinAddons.return-youtube-dislikes
          darwinAddons.sponsorblock
          darwinAddons.stylus
          darwinAddons.tampermonkey
          darwinAddons.to-google-translate
          darwinAddons.ublock-origin
      };
        
    };
  }
}