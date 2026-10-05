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
    ./packages/agent
    ./packages/agent/opencode.nix
    ./packages/basic.nix
    ./packages/fonts.nix
    ./packages/fpga.nix
    ./packages/ghostty.nix
    ./packages/neovim.nix
    ./packages/nushell/nushell.nix
    ./packages/ssh.nix
    ./packages/toolchain.nix
    ./packages/zed.nix
  ];
}
