{
  config,
  pkgs,
  ...
}: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings."*" = {
      ServerAliveInterval = 120;
      ServerAliveCountMax = 3;
    };
  };
}
