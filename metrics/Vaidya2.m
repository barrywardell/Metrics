(* ::Package:: *)

(* This metric is called "Vaidya2" because there exists already a
   thorn AEIDevelopment/Vaidya, so we have to choose a different name.
   Temporarily. *)

Module[{rx, thetax, phix, vu, rv, m, gv, CX, J, gx},
  (* r in terms of Cartesian coordinates *)
  rx = Sqrt[x^2+y^2+z^2];
  thetax = ArcCos[z / rx];
  phix = ArcTan[y / x];
  (* Vaidya coordinates *)
  vu = {t+rx, rx, thetax, phix};
  rv = u; (* r in terms of Vaidya coordinates *)
  (* Mass function m(v) *)
  (* m = 0; *) (* Minkowski *)
  (* m = M; *) (* Schwarzschild *)
  (* m = M + dM v; *) (* Simple Vaidya *)
   m = M (1 + Tanh[v dM / M]^2); (* More complex Vaidya *)
  (* Vaidya metric, in Vaidya coordinates, as function of Vaidya coordinates *)
  gv = {{ -(1-2m/(rv+eps)), 1, 0, 0}, {1, 0, 0, 0},
        {0, 0, rv^2, 0}, {0, 0, 0, rv^2 Sin[theta]^2}};
  (* Coordinate transformation *)
  CX = {v->vu[[1]], u->vu[[2]], theta->vu[[3]], phi->vu[[4]]};
  (* Vaidya metric, in Vaidya coordinates, as function of Cartesian
     coordinates *)
  gv = Simplify[gv /. CX];
  (* Coordinate transformation *)
  J = Simplify[Table[D[vu, X], {X, {t, x, y, z}}]];
  (* Convert metric to Cartesian coordinates *)
  (* TODO: check order of indices and loops *)
  gx = Simplify[Table[Sum[J[[X1]][[V1]] J[[X2]][[V2]] gv[[V1]][[V2]],
                          {V1, 1, 4}, {V2, 1, 4}],
                      {X1, 1, 4}, {X2, 1, 4}]];

  {
    "Name" -> "Vaidya",
    "Description" -> "A Vaidya spacetime",
    "Dimensions" -> 4,
    "Coordinates" -> {t, x, y, z},
    "Parameters" -> {M, dM, eps},
    "Metric" -> gx,
    "SignDet" -> -1,
    "Shorthands" -> {},
    "SimplifyHints" -> {}
  }
]
