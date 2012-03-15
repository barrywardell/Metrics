(* ::Package:: *)

{
  "Name" -> "NariaiRN",
  "Description" -> "Nariai spacetime in Riemann normal coordinates",
  "Dimensions" -> 4,
  "Coordinates" -> {t, r, w1, w2},
  "Parameters" -> {M},
  "Metric" -> {
    {-1 + r^2, 0, 0, 0},
    {0, 1/(1 - r^2), 0, 0},
    {0, 0, (16 - w2^2 (8 - w1^2 - w2^2))/(4 (4 - w1^2 - w2^2)), w1 w2 (8 - w1^2 - w2^2)/(4(4-w1^2-w2^2))},
    {0, 0, w1 w2 (8 - w1^2 - w2^2)/(4(4-w1^2-w2^2)), (16 - w1^2 (8 - w1^2 - w2^2))/(4 (4 - w1^2 - w2^2))}},
  "SignDet" -> -1
}
