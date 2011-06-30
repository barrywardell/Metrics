(* ::Package:: *)

{
  "Name" -> "GaugeWave",
  "Description" -> "4D flat spacetime in Cartesian gauge wave coordinates",
  "Dimensions" -> 4,
  "Coordinates" -> {t, x, y, z}, 
  "Metric" -> {{-1 + amp Sin[2 \[Pi] (x-t) / period], 0, 0, 0},
               {0, 1 - amp Sin[2 \[Pi] (x-t) / period], 0, 0},
               {0, 0, 1, 0},
               {0, 0, 0, 1}},
  "SignDet" -> -1,
  "Parameters" -> {amp, period}
}
