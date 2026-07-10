{
  config,
  pkgs,
  ...
}: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    maple-mono.NF-CN
    nerd-fonts.fira-code
    source-han-sans
    source-han-serif
  ];
}
