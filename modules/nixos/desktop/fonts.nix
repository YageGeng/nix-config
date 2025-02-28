{ 
  config,
  lib,
  pkgs,
  ...
}: {
  fonts = {
    enableDefaultPackages = false;

    packages = with pkgs; [
      noto-fonts
      dejavu_fonts
      liberation_ttf
      twemoji-color-font
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      nerd-fonts.iosevka
      nerd-fonts.symbols-only
    ];

    fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif CJK SC" "Noto Serif" "Twitter Color Emoji"];
        sansSerif = ["Noto Sans CJK SC" "Noto Sans" "Twitter Color Emoji"];
        monospace = ["Noto Sans Mono CJK SC" "Symbols Nerd Font" "Twitter Color Emoji"];
	emoji = ["Twitter Color Emoji"];
      };
    };
  };
}
