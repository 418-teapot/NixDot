{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "root";
    homeDirectory = "/root";
    stateVersion = "25.11";
  };

  imports = [
    ./packages/basic.nix
    ./packages/git.nix
    ./packages/neovim.nix
    ./packages/nushell.nix
    ./packages/yazi.nix
  ];
}
