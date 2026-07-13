{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "root";
    homeDirectory = "/root";
    stateVersion = "26.05";
  };

  programs.git.settings.user = {
    name = "wangshuo2";
    email = "wangshuo2@cambricon.com";
  };

  imports = [
    ./packages/basic.nix
    ./packages/debugger.nix
    ./packages/git.nix
    ./packages/neovim.nix
    ./packages/nushell.nix
    ./packages/yazi.nix
    ./packages/zoxide.nix
    ./packages/direnv.nix
    ./packages/toolchain.nix
  ];
}
