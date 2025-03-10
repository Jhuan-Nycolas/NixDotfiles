{
  description = "Home Manager configuration of tux";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."tux" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./hosts/plasma/home.nix ];
      };

      homeConfigurations."Plasma" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./hosts/plasma/home.nix ];
      };

      homeConfigurations."OpenBox" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./hosts/openbox/home.nix ];
      };

      homeConfigurations."I3wm" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./hosts/i3wm/home.nix ];
      };

      homeConfigurations."Qtile" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./hosts/qtile/home.nix ];
      };
    };
}
