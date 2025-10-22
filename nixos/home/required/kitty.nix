{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    enableGitIntegration = true;
    themeFile = "Catppuccin-Mocha";
    settings = {
      font_family = "FantasqueSansM Nerd Font Mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = 16.0;
      enable_audio_bell = false;
      cursor_shape = "beam";
      cursor_trail = 200;
      cursor_trail_decay = "0.1 0.4";
      cursor_trail_start_threshold = 2;
      scrollback_lines = 5000;
      scrollback_pager_history_size = 10;
      mouse_hide_wait = -3.0;
      hide_window_decorations = "no";
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      background_opacity = 0.95;
      allow_remote_control = "yes";
      shell_integration = "enabled";
      macos_option_as_alt = "yes";
      shell = "fish";
      window_padding_width = 1;
    };
  };
}
