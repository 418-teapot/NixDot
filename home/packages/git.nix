{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = lib.mkDefault "wangshuo2";
        email = lib.mkDefault "wangshuo2@cambricon.com";
      };
    };
  };
}
