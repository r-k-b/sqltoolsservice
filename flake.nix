{
  description = "phdsysnet";

  inputs = { flake-utils.url = "github:numtide/flake-utils"; };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          system = system;
          config = { allowUnfree = true; };
        };
        inherit (pkgs) lib callPackage;
      in { devShell = import ./shell.nix { inherit pkgs; }; });
}
