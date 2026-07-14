{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ast-grep
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

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.git.enable = true;

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
  };
}
