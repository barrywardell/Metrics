(* ::Package:: *)

Module[{Delta, Sigma},
  Delta = r^2 + a^2 - 2 M r;
  Sigma = r^2 + a^2 Cos[\[Theta]]^2;

  {
    "Name" -> "Kerr",
    "Description" -> "Kerr spacetime in Boyer-Lindquist coordinates",
    "Coordinates" -> {t, r, \[Theta], \[Phi]},
    "Parameters" -> {M, a},
    "Metric" -> {{-(1 - 2 M r/Sigma), 0, 0, -2 a M r Sin[\[Theta]]^2/Sigma},
                 {0, Sigma/Delta, 0, 0},
                 {0, 0, Sigma, 0},
                 {-2 a M r Sin[\[Theta]]^2/Sigma, 0, 0, (Delta + (2 M r (r^2 + a^2))/Sigma) Sin[\[Theta]]^2}},
    "SignDet" -> -1
  }
]
