{ config, pkgs, lib, ...}:
{
    # Enable Logitech Hardware Support
    hardware.logitech.wireless.enable = true;

    programs.solaar = {
        enable = true;
    };
}
