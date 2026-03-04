{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    bat
    bottom
    delta
    fd
    gdb
    lldb
    nodejs
    ripgrep
    tokei
    tree-sitter
    zellij
  ];

  programs.home-manager.enable = true;
}
