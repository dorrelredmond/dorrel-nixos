{
  # Enable networking
  networking.networkmanager.enable = true;

  # Cloudflare DNS Servers
  networking.nameservers = ["1.1.1.1" "1.0.0.1"];

  # Tailscale Client for Peer to Peer VPN
  services.tailscale.enable = true;

  # Open Ports for Local Send & Hytale
  networking.firewall = {
    allowedTCPPorts = [53317 5520];
    allowedUDPPorts = [53317 5520];
  };
}
