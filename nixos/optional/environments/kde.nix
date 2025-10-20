{ pkgs, config, lib, inputs, ... }:
{
  # Enable the KDE Plasma Desktop Environment
  services.desktopManager.plasma6.enable = true;

  # Exclude Specific KDE Packages
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    kate
  ];

  environment.systemPackages = with pkgs; [
    # KDE Packages
    kdePackages.kcalc # Calculator
    kdePackages.kcharselect # Tool to select and copy special characters from all installed fonts
    kdePackages.kclock # Clock app
    kdePackages.kcolorchooser # A small utility to select a color
    kdePackages.kolourpaint # Easy-to-use paint program
    kdePackages.ksystemlog # KDE SystemLog Application
    kdePackages.sddm-kcm # Configuration module for SDDM
    kdiff3 # Compares and merges 2 or 3 files or directories
    kdePackages.isoimagewriter # Program to write hybrid ISO files onto USB disks

    # File Management
    kdePackages.filelight
    kdePackages.partitionmanager
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.qtsvg # svg icon support in Dolphin
    kdePackages.kio-fuse # mount remote filesystems via FUSE in Dolphin
    kdePackages.kio-extras # extra protocols support (sftp, fish and more) in Dolphin
 ];
}