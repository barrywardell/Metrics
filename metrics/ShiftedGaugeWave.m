(* ::Package:: *)

(* This is Minkowsi spacetime in Shifted Gauge Wave coordinates.
   Expressions were taken from

      Babiuc et al., Class.Quant.Grav. 25 (2008) 125012
      (e-Print: arXiv:0709.3559 [gr-qc])

   The expressions come from the appendix of the CQG version -
   equation numbers given below. *)

Module[{H, k, eta},
  H = amp Sin[2 Pi(x-t)/period]; (* Eq. A.6 *)
  k = Table[-D[t-x,v], {v,{t,x,y,z}}]; (* Eq. A.16 *)
  eta = DiagonalMatrix[{-1,1,1,1}];

  {
    "Name" -> "ShiftedGaugeWave",
    "Description" -> "4D flat spacetime in Cartesian shifted gauge wave coordinates",
    "Dimensions" -> 4,
    "Coordinates" -> {t, x, y, z}, 
    "Metric" -> eta + H Outer[Times, k,k], (* Eq. A.15 *)
    "SignDet" -> -1,
    "Parameters" -> {amp, period}
  }
]
