{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    poppler-utils
    (texliveSmall.withPackages (ps:
      with ps; [
        ctex
        latexmk
        pgf
        standalone
      ]))
  ];
}
