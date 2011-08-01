(* ::Package:: *)

{
  "Name" -> "SphericallySymmetric",
  "Description" -> "General spherically symmetric static spacetime",
  "Dimensions" -> 4,
  "Coordinates" -> {t, r, \[Theta], \[Phi]}, 
  "Metric" -> {{-f[r], 0, 0, 0},
               {0, h[r], 0, 0},
               {0, 0, r^2, 0},
               {0, 0, 0, r^2 Sin[\[Theta]]^2}},
  "SignDet" -> -1
}
