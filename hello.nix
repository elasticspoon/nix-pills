let
  pkgs = import <nixpkgs> { };
in
derivation {
  name = "hello";
  builder = "${pkgs.bash}/bin/bash";
  args = [ ./autotools-builder.sh ];
  buildInputs = with pkgs; [ gcc gnutar gnumake coreutils gawk gzip gnugrep gnused binutils.bintools ];
  system = builtins.currentSystem;
  src = ./hello-2.12.1.tar.gz;

  # Not sure why i can't use the following
  # hello_url = "https://ftp.gnu.org/gnu/hello/hello-2.12.1.tar.gz";
  # src = "./hello-2.12.1.tar.gz";
}
