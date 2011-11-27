(* ::Package:: *)

(* The Vaidya spacetimes are parametrized by a mass function m(v)
   that can be chosen freely. Here, we implement
      m(v) = M (1 + Tanh[v dM / M]^2)
   This can be changed by modifying the shorthand below.
 *)

Module[{rx, thetax, phix, v, u, theta, phi, vu, rv, gv, CX, J, gx},
  (* r in terms of Cartesian coordinates *)
  rx = Sqrt[x^2+y^2+z^2];
  thetax = ArcCos[z / rx];
  phix = ArcTan[y / x];

  (* Vaidya coordinates *)
  vu = {t+rx, rx, thetax, phix};
  rv = u; (* r in terms of Vaidya coordinates *)

  (* Vaidya metric, in Vaidya coordinates, as function of Vaidya coordinates *)
  gv = {{ -(1-2 m[t,x,y,z]/rv), 1, 0, 0}, {1, 0, 0, 0},
        {0, 0, rv^2, 0}, {0, 0, 0, rv^2 Sin[theta]^2}};

  (* Coordinate transformation, Vaidya -> Cartesian*)
  CX = {v->vu[[1]], u->vu[[2]], theta->vu[[3]], phi->vu[[4]]};

  (* Vaidya metric, in Vaidya coordinates, as function of Cartesian
     coordinates *)
  gv = Simplify[gv /. CX];

  (* Coordinate transformation, Vaidya -> Cartesian *)
  J = Simplify[Table[D[vu, X], {X, {t, x, y, z}}]];

  (* Convert metric to Cartesian coordinates *)
  gx = Simplify[J.gv.Transpose[J]] /. {(rx^2)^n_ :> r[x,y,z]^(2n)};

  {
    "Name" -> "Vaidya",
    "Description" -> "A Vaidya spacetime with mass function m(v) = M (1 + Tanh[v dM / M]^2)",
    "Dimensions" -> 4,
    "Coordinates" -> {t, x, y, z},
    "Parameters" -> {M, dM},
    "Metric" -> gx,
    "SignDet" -> -1,
    "Shorthands" -> {r[x,y,z] -> Sqrt[x^2+y^2+z^2],
                     m[t,x,y,z] -> M (1 + Tanh[v dM / M]^2)} /. CX
  }
]
