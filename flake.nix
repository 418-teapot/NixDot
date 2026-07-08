{
  description = "NixDot";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    formatter.${system} = pkgs.alejandra;

    homeConfigurations = {
      cambricon-pod = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/cambricon-pod.nix
        ];
      };

      cambricon-dev = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/cambricon-dev.nix
        ];
      };

      cambricon-desktop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/cambricon-desktop.nix
        ];
      };
    };
  };
}
