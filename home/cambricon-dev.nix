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

  imports = [
    ./packages/basic.nix
    ./packages/git.nix
    ./packages/neovim.nix
    ./packages/nushell.nix
    ./packages/yazi.nix
    ./packages/rust.nix
    ./packages/llvm.nix
    ./packages/js.nix
  ];
}
