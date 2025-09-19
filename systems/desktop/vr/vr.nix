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
    # Launcher and Desktop Overlay
    wlx-overlay-s
    wayvr-dashboard

    sidequest # App Store for Android-based VR Devices
    bs-manager # Beat Saber Mod Manager
    
    # VRChat
    vrcx # VRChat Friendship Management
    vrc-get # CLI Client of VRC Package Manager
    alcom # Manage VRChat Unity Projects
  ];
}