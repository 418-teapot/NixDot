{pkgsUnstable, ...}: {
  home.packages = with pkgsUnstable; [
    herdr
    opencode
    pi-coding-agent
  ];

  xdg.configFile."herdr/config.toml".text = ''
    [ui]
    right_click_passthrough_modifier = "ctrl"
  '';
}
