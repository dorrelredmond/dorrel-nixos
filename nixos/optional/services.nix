{pkgs, ...}: {
  # Indexer Manager
  services.prowlarr = {
    enable = true;
    openFirewall = true;
  };

  # TV and Anime Collection Manager
  services.sonarr = {
    enable = true;
    openFirewall = true;
  };

  # Movie Collection Manager
  services.radarr = {
    enable = true;
    openFirewall = true;
  };

  # Home Media Server
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  # Additional Service Related Packages
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
