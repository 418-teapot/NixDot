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
}
