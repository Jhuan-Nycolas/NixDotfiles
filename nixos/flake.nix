{
  description = "System's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs, ... } @inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      OpenBox = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [ ./hosts/openbox/configuration.nix ];
      };

      Plasma = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [ ./hosts/plasma/configuration.nix ];
      };

      I3wm = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [ ./hosts/i3wm/configuration.nix ];
      };

      Qtile = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [ ./hosts/qtile/configuration.nix ];
      };

      default = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [ ./hosts/plasma/configuration.nix ];
      };
    };
  };
}
