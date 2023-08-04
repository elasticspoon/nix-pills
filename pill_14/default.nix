let
  nixpkgs = import <nixpkgs> { };
  allPkgs = nixpkgs // pkgs;

  # what is I was missing was that the assignement to the variable
  # went like: makeOverridable = { makeoverridable = lamdafunction }
  # so i needed to call it as makeOverridable.makeoverridable
  lib = import ./lib.nix;

  # makeOverridable = f: origArgs:
  #   let
  #     origResult = f origArgs;
  #     overrideSet = {
  #       override = newArgs:
  #         makeOverridable f (origArgs // newArgs);
  #     };
  #   in
  #   origResult // overrideSet;

  callPackageDefault = path: overrides:
    let
      function = import path;
      usedNixPkgs = builtins.intersectAttrs (builtins.functionArgs function) allPkgs;
      result = function (usedNixPkgs // overrides);
    in
    result;

  callPackage = path: lib.makeOverridable (callPackageDefault path);

  pkgs = with nixpkgs; rec {
    mkDerivation = import ./autotools.nix nixpkgs;
    hello = callPackage ./hello.nix { };
    graphviz = callPackage ./graphviz.nix { };
    graphvizCore = graphviz.override { gdSupport = false; };
    graphvizCore2 = graphvizCore.override { gdSupport = false; };
  };
in
pkgs
