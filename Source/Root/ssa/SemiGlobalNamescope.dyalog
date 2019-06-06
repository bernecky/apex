 r←astn SemiGlobalNamescope ast;sgi;sgo;tar
⍝ Correct namescope in caller for semiglobals. 3 cases:
⍝ 1. Names not ref/set in this fn retain callee's namescope,
⍝    as they must be localized by one of our callers, e.g.,
⍝    foo, with local LCL, calls goo, which does not ref/set
⍝    LCL, which calls hoo, which sets/refs LCL as a semiglobal.
⍝    Since the name is global to hoo, it's also global to goo.
⍝    These names were added to our ast earlier.
⍝ 2. Our locals remain local (semiglobals stop here).
⍝    This was done by the syntax analyzer.
⍝ 3. Our semiglobals become astscopeSGI+astscopeSGO.
⍝    This is too general, but is fixed up after SSA.
⍝ The only real job performed by this fn is case (3).
⍝ ast is caller's ast.
⍝ astn is semiglobals of (one) callee.
 :If ~0∊⍴astn
     tar←ast[;asttarget]⍳astn[;asttarget]
 ⍝ Preserve any extant semi-globalness
     sgi←2 2⊤D ast[tar;astscope] ⍝ Can't add or OR these things
     sgo←sgi∨2 2⊤(astscopeL≠D ast[tar;astscope])×D astn[;astscope]
     ast[tar;astscope]←E¨2⊥sgo
 :EndIf
 r←ast
