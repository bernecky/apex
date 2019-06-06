 r←dfaLfn y;ast;wl;i;j;k;m;nn;di;cv
 ⍝ Handle local fns, e.g., f←fi&(+.×)
 ast←D y[ssaast]
 wl←D y[ssacv]
 ⍝ Ignore holes and primitives
 j←ast[;astfn]
 i←(isnum j)∧~j∊NULL ⍝ non-primitive fns
 di←astclassGFN,astclassDFN,astclassMFN,astclassNFN
 i←i\~ast[D i/j;astclass]∊di ⍝ No global or primitive fns
 wl←wl∧~i ⍝ Update worklist
 :If 1∊i ⍝ Any work?
     ∘
  ⍝ DO the predicate thing, too
     di←dfainit ast
  ⍝ We handle one local fn at a time.
lp:  →(0=∨/i)⍴lz ⍝ Done
  ⍝ We now operate on the invocations of the lfns.
  ⍝ That is, we assume somebody built a fake dfa that
  ⍝ has our invocation as a line in the ast.
     m←<\i ⍝ Next, please
     i←i∧~m ⍝ Mark this one done.
     n←m LFNast ast ⍝ Fake local fn ast
     ∘
     nn←dfa(E n),E st
  ⍝ Propagate morphology to the inlined
  ⍝ lfn & its invocation
  ⍝ 1995-03-25. Propagate all changed stuff,
  ⍝ but don't tinker new nulls.
     j←(∨/~D nn[;astchar]≡¨ast[;astchar])∧~nn[;astfn]∊NULL
     →(0=∨/j)⍴lp ⍝ No work.
     k←m ⋄ k[D(j⌿nn)[;asttag]]←1 ⍝ Mark invocation
     j←astmerge(E ast),(E(m+j)⌿nn),E k
     ast←D j[0] ⋄ wl←wl∨D j[1]
     →lp
 :EndIf
lz:r←y ⋄ r[ssaast]←E ast ⋄ r[ssacv]←E wl
