{
  config,
  pkgs,
  pkgsUnstable,
  ...
}: let
  isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
  # bun reads its global config from $XDG_CONFIG_HOME/.bunfig.toml if that env
  # var is exported, otherwise from $HOME/.bunfig.toml. home-manager's
  # programs.bun module only writes the XDG path, so bun ignores it in contexts
  # where $XDG_CONFIG_HOME isn't set. Write both paths to cover every runtime.
  bunfig = {
    install.registry = "https://registry.npmmirror.com";
  };
  javaPackage = pkgs.graalvmPackages.graalvm-ce;
in {
  home.packages = with pkgs;
    [
      # LLVM / C/C++
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
      # Lean
      lean4
      # Lua
      stylua
      # Scala
      (scalafmt.override {
        jre = javaPackage;
      })
      (mill.override {
        jre = javaPackage;
      })
    ]
    ++ pkgs.lib.optionals (!isDarwin) [
      gcc
    ]
    ++ (with pkgsUnstable; [
      # C3
      c3c
      # Odin
      odin
    ]);

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

  programs.java = {
    enable = true;
    package = javaPackage;
  };

  home.file.".bunfig.toml".source = (pkgs.formats.toml {}).generate "bun-config" bunfig;
}
