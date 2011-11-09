(* ::Package:: *)

{
  "Name" -> "SchwarzschildRP",
  "Description" -> "Schwarzschild spacetime in rational polynomial coordinates",
  "Dimensions" -> 4,
  "Coordinates" -> {t, r, \[Chi], \[Phi]},
  "Parameters" -> {M},
  "Metric" -> {
    {-1 + 2 M/r, 0, 0, 0},
    {0, 1/(1 - 2 M/r), 0, 0},
    {0, 0, r^2 / (1 - \[Chi]^2), 0},
    {0, 0, 0, r^2 (1 - \[Chi]^2)}},
  "SignDet" -> -1
}
