{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    # Noto Fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    noto-fonts-monochrome-emoji

    # Nerd Fonts
    nerd-fonts.iosevka
    nerd-fonts.fira-code
    nerd-fonts.liberation
    nerd-fonts.sauce-code-pro
    nerd-fonts.mononoki
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.hack

    # Misc Fonts
    font-awesome
  ];
}