(* ::Package:: *)

BeginPackage["LoadMetric`", {"Metrics`", "xAct`xCoba`", "xAct`xTensor`", "xAct`xCore`"}];
LoadMetric::usage = "LoadMetric[m] loads the metric m for use in xCoba.";
UnloadMetric::usage = "UnloadMetric[] unloads the currently loaded metric.";
$CurrentMetric::usage = "CurrentMetric gives the currently loaded metric.";

Begin["`Private`"];

If[!ValueQ[$CurrentMetric], $CurrentMetric = None];

defParam[param_] := 
If[SameQ[Head[param], Rule],
  DefConstantSymbol[param[[1]], PrintAs -> param[[2]]];
,
  DefConstantSymbol[param];
];
    
(* Load a metric from a file *)
LoadMetric[metricName_String]:=
  Module[{metricSpec, name, manifold, coords, coordTensors, parameters,
    dim, metric, cd, basis, signdet, ainds, vbundle, metricComps},
  If[!SameQ[$CurrentMetric, None],
    Throw[$CurrentMetric<>" already in use as a metric. Unload it first."]];

  metricSpec = GetMetric[metricName];

  name = "Name" /. metricSpec;

  manifold = SymbolJoin[name,"M"];

  coords       = "Coordinates" /. metricSpec;
  coordTensors = #[]&/@ coords;
  parameters   = ("Parameters" /. metricSpec) /. "Parameters" -> {};
  dim          = Length[coordTensors];
  metric       = Symbol["g"]; (*SymbolJoin[name, "Metric"];*)
  cd           = Symbol["CD"];(*SymbolJoin[name,"CD"];*)
  basis        = Symbol[name];
  signdet      = "SignDet" /. metricSpec;
  ainds        = Complement[IndexRange["a", "z"], Join[parameters, coords, {Symbol["g"]}]];
  metricComps  = "Metric" /. metricSpec;

  DefManifold[manifold, dim, ainds];
  DefMetric[signdet, metric[-ainds[[1]],-ainds[[2]]], cd];

  (* Define coordinates *)
  vbundle = VBundleOfMetric[metric];
  DefTensor[#,vbundle]& /@ coordTensors;

  (* Define parameters *)
  defParam /@ parameters;

  (* Define coordinate chart *)
  DefChart[Symbol[name], manifold, Range[1, dim], coordTensors];

  (* Set metric components *)
  MetricInBasis[metric, -basis, metricComps /. Thread[coords -> coordTensors]];

  $CurrentMetric = name;
]

UnloadMetric[] :=
  Module[{metricName, metricSpec, name, manifold, metric, coords, parameters},
  If[SameQ[$CurrentMetric, None],
    Throw["No metric currently loaded."]];
  metricName = $CurrentMetric;
  metricSpec = GetMetric[metricName];

  name       = "Name" /. metricSpec;
  manifold   = SymbolJoin[name,"M"];
  metric     = Symbol["g"];(*SymbolJoin[name, "Metric"];*)
  coords     = "Coordinates" /. metricSpec;
  parameters = ("Parameters" /. metricSpec) /. "Parameters" -> {};

  UndefChart[Symbol[name]];
  UndefConstantSymbol /@ parameters;
  UndefTensor /@ coords;
  UndefMetric[metric];
  UndefManifold[manifold];

  $CurrentMetric = None;
];

End[];
EndPackage[];
