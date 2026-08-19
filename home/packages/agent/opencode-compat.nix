{pkgsUnstable, ...}: let
  inherit (pkgsUnstable) lib;

  opencode = pkgsUnstable.writeShellScriptBin "opencode" ''
    export PATH=${lib.escapeShellArg (lib.makeBinPath [pkgsUnstable.ripgrep])}"''${PATH:+:$PATH}"
    export OPENCODE_DISABLE_AUTOUPDATE=true
    exec ${pkgsUnstable.stdenv.cc.bintools.dynamicLinker} \
      --argv0 opencode \
      ${pkgsUnstable.opencode}/bin/.opencode-wrapped \
      "$@"
  '';
in {
  home.packages = [opencode];
}
