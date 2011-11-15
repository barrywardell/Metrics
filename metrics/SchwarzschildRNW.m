(* ::Package:: *)

{
  "Name" -> "SchwarzschildRNW",
  "Description" -> "Schwarzschild spacetime in Riemann normal coordinates",
  "Dimensions" -> 4,
  "Coordinates" -> {t, r, w1, w2},
  "Parameters" -> {M},
  "Metric" -> {
    {-1 + 2 M/r, 0, 0, 0},
    {0, 1/(1 - 2 M/r), 0, 0},
    {0, 0, r^2 (Cos[\[Beta][w1, w2]]^2 / Cos[\[Alpha][w1, w2]/2]^2 + Sin[\[Beta][w1, w2]]^2 Cos[\[Alpha][w1, w2]/2]^2), r^2 Cos[\[Beta][w1, w2]] Sin[\[Beta][w1, w2]] (1 / Cos[\[Alpha][w1, w2]/2]^2 - Cos[\[Alpha][w1, w2]/2]^2)},
    {0, 0, r^2 Cos[\[Beta][w1, w2]] Sin[\[Beta][w1, w2]] (1 / Cos[\[Alpha][w1, w2]/2]^2 - Cos[\[Alpha][w1, w2]/2]^2), r^2 (Sin[\[Beta][w1, w2]]^2 / Cos[\[Alpha][w1, w2]/2]^2 + Cos[\[Beta][w1, w2]]^2 Cos[\[Alpha][w1, w2]/2]^2)}},
  "SignDet" -> -1,
  "Shorthands" -> {\[Alpha][w1,w2] -> 2 ArcSin[Sqrt[w1^2-w2^2]/2],
                   \[Beta][w1,w2] -> ArcTan[w2/w1]}
}
