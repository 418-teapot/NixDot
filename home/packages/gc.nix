{
  config,
  pkgs,
  ...
}: {
  systemd.user.timers.nix-gc = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnCalendar = "Sun *-*-* 03:00:00";
      Persistent = true;
      Unit = "nix-gc.service";
    };
  };

  systemd.user.services.nix-gc = {
    Unit = {
      Description = "Nix store garbage collection and home-manager generation expiration";
    };
    Service = {
      Type = "oneshot";
      Environment = ["PATH=/run/wrappers/bin:/nix/var/nix/profiles/default/bin:/root/.nix-profile/bin"];
      ExecStart = pkgs.writeShellScript "nix-gc.sh" ''
        home-manager expire-generations '+14 days'
        nix-collect-garbage --delete-older-than 14d
      '';
    };
  };
}