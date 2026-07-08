{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nerd-fonts.fira-code
    source-han-sans
    source-han-serif
  ];
}
