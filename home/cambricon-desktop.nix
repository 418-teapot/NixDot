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

  targets.genericLinux.enable = true;

  programs.git.settings.user = {
    name = "418teapot";
    email = "wangshuo2912@foxmail.com";
  };

  imports = [
    ./packages/basic.nix
    ./packages/git.nix
    ./packages/js.nix
    ./packages/llvm.nix
    ./packages/neovim.nix
    ./packages/nvfetcher.nix
    ./packages/nushell.nix
    ./packages/yazi.nix
    ./packages/fonts.nix
    ./packages/fcitx5.nix
    ./packages/ghostty.nix
    ./packages/obsidian.nix
    ./packages/rust.nix
    ./packages/sidra.nix
    ./packages/zotero.nix
  ];
}
