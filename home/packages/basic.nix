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
    lld
    lldb
    nodejs
    ripgrep
    tokei
    tree-sitter
    uv
    zellij
  ];

  programs.home-manager.enable = true;
}
