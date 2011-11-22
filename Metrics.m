(* ::Package:: *)

BeginPackage["Metrics`"];

GetMetric::usage   = "GetMetric[m] gets the metric m.";
MetricProperty::usage   = "MetricProperty[m, p] gets the property p of the metric m.";
ListMetrics::usage = "ListMetrics[] lists all available metrics.";
MetricInfo::usage  = "MetricInfo[m] gives information on the metric m.";
$MetricPath::usage = "$MetricPath is a variable specifying the path to search for metrics.";

Begin["`Private`"];

$MetricPath = {FileNameDrop[FindFile["Metrics`"],-2]<>"/metrics"};

GetMetric[m_String] := Module[{fileName},
  (* Append ".m" to the file name if necessary *)
  If[StringTake[m,-2]!=".m",
    fileName=m<>".m";,
    fileName=m;
  ];

  Get[fileName, Path -> $MetricPath]
];

MetricProperty[m_String, p_String] := Module[{metric},
  metric = GetMetric[m];
  ((p /. metric) /. p -> None)
]

ListMetrics[] := Module[{files, metrics},
  files = FileNames["*.m", $MetricPath];
  metrics = Map[Get, files];
  {"Name", "Description"} /. metrics
];

MetricInfo[m_String] := Module[{metric, name, desc, coords, params, met, signdet},
  metric = Get[m<>".m", Path -> $MetricPath];
  {name, desc, coords, params, met, signdet} = 
    {"Name", "Description", "Coordinates", "Parameters", "Metric", "SignDet"} /. metric;
  TableForm[{{"Name: ", name}, {"Description: ", desc}, {"Coordinates: ", StandardForm[coords]},
    {"Parameters: ", StandardForm[params]}, {"Metric: ", MatrixForm[met]}, {"SignDet: ", signdet}}]
];

End[];
EndPackage[];
