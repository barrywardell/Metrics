(* ::Package:: *)

{
  "Name" -> "ReissnerNordstrom",
  "Description" -> "Reissner-Nordstrom spacetime",
  "Dimensions" -> 4,
  "Coordinates" -> {t, r, \[Theta], \[Phi]},
  "Parameters" -> {M, Q},
  "Metric" -> {{-1 + 2 M / r - Q^2 / r^2, 0, 0, 0},
               {0, 1/(1 - 2 M / r + Q^2 / r^2), 0, 0},
               {0, 0, r^2, 0},
               {0, 0, 0, r^2 Sin[\[Theta]]^2}},
  "SignDet" -> -1
}
