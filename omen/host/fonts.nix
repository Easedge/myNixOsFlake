{ config, pkgs, . ... }:
{
  fonts = {
    enableDefaultPackages = false;
    fontDir.enable = true;
    fontconfig.enable = true;

    packages = with pkgs; [
      material-design-icons
      font-awesome
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      noto-fonts-extra
      source-sans
      source-serif
      source-han-sans
      source-han-serif
      wqy_zenhei
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "JetBrainsMono"
          "Iosevka"
        ];
      })
    ];

    fontconfig.defaultFonts = {
      serif = [ "Source Han Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans CJK SC" "Noto Color Emoji" ];
      monospace = [ "Source Han Mono" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
