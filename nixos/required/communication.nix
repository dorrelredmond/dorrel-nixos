{ pkgs, config, ... }: 
{
  # Communication and Social Media Packages
  environment.systemPackages = with pkgs; [
    # Web Browsers
    firefox
    chromium

    #Email
    thunderbird

    #Chat and Messaging
    (discord.override { withVencord = true; })
    vesktop
    fluffychat
    element-desktop

    # File Sharing
    dropbox
    localsend
  ];
}