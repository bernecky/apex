 snxl;astr;m;i
 ⍝ Indexed ref: expn or id left of index list:   (2+⍳3)[⍵] or  t[0]
 astr←,astNewRows 1 ⍝ Now build index itself
 astr[astfn]←E,'[' ⍝ Mark as indexed ref
 m←stkpop 3                  ⍝ For x[i], pop x, i and ]
 astr[astlarg]←m[0;Stkvalue] ⍝ tos is indexee
 astr[asttarget]←E ≢ast
 astr[astrarg]←m[1;Stkvalue] ⍝ 2nd stack el is index list
 astr[astclass]←astclassVARB
 ast←ast append2Ast astr
 ⍝ New state is state when we hit the ].
 i←((E ¯1+≢ast),(E clsexpn),E 0)Push m[2;Stkstate]
 Rescan clsexpn
