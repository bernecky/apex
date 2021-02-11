 Checkem asts;ast;cv;i;b;d;p
⍝ This performs various paranoia checks that make
⍝ fault isolation faster, supposedly, while also making
⍝ you want to buy a faster cpu.
 :If 1  ⍝⍝⍝∨debugphase≡'yes'
     ast←D asts[ssaast]
     ⍝⍝⍝ confused c←ast[;astvalue]∊NULL
     d←D(D ast[;astPred])[;astPredKnowValue]
⍝ 'dontknownothin'.assert ~∨/d∧c
     'xrho not integral'assert∧/ast[;astxrho]=⌊ast[;astxrho]
 ⍝ Mismatch between predicate and non-Null value?
     cv←~ast[;astvalue]∊NULL
     p←ast[;astPred]
⍝⍝⍝ DEAD I HOPE    'Predicate mismatch'assert∧/i←(D cv/p)[;astPredKnowValue]
     'Predicate length error'assert(p∊NULL)∨astPredLen∧.=,D⍴¨p
     b←ast[;astrank]∊E NULL
     'Rank invalid'assert∧/(0=,D⍴¨⍴¨ast[;astrank])∧b∨,D ast[;astrank]≥0
     'Type invalid'assert∧/(,D ast[;asttype])∊NULL,⍳⍴#.globals.Types
     i←ast[;astvalue]
     i←0⍴¨(~i∊NULL)/i ⍝ Non-nulls must be character
     'Non-nulls not character'assert∧/' '=D 1↑¨i
     'ast type not scalar'assert 1=⍴⍴D ast[;asttype]
     'ast rank not scalar'assert 1=⍴⍴D ast[;astrank]
 ⍝ Parameters must be legal
     i←ast[;astparms]
     'Invalid astparms'assert(i∊NULL)∨(i<1↑⍴ast)∧(i≥0)
 ⍝ (Some) pointers must be legal
     i←ast[;astlarg,astrarg] ⍝ This should be astptrs, but one at a time...
     'Invalid astlarg or astrarg'assert∧/,i∊NULL,⍳≢ast
     t←dfainit ast
     cv←t/ast[;asttarget]
     cv←∧/(cv∊NULL)∨(cv∊⍳+/~t)∨cv∊t/⍳⍴t
     'Target value is not index into locals'assert cv
     t←(~t)/ast[;asttarget]
     'Duplicate local vars in ast'assert∧/((⍳⍴t)=t⍳t)∨(t∊NULL)∨t∊E' -'
 :EndIf
