{
  config,
  pkgs,
  ...
}: {
  home.packages = [pkgs.nvfetcher];
}
