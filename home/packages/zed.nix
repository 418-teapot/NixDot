{
  config,
  pkgs,
  pkgsUnstable,
  ...
}: {
  programs.zed-editor = {
    enable = true;
    package = pkgsUnstable.zed-editor;
    mutableUserSettings = true;
    mutableUserKeymaps = true;
    mutableUserTasks = true;
    mutableUserDebug = true;
    userSettings = {
      vim_mode = true;
      agent_buffer_font_size = 20;
      agent_ui_font_size = 20;
      ui_font_size = 18;
      buffer_font_size = 20;
      buffer_font_family = "Maple Mono NF CN";
      theme = {
        mode = "system";
        light = "One Light";
        dark = "One Dark";
      };
      icon_theme = "Material Icon Theme";
      auto_update = false;
      wrap_guides = [80];
      relative_line_numbers = "enabled";
      soft_wrap = "editor_width";
      agent_servers = {
        opencode = {type = "registry";};
        "pi-acp" = {type = "registry";};
      };
    };
    extensions = ["nix" "toml" "git-firefly" "material-icon-theme"];
  };

  home.packages = [
    (pkgs.runCommand "zed-bin" {} ''
      mkdir -p $out/bin
      ln -s ${pkgs.lib.getExe pkgsUnstable.zed-editor} $out/bin/zed
    '')
  ];
}
