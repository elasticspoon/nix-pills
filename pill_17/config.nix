{
  packageOverrides = pkgs: {
    graphviz = pkgs.graphviz.override {
      withXorg = false;
    };
  };
}
