{
  config,
  pkgs,
  ...
}: let
  sources = pkgs.callPackage ../../_sources/generated.nix {};
  s = sources.openchamber;

  extracted = pkgs.appimageTools.extractType2 {
    pname = s.pname;
    version = s.version;
    inherit (s) src;
  };

  openchamber = pkgs.stdenv.mkDerivation {
    name = "openchamber-${s.version}";
    nativeBuildInputs = [pkgs.makeWrapper];
    buildCommand = ''
      mkdir -p $out/bin
      cp ${s.src} $out/bin/openchamber.AppImage
      chmod +x $out/bin/openchamber.AppImage
      makeWrapper $out/bin/openchamber.AppImage $out/bin/openchamber \
        --prefix LD_LIBRARY_PATH : ${pkgs.lib.getLib pkgs.fuse}/lib \
        --add-flags "--no-sandbox"
    '';
  };

  desktopItem = pkgs.makeDesktopItem {
    name = "openchamber";
    desktopName = "OpenChamber";
    comment = "Desktop and web interface for OpenCode AI agent";
    icon = "openchamber";
    exec = "${openchamber}/bin/openchamber %u";
    categories = ["Development"];
  };

  icon = pkgs.stdenv.mkDerivation {
    name = "openchamber-icon";
    buildCommand = ''
      mkdir -p $out/share/icons/hicolor
      cp -r ${extracted}/usr/share/icons/hicolor/* $out/share/icons/hicolor/
    '';
  };
in {
  home.packages = [openchamber desktopItem icon];
}
