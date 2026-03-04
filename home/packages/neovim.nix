{
  config,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  home.file.".config/nvim" = {
    source = builtins.fetchGit {
      url = "https://github.com/418-teapot/NeoDot.git";
      ref = "master";
      rev = "0e66c0eae734e6d764e81821090151517dc4eef9";
    };
  };
}
