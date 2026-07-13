{
  config,
  pkgs,
  ...
}: {
  programs.nushell = {
    enable = true;
    extraConfig = ''
      def load-dotenv [file: string = ".env"] {
          open $file | lines
          | where not ($it | str starts-with "#")
          | where $it != ""
          | parse -r '(?P<key>[^=]+)=(?P<value>.+)'
          | transpose -r -d
          | load-env
      }
    '';
  };
}
