{
  config,
  pkgs,
  ...
}: let
  sources = pkgs.callPackage ../../_sources/generated.nix {};
  s = sources.obsidian;

  extracted = pkgs.appimageTools.extractType2 {
    pname = s.pname;
    version = s.version;
    inherit (s) src;
  };

  obsidian = pkgs.stdenv.mkDerivation {
    name = "obsidian-${s.version}";
    nativeBuildInputs = [pkgs.makeWrapper];
    buildCommand = ''
      mkdir -p $out/bin
      cp ${s.src} $out/bin/obsidian.AppImage
      chmod +x $out/bin/obsidian.AppImage
      makeWrapper $out/bin/obsidian.AppImage $out/bin/obsidian \
        --prefix LD_LIBRARY_PATH : ${pkgs.lib.getLib pkgs.fuse}/lib \
        --add-flags "--no-sandbox"
    '';
  };

  desktopItem = pkgs.makeDesktopItem {
    name = "obsidian";
    desktopName = "Obsidian";
    comment = "Knowledge base that works on top of a local folder of plain text Markdown files";
    icon = "obsidian";
    exec = "${obsidian}/bin/obsidian %u";
    categories = ["Office"];
    mimeTypes = ["x-scheme-handler/obsidian"];
  };

  icon = pkgs.stdenv.mkDerivation {
    name = "obsidian-icon";
    nativeBuildInputs = [pkgs.imagemagick];
    buildCommand = ''
      src_icon=""
      for cand in ${extracted}/obsidian.png ${extracted}/usr/share/icons/hicolor/*/apps/obsidian.png ${extracted}/*.png; do
        if [ -f "$cand" ]; then
          src_icon="$cand"
          break
        fi
      done
      if [ -z "$src_icon" ]; then
        echo "ERR: obsidian icon not found in extracted AppImage"
        find ${extracted} \( -iname "*.png" -o -iname "*.svg" \) | head
        exit 1
      fi
      for size in 16 24 32 48 64 128 256 512; do
        mkdir -p $out/share/icons/hicolor/''${size}x''${size}/apps
        magick -background none "$src_icon" -resize ''${size}x''${size} $out/share/icons/hicolor/''${size}x''${size}/apps/obsidian.png
      done
    '';
  };
in {
  home.packages = [obsidian desktopItem icon];
}
