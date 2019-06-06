﻿ r←sis InsertSysvarHeader b;qdecl;qcall;fin;gin;fgin;fout;gout;fgout
⍝# Gen extra args for sysvars used by fns.
⍝ This supports conjunctions, adverbs, and primitives.
⍝ b is list of substitutions
 fin←D b[0]
 gin←D b[1]
 fgin←D b[2]
 fout←D b[3]
 gout←D b[4]
 fgout←D b[5]
 qdecl←(E''),(E',double QUADct'),(E',int QUADio'),(E'int QUADpp')
 qdecl←qdecl,(E',int QUADpw'),E',int QUADrl'
 qcall←(E''),(E', QUADct'),(E', QUADio'),E', QUADpp'
 qcall←qcall,(E', QUADpw'),E', QUADrl'
⍝ Handle function headers
 r←(E'$SYSVARFDECL')Strepl¨ER1(⍪sis),Raze⍉qdecl[fin]
 r←(E'$SYSVARGDECL')Strepl¨ER1(⍪r),Raze⍉qdecl[gin]
 r←(E'$SYSVARFGDECL')Strepl¨ER1(⍪r),Raze⍉qdecl[fgin]
⍝ Handle function kernels
 r←(E'$SYSVARFKER')Strepl¨ER1(⍪r),Raze⍉qcall[fin]
 r←(E'$SYSVARGKER')Strepl¨ER1(⍪r),Raze⍉qcall[gin]
 r←(E'$SYSVARFGKER')Strepl¨ER1(⍪r),Raze⍉qcall[fgin]
⍝ Handle QUADrl out
 r←(E'$SYSVARFOUT')Strepl¨ER1(⍪r),Raze⍉qcall[fout]
 r←(E'$SYSVARGOUT')Strepl¨ER1(⍪r),Raze⍉qcall[gout]
 r←(E'$SYSVARFGOUT')Strepl¨ER1(⍪r),Raze⍉qcall[fgout]
