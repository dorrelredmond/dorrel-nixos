{
  # Enable networking
  networking.networkmanager.enable = true;

  # Google DNS Servers
  networking.nameservers = ["8.8.8.8" "8.8.4.4"];

  # Tailscale Client for Peer to Peer VPN
  services.tailscale.enable = true;

  # Open Ports for Local Send & Hytale
  networking.firewall = {
    allowedTCPPorts = [53317 5520];
    allowedUDPPorts = [53317 5520];
  };
}
