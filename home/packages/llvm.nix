{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gcc
    libllvm
    lld
    lldb
    mold
  ];
}
