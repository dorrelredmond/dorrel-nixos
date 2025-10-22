{
  services.mpd = {
    enable = true;
    musicDirectory = "/mnt/media/Music";

    # Optional:
    network.listenAddress = "any"; # if you want to allow non-localhost connections
    network.startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
  };
}
