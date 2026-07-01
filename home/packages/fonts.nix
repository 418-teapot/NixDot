{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nerd-fonts.fira-code
    maple-mono.MapleMono-NF-CN
  ];
}
