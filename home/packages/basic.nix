{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    bat
    bottom
    bun
    cargo
    cargo-llvm-cov
    delta
    fd
    gdb
    lazygit
    libllvm
    lld
    lldb
    nodejs
    ripgrep
    rustc
    tokei
    tree-sitter
    uv
    zellij
  ];

  programs.home-manager.enable = true;
}
