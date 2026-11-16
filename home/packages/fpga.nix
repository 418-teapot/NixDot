{
  config,
  pkgs,
  pkgsUnstable,
  ...
}: {
  home.packages = with pkgs;
    [
      graalvmPackages.graalvm-ce
      mill
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
