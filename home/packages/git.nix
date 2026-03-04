{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "wangshuo2";
        email = "wangshuo2@cambricon.com";
      };
    };
  };
}
