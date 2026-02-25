{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    delta
    fd
    neovim
    nushell
    ripgrep
    yazi
    zellij
  ];

  programs.home-manager.enable = true;
}
