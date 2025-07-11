{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    (prismlauncher.override {
     # Add binary required by some mod
     additionalPrograms = [ffmpeg];

     # Change Java runtimes available to Prism Launcher
     jdks = [
       temurin-jre-bin-8 # Eclipse Teurmin openJDK version 8
       temurin-jre-bin-17 # Eclipse Teurmin openJDK version 17
       temurin-jre-bin # Eclipse Teurmin openJDK version 21
     ];
    })
  ];
}
