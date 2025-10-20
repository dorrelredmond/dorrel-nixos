{ pkgs, inputs, ... }:
{
  # VR Specific Packages
  environment.systemPackages = with pkgs; [  
    # Launcher and Desktop Overlay
    wlx-overlay-s

    sidequest # App Store for Android-based VR Devices
    bs-manager # Beat Saber Mod Manager
    
    # VRChat
    vrcx # VRChat Friendship Management
    vrc-get # CLI Client of VRC Package Manager
    alcom # Manage VRChat Unity Projects
  ];
}