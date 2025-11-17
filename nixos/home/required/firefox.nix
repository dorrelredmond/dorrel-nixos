{
  config,
  pkgs,
  lib,
  ...
}: let
  lock-false = {
    Value = false;
    Status = "locked";
  };

  lock-true = {
    Value = true;
    Status = "locked";
  };
in {
  programs.firefox = {
    enable = true;
    languagePacks = ["en-US"];

    /*
    ---- POLICIES ----
    */
    # Check about:policies#documentation for options.
    policies = {
      # Updates & Background Services
      AppAutoUpdate = false;
      BackgroundAppUpdate = false;

      # Feature Disabling
      DisableFirefoxStudies = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxScreenshots = true;
      DisableMasterPasswordCreation = true;
      DisableProfileImport = true;
      DisableProfileRefresh = true;
      DisableSetDesktopBackground = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisableFormHistory = true;
      DisablePasswordReveal = true;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      PasswordManagerEnabled = false;

      # UI and Behavior
      DontCheckDefaultBrowser = true;
      HardwareAcceleration = true;
      OfferToSaveLogins = false;
      DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
      DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
      SearchBar = "unified"; # alternative: "separate"

      /*
      ---- PREFERENCES ----
      */
      # Check about:config for options.
      Preferences = {
        # Performance settings
        "media.ffmpeg.vaapi.enabled" = true;
        "widget.dmabuf.force-enabled" = true; # Required in recent Firefox

        # Hide the "sharing indicator", it's especially annoying
        # with tiling WMs on wayland
        "privacy.webrtc.legacyGlobalIndicator" = false;

        # General Settings
        "browser.startup.homepage" = "https://startpage.dorrelredmond.com";
        "sidebar.verticalTabs" = true;
        "browser.ctrlTab.recentlyUsedOrder" = false;
        "browser.discovery.enabled" = lock-false;
        "extensions.getAddons.showPane" = lock-false;
        "extensions.htmlaboutaddons.recommendations.enabled" = lock-false;
        "extensions.pocket.enabled" = lock-false;

        # New TabPage
        "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
        "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
        "browser.newtabpage.activity-stream.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;

        # Privacy & Security
        "browser.contentblocking.category" = "standard";
        #"browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
        "extensions.screenshots.disabled" = lock-true;
        "browser.topsites.contile.enabled" = lock-false;
        "browser.formfill.enable" = lock-false;
        "browser.search.suggest.enabled" = lock-false;
        "browser.search.suggest.enabled.private" = lock-false;
        "browser.urlbar.suggest.searches" = lock-false;
        "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
      };

      /*
      ---- EXTENSIONS ----
      */
      # Check about:support for extension/add-on ID strings.
      # Can also view the extensions source (Ctrl-U) and search for "guid"
      # (quotations included) to get the ID string
      # Valid strings for installation_mode are "allowed", "blocked",
      # "force_installed" and "normal_installed".
      ExtensionSettings = let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in {
        "*".installation_mode = "blocked"; # blocks all addons except the ones specified below

        # uBlock Origin:
        "uBlock0@raymondhill.net" = {
          install_url = moz "ublock-origin";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

        # Bitwarden Password Manager
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = moz "bitwarden-password-manager";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

        # Firefox Color
        "FirefoxColor@mozilla.com" = {
          install_url = moz "firefox-color";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

        # Indie Wiki Buddy
        "{cb31ec5d-c49a-4e5a-b240-16c767444f62}" = {
          install_url = moz "indie-wiki-buddy";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

        # New Tab Override
        "newtaboverride@agenedia.com" = {
          install_url = moz "new-tab-override";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

        # Return YouTube Dislike
        "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
          install_url = moz "return-youtube-dislikes";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

        # YouTube Search Fixer
        "MinYT@example.org" = {
          install_url = moz "youtube-suite-search-fixer";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

        # Unhook: Remove YouTube Recommended Videos
        "myallychou@gmail.com" = {
          install_url = moz "youtube-recommended-videos";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

        # Sponsorblock
        "sponsorBlocker@ajay.app" = {
          install_url = moz "sponsorblock";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

        # Stylus
        "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = {
          install_url = moz "styl-us";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

        # Violentmonkey
        "{aecec67f-0d10-4fa7-b7c7-609a2db280cf}" = {
          install_url = moz "violentmonkey";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

        # Simple Translate
        "simple-translate@sienori" = {
          install_url = moz "simple-translate";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

        # Obsidian Web Clipper
        "clipper@obsidian.md" = {
          install_url = moz "web-clipper-obsidian";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

        # Augmented Steam
        "{1be309c5-3e4f-4b99-927d-bb500eb4fa88}" = {
          install_url = moz "augmented-steam";
          installation_mode = "force_installed";
          updates_disabled = true;
        };

        "3rdparty".Extensions = {
          "uBlock0@raymondhill.net".adminSettings = {
            userSettings = rec {
              uiTheme = "dark";
              uiAccentCustom = true;
              uiAccentCustom0 = "#c6a0f6";

              importedLists = [
                "https:#filters.adtidy.org/extension/ublock/filters/3.txt"
                "https:#github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
              ];

              externalLists = lib.concatStringsSep "\n" importedLists;
            };

            selectedFilterLists = [
              "CZE-0"
              "adguard-generic"
              "adguard-annoyance"
              "adguard-social"
              "adguard-spyware-url"
              "easylist"
              "easyprivacy"
              "https:#github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
              "plowe-0"
              "ublock-abuse"
              "ublock-badware"
              "ublock-filters"
              "ublock-privacy"
              "ublock-quick-fixes"
              "ublock-unbreak"
              "urlhaus-1"
            ];
          };
        };
      };
    };

    profiles.default = {
      # force override extentions
      extensions.force = true;

      # Search Settings
      search = {
        force = true;
        default = "ddg";
        privateDefault = "ddg";

        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@np"];
          };

          "Nix Options" = {
            urls = [
              {
                template = "https://search.nixos.org/options";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@no"];
          };

          "NixOS Wiki" = {
            urls = [
              {
                template = "https://wiki.nixos.org/w/index.php";
                params = [
                  {
                    name = "search";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@nw"];
          };
        };
      };

      #bookmarks = {
      #force = true;
      #settings = [
      #];
      #};
    };
  };
}
