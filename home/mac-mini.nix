{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "teapot";
    homeDirectory = "/Users/teapot";
    stateVersion = "26.05";
  };

  programs.git.settings.user = {
    name = "418teapot";
    email = "wangshuo2912@foxmail.com";
  };

  imports = [
    ./packages/agent.nix
    ./packages/basic.nix
    ./packages/fonts.nix
    ./packages/ghostty.nix
    ./packages/neovim.nix
    ./packages/nushell/nushell.nix
    ./packages/ssh.nix
    ./packages/zed.nix
  ];
}
