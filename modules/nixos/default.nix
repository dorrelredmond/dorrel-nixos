{ pkgs, lib, inputs, user, home-manager, ... }: {
    imports = [
        ./nixos-packages.nix
    ];

    # Boot Configurations
    boot =
    {
        # Bootloader.
        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };

        # NTFS Support
        supportedFilesystems = ["ntfs"];

        # Select Kernel
        kernelPackages = pkgs.linuxPackages_latest;
    };

    # Enable Flakes Support
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # substituters
    nix.settings = {
        substituters = ["https://hyprland.cachix.org"];
        trusted-substituters = ["https://hyprland.cachix.org"];
        trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };

    # Enable networking
    networking.networkmanager.enable = true;

    # Automatic Updating
    system = {
        autoUpgrade.enable = true;
        autoUpgrade.dates = "weekly";
    };

    # Automatic Cleanup
    nix = {
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 30d";
        };
        settings.auto-optimise-store = true;
    };

    # Set your time zone.
    time.timeZone = "America/Chicago";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
    };

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    # User Configuration
    programs.fish.enable = true;
    users = {
        defaultUserShell = pkgs.fish;
        users.${user} = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" ];
        };
    };

    # Hardware Configuration
    hardware = {
        # Bluetooth Support
        bluetooth.enable = true;
        bluetooth.powerOnBoot = false;

        # Enable OpenGL
        graphics.enable = true;

        # Enable Logitech Hardware Support
        logitech.wireless.enable = true;

    };

    # Window Manager Configuration
    #programs.hyprland.enable = true;
    #programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

    # System Services Configuration
    services = {
        # Bluetooth Support
        blueman.enable = true;

        # Enable the X11 windowing system.
        # You can disable this if you're only using the Wayland session.
        xserver.enable = true;

        # Enable the KDE Plasma Desktop Environment.
        displayManager.sddm.wayland.enable = true;
        displayManager.sddm.enable = true;
        desktopManager.plasma6.enable = true;

        # Enable Printing.
        printing.enable = true;

        # Enable pulseaudio for Audio
        pulseaudio.enable = false;

        # Enable Pipewire for Audio
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            jack.enable = true;
        };
    };

    #security Configuration
    security.rtkit.enable = true;

}
