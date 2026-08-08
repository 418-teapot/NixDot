{pkgsUnstable, ...}: {
  home.packages = with pkgsUnstable; [
    herdr
    opencode
    pi-coding-agent
  ];
}
