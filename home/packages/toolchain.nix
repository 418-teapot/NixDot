{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # LLVM / C/C++
    gcc
    libllvm
    lld
    mold
    # Rust
    cargo
    cargo-llvm-cov
    clippy
    rustc
    rustfmt
    # JavaScript / TypeScript
    biome
    bun
    typescript
    # Nix
    nixd
  ];

  programs.cargo = {
    enable = true;
    settings.source = {
      crates-io.replace-with = "ustc";
      ustc.registry = "sparse+https://mirrors.ustc.edu.cn/crates.io-index/";
    };
  };
}
