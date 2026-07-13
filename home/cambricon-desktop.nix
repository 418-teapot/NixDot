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

  home.packages = with pkgs; [
    flameshot
    nvfetcher
    zotero
  ];

  imports = [
    ./packages/basic.nix
    ./packages/debugger.nix
    ./packages/git.nix
    ./packages/neovim.nix
    ./packages/nushell.nix
    ./packages/yazi.nix
    ./packages/zoxide.nix
    ./packages/direnv.nix
    ./packages/fonts.nix
    ./packages/fcitx5.nix
    ./packages/ghostty.nix
    ./packages/obsidian.nix
    ./packages/sidra.nix
    ./packages/ssh.nix
    ./packages/toolchain.nix
    ./packages/zed.nix
  ];
}
