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
    ./packages/basic.nix
    ./packages/ssh.nix
    ./packages/neovim.nix
    ./packages/nushell.nix
    ./packages/zed.nix
  ];
}
