{
  config,
  pkgs,
  pkgsUnstable,
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
    pkgsUnstable.flameshot
    nvfetcher
    remmina
    zotero
  ];

  imports = [
    ./common.nix
    ./packages/fcitx5.nix
    ./packages/fonts.nix
    ./packages/ghostty.nix
    ./packages/obsidian.nix
    ./packages/openchamber.nix
    ./packages/agent/opencode.nix
    ./packages/sidra.nix
    ./packages/ssh.nix
    ./packages/texlive.nix
    ./packages/toolchain.nix
    ./packages/zed.nix
  ];
}
