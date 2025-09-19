{ lib, pkgs, config, ... }:
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

  environment.systemPackages = with pkgs; [
    wlx-overlay-s
    wayvr-dashboard
  ];
}