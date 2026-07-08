# fcitx5 Chinese input method.
#
# Engine: `fcitx5-chinese-addons` (Pinyin, Shuangpin, Wubi).
# Power-user alternative: `fcitx5-rime` (Rime engine, customisable schemas)
# — swap it into `fcitx5.addons` below.
{
  config,
  pkgs,
  ...
}: {
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        kdePackages.fcitx5-chinese-addons
        kdePackages.fcitx5-configtool
        fcitx5-material-color
      ];

      settings = {
        globalOptions = {
          Hotkey = {
            EnumerateWithTriggerKeys = true;
            EnumerateSkipFirst = false;
            ModifierOnlyKeyTimeout = 250;
          };
        };

        inputMethod = {
          "GroupOrder"."0" = "Default";

          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us";
            DefaultIM = "shuangpin";
          };

          "Groups/0/Items/0".Name = "keyboard-us";
          "Groups/0/Items/1".Name = "shuangpin";
        };

        addons.pinyin.globalSection.ShuangpinProfile = "Xiaohe";

        addons.classicui.globalSection = {
          Font = "Source Han Serif SC 16";
          Theme = "Material-Color-pink";
        };
      };
    };
  };
}
