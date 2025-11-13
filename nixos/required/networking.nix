{
  # Enable networking
  networking.networkmanager.enable = true;

  # Cloudfare DNS Servers and Google DNS as secondary
  networking.nameservers = ["1.1.1.1" "8.8.8.8"];

  # iNet Wireless Daemon
  networking.wireless.iwd.enable = true;

  # Open Ports for Local Send
  networking.firewall = {
    allowedTCPPorts = [53317];
    allowedUDPPorts = [53317];
  };
}
