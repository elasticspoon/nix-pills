pkgs: attrs:
let
  defaultAttrs = {
    builder = "${pkgs.bash}/bin/bash";
    args = [ ./autotools-builder.sh ];
    baseInputs = with pkgs; [ findutils patchelf gcc gnutar gnumake coreutils gawk gzip gnugrep gnused binutils.bintools ];
    buildInputs = [ ];
    system = builtins.currentSystem;
  };
in
derivation (defaultAttrs // attrs)
