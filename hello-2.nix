let
  pkgs = import <nixpkgs> { };
  mkDerivation = import ./autotools.nix pkgs;
in
mkDerivation {
  name = "hello";
  src = ./hello-2.12.1.tar.gz;
}
# let
#   pkgs = import <nixpkgs> { };
# in
# import ./autotools.nix pkgs {
#   name = "hello";
#   src = ./hello-2.12.1.tar.gz;
# }
