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
    ./common.nix
    ./packages/paseo/cli.nix
  ];
}
