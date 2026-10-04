{
  config,
  pkgsUnstable,
  ...
}: {
  home.packages = with pkgsUnstable; [
    # 综合
    yosys
    # 布局布线
    nextpnr
    python3Packages.apycula
    # 烧录
    openfpgaloader
    # 仿真
    verilator
  ];
}
