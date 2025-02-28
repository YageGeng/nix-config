{ 
  config,
  lib,
  pkgs,
  ...
}: {
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-chinese-addons
        fcitx5-gtk
        fcitx5-pinyin-moegirl
        fcitx5-pinyin-zhwiki 
        fcitx5-pinyin-minecraft
      ]; 
      settings = {
        addons = {
          classicui.globalSection = {
            Theme = "plasma";
            DarkTheme = "plasma";
            Font = "Sans 12";
            MenuFont = "Sans 12";
            TrayFont = "Sans Bold 12";
          };
          pinyin.globalSection = {
            PageSize = 5;
            EmojiEnabled = "True";
            CloudPinyinIndex = 2;
            CloudPinyinEnabled = "True";
          };
          cloudpinyin.globalSection = {
            Backend = "Baidu";
          };
        };
      };
    };
  };
}
