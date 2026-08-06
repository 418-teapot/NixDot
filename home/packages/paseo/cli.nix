{
  inputs,
  pkgs,
  ...
}: {
  # 跟踪上游 main 分支（url 未钉 tag）。若某次 nix flake update paseo 后出现
  # npmDepsHash mismatch（follows nixos-26.05 与上游 nixpkgs 的 fetchNpmDeps
  # 产物不同），按上游 nix/package.nix 文档加回 override：
  # .override { npmDepsHash = "报错里 got: 的值"; }
  home.packages = [inputs.paseo.packages.x86_64-linux.paseo];
}
