{ pkgs, config, ... }: 
{
  # Communication and Social Media Packages
  environment.systemPackages = with pkgs; [
    # Web Browsers
    firefox
    chromium

    #Email
    thunerbird

    #Chat and Messaging
    (discord.override { withVencord = true; })
    vesktop
    fluffychat

    # File Sharing
    dropbox
  ];
}