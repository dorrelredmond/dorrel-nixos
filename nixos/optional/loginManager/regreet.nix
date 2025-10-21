{ config, ... }:
{
  programs.regreet = {
    enable = true;
    settings = {
      background = {
        path = "./greeter.jpg";
        fit = "contain";
      };
      gtk = {
        application_prefer_dark_theme = true;
        cursor_blink = false;
        theme_name = "Adwaita";
        icon_theme_name = "Adwaita";
        cursor_theme_name = "Adwaita";
      };
    };
  };


}