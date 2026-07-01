{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    (pkgs.writeShellScriptBin "ghostty" ''
      exec ${pkgs.lib.getExe pkgs.nixgl.nixGLMesa} ${pkgs.lib.getExe pkgs.ghostty} "$@"
    '')
  ];
}