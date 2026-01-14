{
  # Enable networking
  networking.networkmanager.enable = true;

  # Cloudfare DNS Servers and Google DNS as secondary
  networking.nameservers = ["1.1.1.1" "8.8.8.8"];

  # iNet Wireless Daemon
  networking.wireless.iwd.enable = true;

  # Tailscale Client for Peer to Peer VPN
  services.tailscale.enable = true;

  # Open Ports for Local Send & Hytale
  networking.firewall = {
    allowedTCPPorts = [53317 5520];
    allowedUDPPorts = [53317 5520];
  };
}
