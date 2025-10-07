{ pkgs, config, ... }: 
{
  # Communication and Social Media Packages
  environment.systemPackages = with pkgs; [
    # Web Browsers
    firefox

    #Email
    thunderbird

    #Chat and Messaging
    discord
    vesktop
    element-desktop

    # File Sharing
    localsend
  ];
}