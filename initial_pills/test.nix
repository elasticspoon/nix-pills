{ a
, b ? 3
, trueMsg ? "yes"
, falseMsg ? "no"
,
} @ args:
if a > b
then builtins.trace (builtins.trace args trueMsg) true
else builtins.trace falseMsg false
