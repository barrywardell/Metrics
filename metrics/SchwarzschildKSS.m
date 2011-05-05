(* ::Package:: *)

{
  "Name" -> "SchwarzschildKSS",
  "Description" -> "Schwarzschild spacetime in spherical Kerr-Schild coordinates",
  "Dim" -> 4,
  "Coordinates" -> {t, r, \[Theta], \[Phi]},
  "Parameters" -> {M},
  "Metric" -> {{-1+2M/r, 2M/r, 0, 0},
               {2M/r, 1+2M/r, 0, 0},
               {0, 0, r^2, 0},
               {0, 0, 0, r^2 Sin[\[Theta]]^2}},
  "SignDet" -> -1
}
