let
  pkgs = import <nixpkgs> { };
in
pkgs.stdenv.mkDerivation {
  inherit (pkgs) coreutils gcc;
  name = "simple";
  system = builtins.currentSystem;
  src = ./simple.c;
  builder = "${pkgs.bash}/bin/bash";
  args = [ ./simple-builder.sh ];
}
