(* ::Package:: *)

Module[{r, lu, h, \[Eta]},
  rho = Sqrt[x^2+y^2+z^2];;
  lu={1,(r[x,y,z] x+a y)/(r[x,y,z]^2+a^2),(r[x,y,z] y-a x)/(r[x,y,z]^2+a^2),z/r[x,y,z]};
  h=(M r[x,y,z])/(r[x,y,z]^2+a^2 z^2/r[x,y,z]^2)//Simplify;

  \[Eta]={{-1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1}};

  {
    "Name" -> "KerrSchild",
    "Description" -> "Kerr spacetime in Kerr-Schild coordinates",
    "Dimensions" -> 4,
    "Coordinates" -> {t, x, y, z},
    "Parameters" -> {M, a},
    "Metric" -> \[Eta] + 2 h Outer[Times,lu, lu],
    "SignDet" -> -1,
    "Shorthands" -> {r[x,y,z] -> Sqrt[(rho^2-a^2+Sqrt[(rho^2-a^2)^2+4 a^2 z^2])/2]}
  }
]
