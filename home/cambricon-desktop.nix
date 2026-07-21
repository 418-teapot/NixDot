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
    remmina
    zotero
  ];

  imports = [
    ./packages/agent.nix
    ./packages/basic.nix
    ./packages/debugger.nix
    ./packages/fcitx5.nix
    ./packages/fonts.nix
    ./packages/ghostty.nix
    ./packages/neovim.nix
    ./packages/nushell.nix
    ./packages/obsidian.nix
    ./packages/sidra.nix
    ./packages/ssh.nix
    ./packages/toolchain.nix
    ./packages/zed.nix
  ];
}
