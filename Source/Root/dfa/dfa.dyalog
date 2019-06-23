 r←dfa y;st;oldast;i;j;k;wp;ast;F;src
 ⍝ Perform data flow analysis for ast ⍵ (from buildast).
 ⍝ y is ssa form. cv is optional cv
 ⍝ Result is updated ssa form,
 ⍝ with ST info for each row.
 ⍝ class, type, rank, shape, value,name...
 ⍝ If the value is known, it is enclosed twice.
 ⍝ Otherwise, the contents is <'?'
 ⍝ Ignore symbol table entries
 src←D y[ssasrc]
 DrawAPLTextStart src
 wp←dfasee y
 :While 1∊D wp[ssacv]            ⍝ loop until fixpoint reached
     :if trace
       ⎕←'top of dfa loop, examining ',(⍕+/D wp[ssacv]),' items:'
       ⎕←(D wp[ssacv])⌿(D wp[ssaast])[;astfn]
     :endif
     wp←dfasee dfaMsf wp         ⍝ Monadic scalar functions.
     wp←dfasee dfaDsf wp         ⍝ Dyadic scalar functions.
     wp←dfasee dfaLev wp         ⍝ Lev
     wp←dfasee dfaDex wp         ⍝ Dex
     wp←dfasee dfaGrade wp       ⍝ Gradeup, gradedown
     wp←dfasee dfaSemicolon wp   ⍝ Propagate indexing info
     wp←dfasee dfaIndexRef wp    ⍝ Indexed reference
     wp←dfasee dfaIndexAssign wp ⍝ Indexedassign result rank, shape setting.
     wp←dfasee dfaMrho wp        ⍝ Shape
     wp←dfasee dfaAssign wp      ⍝ Assign to names
     wp←dfasee dfaRotr wp        ⍝ Rotate and reverse.
     wp←dfasee dfaReshape wp     ⍝ Reshape.
     wp←dfasee dfaTranspose wp   ⍝ Transpose.
     wp←dfasee dfaReduce wp      ⍝ Primitive reductions
     wp←dfasee dfaReduceDerived wp ⍝ Reductions w/derived operand
     wp←dfasee dfaScan wp        ⍝ All scans (f\y)
     wp←dfasee dfaExpand wp      ⍝ Expand (x\y)
     wp←dfasee dfaTake wp        ⍝ Take (x↑y)
     wp←dfasee dfaIp wp          ⍝ Inner product (x f.g y)
     wp←dfasee dfaDrop wp        ⍝ Drop (x↓y)
     wp←dfasee dfaOp wp          ⍝ Outer product (∘.f)
     wp←dfasee dfaEps wp         ⍝ Epsilon (x∊y)
     wp←dfasee dfaDiota wp       ⍝ Dyadic iota (⍳)
     wp←dfasee dfaMiota wp       ⍝ Monadic iota (⍳)
     wp←dfasee dfaCatenate wp    ⍝ Catenate (,)
     wp←dfasee dfaReplicate wp   ⍝ Replicate (x/y)
     wp←dfasee dfaMatch wp       ⍝ Match (≡)
     wp←dfasee dfaRank wp        ⍝ Rank
     wp←dfasee dfaCut wp         ⍝ Cut
     wp←dfasee dfaComposeArray wp ⍝ Compose w/value (f&2)
     wp←dfasee dfaCompose wp     ⍝ Compose
     wp←dfasee dfaRavel wp       ⍝ Ravel and table (⍪)
     wp←dfasee dfaSubFunctions wp ⍝ Global defined function
     wp←dfasee dfaLfn wp         ⍝ Local defined function
     wp←dfasee dfaPHI wp         ⍝ PHI functions from ssa
     wp←dfasee dfaFOR wp         ⍝ Dyalog :for/:endfor loop
     wp←dfasee dfaIF wp          ⍝ Dyalog :if/:else
     wp←dfasee dfaWHILE wp       ⍝ Dyalog :while/:endwhile
     wp←dfasee dfaQuadFI wp      ⍝ ⎕fi, ⎕vi
     wp←dfasee dfaQuadMAP wp     ⍝ ⎕map (Dyalog APL)
     wp←dfasee dfaSemiGlobals wp ⍝ Semiglobal (does nothing)
     wp←dfasee dfaEbar wp        ⍝ Epsilon bar (⍷)
     wp←dfasee dfaRepresent wp   ⍝ Representation (⊤)
     wp←dfasee dfaBase wp        ⍝ Base value (⊥)
     wp←dfasee dfaConstantProp wp ⍝ Constant propagation
     wp←dfasee dfaPA wp          ⍝ Operators argument parameters
     wp←dfasee dfaFrom wp        ⍝ J FROM function
     wp←dfasee dfaFromDyalog wp  ⍝ Dyalog APL index function
     wp←dfasee dfaPartialEvaluate wp ⍝ Partial evaluation
     wp←dfasee dfaQuery wp       ⍝ Roll and Deal
     wp←dfasee dfaMonadicThorn wp⍝ ⍕⍵
     wp←dfasee dfaDyadicThorn wp ⍝ ⍺⍕⍵
     wp←dfasee dfaQuoteQuadInput wp ⍝ ←⍞
     wp←dfasee dfaQuadts wp      ⍝ ⎕ts
     wp←dfasee dfaQuadAV wp   ⍝ Sigh. Quadav
     wp←dfasee dfaTally wp       ⍝ Tally (≢⍵)
 :EndWhile
 r←wp
