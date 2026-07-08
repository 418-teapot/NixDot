{
  config,
  pkgs,
  ...
}: {
  home.file.".config/ghostty/config".text = ''
    font-size = 18
    font-family = FiraCode Nerd Font Mono
  '';
}
