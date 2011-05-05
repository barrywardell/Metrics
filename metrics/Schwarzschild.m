(* ::Package:: *)

{
  "Name" -> "Schwarzschild",
  "Description" -> "Schwarzschild spacetime",
  "Dimensions" -> 4,
  "Coordinates" -> {t, r, \[Theta], \[Phi]},
  "Parameters" -> {M},
  "Metric" -> {{-1 + 2 M / r, 0, 0, 0},
               {0, 1/(1 - 2 M / r), 0, 0},
               {0, 0, r^2, 0},
               {0, 0, 0, r^2 Sin[\[Theta]]^2}},
  "SignDet" -> -1
}
