{
  description = "NixDot";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixgl = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nixgl,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [nixgl.overlay];
    };
  in {
    formatter.${system} = pkgs.alejandra;

    homeConfigurations = {
      cambricon = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/cambricon.nix
        ];
      };

      headless = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/headless.nix
        ];
      };

      linux = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/linux.nix
        ];
      };
    };
  };
}
