{
  pkgs,
  config,
  ...
}: {
  # Communication and Social Media Packages
  environment.systemPackages = with pkgs; [
    # Web Browsers
    firefox
    #chromium

    # Email
    thunderbird

    # Chat and Messaging
    discord
    vesktop
    kdePackages.konversation # IRC client

    # File Sharing
    dropbox
    localsend
  ];
}
