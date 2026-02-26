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
    nushell
    ripgrep
    tokei
    tree-sitter
    yazi
    zellij
  ];

  programs.home-manager.enable = true;
  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
