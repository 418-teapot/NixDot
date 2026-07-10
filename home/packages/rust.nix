{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    cargo
    cargo-llvm-cov
    clippy
    rustc
    rustfmt
  ];

  programs.cargo = {
    enable = true;
    settings.source = {
      crates-io.replace-with = "ustc";
      ustc.registry = "sparse+https://mirrors.ustc.edu.cn/crates.io-index/";
    };
  };
}
