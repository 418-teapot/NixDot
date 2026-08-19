{pkgsUnstable, ...}: {
  home.packages = with pkgsUnstable; [
    herdr
    pi-coding-agent
  ];

  xdg.configFile."herdr/config.toml".text = ''
    [ui]
    right_click_passthrough_modifier = "ctrl"

    [terminal]
    shell_mode = "non_login"
  '';
}
