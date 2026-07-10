{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    biome
    bun
    typescript
  ];
}
