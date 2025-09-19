{ lib, pkgs, config, ... }:

let
  yaml = pkgs.formats.yaml { };
in

{
  systemd.user.services.wlx-overlay-s =
    lib.recursiveUpdate
      {
        description = "wlx-overlay-s service";

        unitConfig.ConditionUser = "!root";

        serviceConfig = {
          ExecStart = "${lib.getExe pkgs.wlx-overlay-s} --openxr";
          Restart = "on-failure";
          Type = "simple";
        };

        environment.XR_RUNTIME_JSON = "/etc/xdg/openxr/1/active_runtime.json";

        restartTriggers = [ pkgs.wlx-overlay-s ];
      };

  xdg.configFile."wlxoverlay/wayvr.yaml".source = ./config/wlxoverlay/wayvr.yaml;
  
  xdg.configFile."wlxoverlay/watch.yaml".source = ./config/wlxoverlay/watch.yaml;

  xdg.configFile."wlxoverlay/conf.d/passthrough.yaml".source = ./config/wlxoverlay/conf.d/passthrough.yaml

  xdg.configFile."wlxoverlay/conf.d/font.yaml".source = yaml.generate "font.yaml" {
    primary_font = "Cascadia Cove:weight=150";
  };

  environment.systemPackages = with pkgs; [
    wlx-overlay-s
    wayvr-dashboard
  ];
}