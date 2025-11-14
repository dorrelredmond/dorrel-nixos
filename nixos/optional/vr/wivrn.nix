{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # Launcher and Desktop Overlay
    wlx-overlay-s
  ];

  # Configure WiVRn for OpenXR streaming to standalone headsets (i.e., Quest 3)
  services.wivrn = {
    enable = true;
    openFirewall = true;

    # Write information to /etc/xdg/openxr/1/active_runtime.json, VR applications
    # will automatically read this and work with WiVRn (Note: This does not currently
    # apply for games run in Valve's Proton)
    defaultRuntime = true;

    # Run WiVRn as a systemd service on startup
    autoStart = true;

    ## Config for WiVRn (https://github.com/WiVRn/WiVRn/blob/master/docs/configuration.md)
    #config = {
    #  enable = true;
    #  json = {
    #    application = [pkgs.wlx-overlay-s];
    #    scale = 0.8; # 20% foveation scaling
    #    bitrate = 120000000; # 120 Mbit/s
    #    encoders = [
    #      {
    #        height = 0.25;
    #        offset_x = 0.0;
    #        offset_y = 0.75;
    #        width = 0.5;
    #      }
    #      {
    #        height = 0.75;
    #        offset_x = 0.0;
    #        offset_y = 0.0;
    #        width = 0.5;
    #      }
    #      {
    #        codec = "h264";
    #        encoder = "x264";
    #        height = 1.0;
    #        offset_x = 0.5;
    #        offset_y = 0.0;
    #        width = 0.5;
    #      }
    #    ];
    #  };
    #};
  };
}
