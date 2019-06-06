 r←dfaScan y;ast;wl;i;j;k;astr;cv;tar;b;tarp
 ⍝ Handles all scans
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧(ast[;astfn]∊(E,'\'),E,'⍀')∧~ast[;astfn]∊NULL
 i←i∧~ast[;astlop]∊NULL ⍝ Ignore expand
 wl←wl∧~i ⍝ Update worklist
 i←i∧~(D ast[;astPred])[;astPredKnowValue]
 :If 1∊i
     tar←i/⍳⍴i ⍝ The scans of interest
     astr←ast[,tar∘.+0 1 2 3;] ⍝ Scan, :PA, :PA, operand invocation
  ⍝ The 3 ast rows after the scan invocation are:
  ⍝ :PA for the operand invocation, and the operand invocation itself.
  ⍝ If we know the result characteristics of the operand,
  ⍝ use them to deduce our characteristics.
  ⍝
  ⍝ First, fill :PA entries with argument info.
     k←D ast[tar;astrarg] ⍝ Right arguments
     tarp←((1↑⍴astr)⍴0 1 1 0)/⍳1↑⍴astr  ⍝:PA entries
     astr[tarp;astchar,astclass]←ast[2/k;astchar,astclass]
     b←~ast[k;astrank]∊NULL   ⍝ Result rank needs known arg rank
     astr[(2/b)/tarp;astrank]←0⌈ast[2/b/k;astrank]-1
     astr[tarp;astPred]←E astPredLen⍴0 ⍝ Kill preds for now.
     astr[tarp;astshape,astxrho]←NULL ⍝ Don't know these any more (LATER)
  ⍝ Phase 2: reconstruct the scan itself.
     b←(¯3⌽i)/ast[;astrank] ⍝ If result rank known, set scan result rank
     cv←~b∊NULL
     astr[4×cv/⍳⍴cv;astrank]←1+cv/b ⍝ Scan laminates results
     astr[4×⍳⍴cv;asttype]←(¯3⌽i)⌿ast[;asttype] ⍝ Scan result type
  ⍝ We lose most predicates and all shape info today. FIXME
     astr[;astPred]←E astPredLen⍴0 ⍝ Kill all preds for the nonce.
     k←∨⌿(-⍳4)⌽(4,⍴i)⍴i
     j←astmerge(E ast),(E astr),E k
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
