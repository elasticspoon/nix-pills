rec {
  makeOverridable = f: origArgs:
    let
      origResult = f origArgs;
      override = {
        override = newArgs:
          makeOverridable f (origArgs // newArgs);
      };
    in
    origResult // override;
}
