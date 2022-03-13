{ pkgs ? import <nixpkgs> { } }:
let
  dotnetCombined = with pkgs.dotnetCorePackages;
    combinePackages [ sdk_3_1 pkgs.dotnet-sdk ];

in pkgs.mkShell {
  name = "phdsysnet";

  buildInputs = with pkgs; [ dotnetPackages.Nuget dotnetCombined mono6 ];

  shellHook = ''
    echo Dependencies present.
  '';
}
