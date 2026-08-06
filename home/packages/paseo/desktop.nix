{
  config,
  pkgs,
  ...
}: let
  sources = pkgs.callPackage ../../../_sources/generated.nix {};
  s = sources.paseo;

  extracted = pkgs.appimageTools.extractType2 {
    pname = s.pname;
    version = s.version;
    inherit (s) src;
  };

  paseo = pkgs.stdenv.mkDerivation {
    name = "paseo-${s.version}";
    nativeBuildInputs = [pkgs.makeWrapper];
    buildCommand = ''
      mkdir -p $out/bin
      cp ${s.src} $out/bin/paseo.AppImage
      chmod +x $out/bin/paseo.AppImage
      makeWrapper $out/bin/paseo.AppImage $out/bin/paseo \
        --prefix LD_LIBRARY_PATH : ${pkgs.lib.getLib pkgs.fuse}/lib \
        --add-flags "--no-sandbox"
    '';
  };

  desktopItem = pkgs.makeDesktopItem {
    name = "paseo";
    desktopName = "Paseo";
    comment = "Orchestrate multiple AI coding agents from one interface";
    icon = "paseo";
    exec = "${paseo}/bin/paseo %u";
    categories = ["Development"];
  };

  icon = pkgs.stdenv.mkDerivation {
    name = "paseo-icon";
    nativeBuildInputs = [pkgs.imagemagick];
    buildCommand = ''
      src_icon=""
      for cand in ${extracted}/paseo.png ${extracted}/usr/share/icons/hicolor/*/apps/paseo.png ${extracted}/*.png; do
        if [ -f "$cand" ]; then
          src_icon="$cand"
          break
        fi
      done
      if [ -z "$src_icon" ]; then
        echo "ERR: paseo icon not found in extracted AppImage"
        find ${extracted} \( -iname "*.png" -o -iname "*.svg" \) | head
        exit 1
      fi
      for size in 16 24 32 48 64 128 256 512; do
        mkdir -p $out/share/icons/hicolor/''${size}x''${size}/apps
        magick -background none "$src_icon" -resize ''${size}x''${size} $out/share/icons/hicolor/''${size}x''${size}/apps/paseo.png
      done
    '';
  };
in {
  home.packages = [paseo desktopItem icon];
}
