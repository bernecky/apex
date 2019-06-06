﻿ r←AppendRE asts;ast;i
 ⍝# Append fake ast row to capture explicit result
 ⍝# Ugly, but no better idea just now.
 r←asts
 ast←D asts[ssaast]
 :If ~ast[dfnres;asttarget]≡E,'-' ⍝ If there is an explicit result
  ⍝ We tag a fake r←r line to the end
  ⍝ of the ast, so that we can find the result of the
  ⍝ fn after SSA.
  ⍝ Add new row, decorate it nicely.
     i←1↑⍴ast
     ast←ast⍪astNewRows 1
     ast[i;astclass]←astclassVARB
     ast[i;astfn]←E':RE' ⍝ Make an assign r←r
     ast[i;asttarget,astrarg]←E 1 ⍝ 1=canonical result
     r[ssaast]←E ast
     r[ssacv]←E(1↑⍴ast)⍴1
 :EndIf
