{
  config,
  pkgs,
  ...
}: let
  # bun reads its global config from $XDG_CONFIG_HOME/.bunfig.toml if that env
  # var is exported, otherwise from $HOME/.bunfig.toml. home-manager's
  # programs.bun module only writes the XDG path, so bun ignores it in contexts
  # where $XDG_CONFIG_HOME isn't set. Write both paths to cover every runtime.
  bunfig = {
    install.registry = "https://registry.npmmirror.com";
  };
in {
  home.packages = with pkgs; [
    # LLVM / C/C++
    gcc
    libllvm
    llvm
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
    typescript
    # Nix
    nixd
    # Scheme
    chez
    # Odin
    odin
    # C3
    c3c
  ];

  programs.cargo = {
    enable = true;
    settings.source = {
      crates-io.replace-with = "ustc";
      ustc.registry = "sparse+https://mirrors.ustc.edu.cn/crates.io-index/";
    };
  };

  programs.bun = {
    enable = true;
    package = pkgs.bun;
    settings = bunfig;
  };

  home.file.".bunfig.toml".source = (pkgs.formats.toml {}).generate "bun-config" bunfig;
}
