{ pkgs, inputs, ... }:
{
  imports = [
    inputs.nixpkgs-xr.nixosModules.nixpkgs-xr
  ];

  # Community XR Packages Support
  nixpkgs.xr.enable = true;

  # Additional Proton Versions
  programs.steam.extraCompatPackages = [
    pkgs.proton-ge-rtsp-bin
    pkgs.proton-ge-bin
  ];

  # VR Specific Packages
  environment.systemPackages = with pkgs; [    
    sidequest # App Store for Android-based VR Devices
    bs-manager # Beat Saber Mod Manager
    
    # VRChat
    vrcx # VRChat Friendship Management
    vrc-get # CLI Client of VRC Package Manager
    alcom # Manage VRChat Unity Projects
  ];

  # OpenVR Configs
  xdg.configFile."openvr/openvrpaths.vrpath".text = ''
    {
      "config" :
      [
        "~/.local/share/Steam/config"
      ],
      "external_drivers" : null,
      "jsonid" : "vrpathreg",
      "log" :
      [
        "~/.local/share/Steam/logs"
      ],
      "runtime" :
      [
        "${pkgs.opencomposite}/lib/opencomposite"
      ],
      "version" : 1
    }
  '';
}