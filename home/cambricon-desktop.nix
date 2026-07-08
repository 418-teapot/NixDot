{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "cambricon";
    homeDirectory = "/home/cambricon/";
    stateVersion = "26.05";
  };

  programs.git.settings.user = {
    name = "418teapot";
    email = "wangshuo2912@foxmail.com";
  };

  imports = [
    ./packages/basic.nix
    ./packages/git.nix
    ./packages/neovim.nix
    ./packages/nushell.nix
    ./packages/yazi.nix
    ./packages/fonts.nix
    ./packages/fcitx5.nix
    ./packages/ghostty.nix
  ];
}
