{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    rustc
    cargo
    cargo-llvm-cov
  ];

  programs.cargo = {
    enable = true;
    settings.source = {
      crates-io.replace-with = "ustc";
      ustc.registry = "sparse+https://mirrors.ustc.edu.cn/crates.io-index/";
    };
  };
}
