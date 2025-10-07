{    
  # Enable networking
  networking.networkmanager.enable = true;

  # Open Ports for Local Send
  networking.firewall = {
      allowedTCPPorts = [ 53317 ];
      allowedUDPPorts = [ 53317 ];
  };
}