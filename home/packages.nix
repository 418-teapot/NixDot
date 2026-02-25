{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    delta
    fd
    nushell
    ripgrep
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
