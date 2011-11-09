(* ::Package:: *)

{
  "Name" -> "SchwarzschildRNZ",
  "Description" -> "Schwarzschild spacetime in Riemann normal coordinates",
  "Dimensions" -> 4,
  "Coordinates" -> {t, r, z1, z2},
  "Parameters" -> {M},
  "Metric" -> {
    {-1 + 2 M/r, 0, 0, 0},
    {0, 1/(1 - 2 M/r), 0, 0},
    {0, 0, r^2 (1 - Sin[\[Beta][z1, z2]]^2 Sin[\[Alpha][z1, z2]]^2)/(1 - Sin[\[Alpha][z1, z2]]^2), r^2 (Cos[\[Beta][z1, z2]] Sin[\[Beta][z1, z2]] Sin[\[Alpha][z1, z2]]^2)/(1 - Sin[\[Alpha][z1, z2]]^2)},
    {0, 0, r^2 (Cos[\[Beta][z1, z2]] Sin[\[Beta][z1, z2]] Sin[\[Alpha][z1, z2]]^2)/(1 - Sin[\[Alpha][z1, z2]]^2), r^2 (1 - Cos[\[Beta][z1, z2]]^2 Sin[\[Alpha][z1, z2]]^2)/(1 - Sin[\[Alpha][z1, z2]]^2)}},
  "SignDet" -> -1,
  "Shorthands" -> {\[Alpha][z1,z2] -> ArcSin[Sqrt[z1^2+z2^2]],
                   \[Beta][z1,z2] -> ArcTan[z2/z1]}
}
