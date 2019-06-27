﻿ r←SetPredicates astr;val;⎕CT;q
⍝ Set predicates for known value in astr
 ⎕CT←0 ⍝ All predicates are exact
 r←astPredLen⍴0
 :If ~astr[astvalue]∊NULL
     val←D astr[astvalue]
     :If (Types[D astr[asttype]])∊'bid'
         val←⍎val
     :EndIf
     r[astPredKnowValue]←1
     :If ''''∊D astr[asttarget] ⍝ Quoted strings only
         r[astPredNoDups]←(⍴,val)=⍴nub,val ⍝ No duplicates
     :EndIf
 ⍝
 ⍝ The following only apply to numeric data
     :If 'c'≠type val
         r[astPredAll2]←∧/,val=2
         r[astPredPV]←∧/(⍳⍴val)∊val ⍝ Permutation vector
         r[astPredPV]←∧/val∊⍳⍴val   ⍝ Permutation vector subset
         :If ∨/1=⍴val
             r[astPredSortedUp]←val≡val[⍋val]
             r[astPredSortedDown]←val≡val[⍒val]
         :EndIf
         r[astPredNonNeg]←∧/val≥0
         r[astPredInteger]←∧/val=⌊val
         r[astPredKnowMaxVal]←1 ⍝  Maximum value known
         r[astPredKnowMinVal]←1 ⍝ Minimum value known
     :EndIf
 :EndIf