{
  description = "NixDot";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
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
      cambricon = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/cambricon.nix
        ];
      };
    };
  };
}
