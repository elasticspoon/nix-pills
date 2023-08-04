let
  pkgs = import <nixpkgs> { };
  mkDerivation = import ./autotools.nix pkgs;
in
with pkgs;
mkDerivation {
  hello = import ./hello.nix {
    inherit mkDerivation;
  };
  graphvizCore = import ./graphviz.nix {
    inherit mkDerivation lib;
    gdSupport = false;
  };
  graphviz = import ./graphviz.nix {
    inherit mkDerivation lib gd pkg-config;

    # if you need to use a different version of gd, you can do something like this:
    # inherit mkDerivation lib pkg-config;
    # gd = { pkgs.gd-special-version };
  };
}
