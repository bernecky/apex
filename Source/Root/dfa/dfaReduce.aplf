 r←dfaReduce y;ast;wl;i;j;k;m;b;la;ra;n;c;p;pa;nast;op;shpf;shpc;opfn;cellrank
 ⍝# Handles monadic reductions with primitive operand only
 ast←D y[ssaast]
 wl←D y[ssacv]
 i←wl∧ast[;astfn]∊(E,'/'),E,'⌿'
 j←ast[;astlop]∊NULL     ⍝ Replicate
 i←i∧~j                  ⍝ Reduce vs replicate
 i←i∧ast[;astlarg]∊NULL  ⍝ Monadic reductions only
 ⍝⍝ ??? i←i∧~(D ast[;astPred])[;astPredKnowValue]
 wl←wl∧~i                ⍝ Update worklist
 :If 1∊i ⍝ Any work?
     op←i/⍳⍴i
     ra←D ast[op;astrarg]   ⍝ Right arguments
     la←D ast[op;astlarg]   ⍝ Left arguments
     la←(la≠D NULL)/la      ⍝ Ignore nulls
  ⍝ Drive reduce argument info into :PA entries
     pa←ast FindPA(E astlop),E i/⍳⍴i ⍝ Find PA entries for the adverbs
     nast←ast
     nast[,pa;asttype]←2/ast[ra;asttype]
  ⍝ FIXME: Could fill in astxrho,etc. if astshape known
  ⍝ Result frame rank is 0⌈argumentrank-1
     b←~ast[ra;astrank]∊NULL ⍝ Don't set stuff we don't know
     b←b∧(i/ast[;astlarg])∊NULL ⍝ Window reduce kludge
  ⍝ The following does too much work. b/ should be moved
  ⍝ to be ast[b/k;astrank], but that gives wrong rank on empty!
  ⍝ It also misses non-scalar operand fns. FIXME
     n←b/0⌈¨¯1+¨ast[ra;astrank] ⍝ Scalar operands only!!
     nast[b⌿pa;astrank]←2/⍪n
     nast[(i\b)/⍳⍴i;astrank]←n
  ⍝ Result frame shape depends on reduce axis
     m←1 ¯1[(D ast[op;astfn])∨.=,'/'] ⍝ First vs last axis.
     c←~ast[ra;astshape]∊NULL ⍝ Don't set stuff we don't know
     shpf←c/m↓¨ast[ra;astshape] ⍝ Frame shape
  ⍝ FIXME: Cell shape depends on monadic vs dyadic reduce, etc.
  ⍝⍝⍝⍝⍝nast[i\c)/⍳⍴i;astshape]←...
  ⍝ Result rank is cell result rank
     opfn←D ast[op;astlop] ⍝ The f operand dfa entry
     c←(~ast[ra;astrank]∊NULL)∧~ast[opfn;astrank]∊NULL
     n←ast[c/opfn;astrank]
     nast[(i\c)/⍳⍴i;astrank]←n
  ⍝ Result predicates are all killed
     nast[i/⍳⍴i;astPred]←E astPredLen⍴0
  ⍝ Now, propagate reduce operand info back into reduction
     nast[op;asttype]←ast[opfn;asttype]
     i[op,pa,opfn]←1 ⍝ PA entries may have changed
     j←astmerge(E ast),(E i⌿nast),E i
     ast←D j[0] ⋄ wl←wl∨D j[1]
 :EndIf
 r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
