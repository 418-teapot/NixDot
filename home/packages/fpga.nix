{
  config,
  pkgs,
  pkgsUnstable,
  ...
}: let
  javaPackage = pkgs.graalvmPackages.graalvm-ce;
in {
  programs.java = {
    enable = true;
    package = javaPackage;
  };
  home.packages = with pkgs;
    [
      (scalafmt.override {
        jre = javaPackage;
      })
      (mill.override {
        jre = javaPackage;
      })
    ]
    ++ (with pkgsUnstable; [
      # 综合
      yosys
      # 布局布线
      nextpnr
      python3Packages.apycula
      # 烧录
      openfpgaloader
      # 仿真
      verilator
    ]);
}
