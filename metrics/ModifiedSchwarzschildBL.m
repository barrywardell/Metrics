(* ::Package:: *)

Module[
 {Mmatch, psi4},
  Mmatch = 4 r[x,y,z] - 8 (r[x,y,z]^2/2 + (Cos[4 Pi r[x,y,z]/M] - 1) (M/(4 Pi))^2)/M;
  psi4 = (1 + Mmatch/(2 r[x,y,z]))^4;

  {
    "Name" -> "ModifiedSchwarzschildBL",
    "Description" -> "Modified Schwarzschild spacetime in Brill-Lindquist coordinates with "<>
                     "a radially dependent mass inside the black hole",
    "Dimensions" -> 4,
    "Coordinates" -> {t, x, y, z},
    "Parameters" -> {M, epsilon},
    "Metric" -> {{-1, 0, 0, 0},
                 {0, psi4, 0, 0},
                 {0, 0, psi4, 0},
                 {0, 0, 0, psi4}},
    "SignDet" -> -1,
    "Shorthands" -> {r[x,y,z] -> Sqrt[x^2+y^2+z^2]}
  }
]
