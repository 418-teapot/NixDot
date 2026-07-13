{
  description = "NixDot";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";

    nixpkgs-unstable.url = "nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neodot = {
      url = "github:418-teapot/NeoDot";
      flake = false;
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    neodot,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    linuxPkgsUnstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

    darwinSystem = "aarch64-darwin";
    darwinPkgs = import nixpkgs {
      system = darwinSystem;
      config.allowUnfree = true;
    };
  in {
    formatter.${system} = pkgs.writeShellScriptBin "formatter" ''
      exec ${pkgs.alejandra}/bin/alejandra --exclude ./_sources "$@"
    '';

    apps = let
      mkHomeManagerApp = system: {
        type = "app";
        program = "${home-manager.packages.${system}.home-manager}/bin/home-manager";
      };
    in {
      ${system} = {
        home-manager = mkHomeManagerApp system;
        default = mkHomeManagerApp system;
      };
      ${darwinSystem} = {
        home-manager = mkHomeManagerApp darwinSystem;
        default = mkHomeManagerApp darwinSystem;
      };
    };

    homeConfigurations = {
      cambricon-pod = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/cambricon-pod.nix
        ];
        extraSpecialArgs = {
          inherit inputs;
        };
      };

      cambricon-dev = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/cambricon-dev.nix
        ];
        extraSpecialArgs = {
          inherit inputs;
        };
      };

      cambricon-desktop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/cambricon-desktop.nix
        ];
        extraSpecialArgs = {
          inherit inputs;
          pkgsUnstable = linuxPkgsUnstable;
        };
      };

      mac-mini = home-manager.lib.homeManagerConfiguration {
        pkgs = darwinPkgs;
        modules = [
          ./home/mac-mini.nix
        ];
        extraSpecialArgs = {
          inherit inputs;
        };
      };
    };
  };
}
