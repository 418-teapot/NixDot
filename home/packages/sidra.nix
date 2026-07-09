{
  config,
  pkgs,
  ...
}: let
  sources = pkgs.callPackage ../../_sources/generated.nix {};
  s = sources.sidra;

  extracted = pkgs.appimageTools.extractType2 {
    pname = s.pname;
    version = s.version;
    inherit (s) src;
  };

  sidra = pkgs.stdenv.mkDerivation {
    name = "sidra-${s.version}";
    nativeBuildInputs = [pkgs.makeWrapper];
    buildCommand = ''
      mkdir -p $out/bin
      cp ${s.src} $out/bin/sidra.AppImage
      chmod +x $out/bin/sidra.AppImage
      makeWrapper $out/bin/sidra.AppImage $out/bin/sidra \
        --prefix LD_LIBRARY_PATH : ${pkgs.lib.getLib pkgs.fuse}/lib \
        --add-flags "--no-sandbox"
    '';
  };

  desktopItem = pkgs.makeDesktopItem {
    name = "sidra";
    desktopName = "Sidra";
    comment = "An elegant Apple Music desktop client for Linux";
    icon = "sidra";
    exec = "sidra %U";
    categories = ["AudioVideo" "Music"];
  };

  icon = pkgs.stdenv.mkDerivation {
    name = "sidra-icon";
    buildCommand = ''
      mkdir -p $out/share/icons/hicolor
      cp -r ${extracted}/usr/share/icons/hicolor/* $out/share/icons/hicolor/
    '';
  };
in {
  home.packages = [sidra desktopItem icon];
}
