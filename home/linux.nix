{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "cambricon";
    homeDirectory = "/home/cambricon/";
    stateVersion = "25.11";
  };

  imports = [
    ./packages/basic.nix
    ./packages/git.nix
    ./packages/neovim.nix
    ./packages/nushell.nix
    ./packages/yazi.nix
    ./packages/ghostty.nix
    ./packages/fonts.nix
  ];
}
