{pkgsUnstable, ...}: {
  home.packages = with pkgsUnstable; [
    codex
    opencode
    pi-coding-agent
  ];
}
