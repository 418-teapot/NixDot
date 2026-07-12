{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    bat
    bottom
    delta
    dust
    fd
    lazygit
    nodejs
    ripgrep
    tokei
    tree-sitter
    uv
    zellij
  ];

  programs.home-manager.enable = true;
}
