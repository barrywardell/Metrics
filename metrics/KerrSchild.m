(* ::Package:: *)

Module[{r, lu, h, \[Eta]},
  r = Sqrt[x^2+y^2+z^2];
  lu={1,(r x+a y)/(r^2+a^2),(r y-a x)/(r^2+a^2),z/r};
  h=(M r)/(r^2+a^2 z^2/r^2)//Simplify;

  \[Eta]={{-1,0,0,0},{0,1,0,0},{0,0,1,0},{0,0,0,1}};

  {
    "Name" -> "KerrSchild",
    "Description" -> "Kerr spacetime in Kerr-Schild coordinates",
    "Dimensions" -> 4,
    "Coordinates" -> {t, x, y, z},
    "Parameters" -> {M, a},
    "Metric" -> \[Eta] + 2 h Outer[Times,lu, lu],
    "SignDet" -> -1
  }
]
