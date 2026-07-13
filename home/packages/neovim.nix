{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  home.file.".config/nvim" = {
    source = inputs.neodot;
  };
}
