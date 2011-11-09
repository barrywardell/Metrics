(* ::Package:: *)

{
  "Name" -> "SchwarzschildRN",
  "Description" -> "Schwarzschild spacetime in Riemann normal coordinates",
  "Dimensions" -> 4,
  "Coordinates" -> {t, r, y1, y2},
  "Parameters" -> {M},
  "Metric" -> {{-1 + 2 M / r, 0, 0, 0},
               {0, 1/(1 - 2 M / r), 0, 0},
               {0, 0, r^2 (1+Sin[\[Beta][y1, y2]]^2(Sin[\[Alpha][y1,y2]]^2/\[Alpha][y1,y2]^2-1)), r^2 Cos[\[Beta][y1,y2]] Sin[\[Beta][y1,y2]](1-Sin[\[Alpha][y1,y2]]^2/\[Alpha][y1,y2]^2)},
               {0, 0, r^2 Cos[\[Beta][y1,y2]] Sin[\[Beta][y1,y2]](1-Sin[\[Alpha][y1,y2]]^2/\[Alpha][y1,y2]^2), r^2 (1+Cos[\[Beta][y1,y2]]^2(Sin[\[Alpha][y1,y2]]^2/\[Alpha][y1,y2]^2-1))}},
  "SignDet" -> -1,
  "Shorthands" -> {\[Alpha][y1,y2] -> Sqrt[y1^2+y2^2],
                   \[Beta][y1,y2] -> ArcTan[y2/y1]}
}
