(* ::Package:: *)

Module[
 {rad, Mmatch, psi4},
  (* For r>M/2, we want the mass function to be M, for r<M/2 it is a function of radius *)
  rad    = Min[r[x,y,z], M/2];
  Mmatch = 4 rad - 8 (rad^2/2 + (Cos[4 Pi rad/M] - 1) (M/(4 Pi))^2)/M;

  psi4   = (1 + Mmatch/(2 r[x,y,z]))^4;
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
