{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    libllvm
    lld
    lldb
  ];
}
