﻿ r←BuildCallingTree asts;fns;al;af;cts;ct;caller;callee
 ⍝ Extract calling tree from asts
 ⍝ Result is caller set, and adjacency matrix of #calls,
 ⍝ with one caller per row, and callees in columns
 ct←ICallFns¨asts
 cts←1⊃¨ct           ⍝ #calls
 ct←0⊃¨ct           ⍝ Callers and callees
 af←nub D Raze ct    ⍝ All fns in the compilation unit
 caller←D Raze 1↑¨ct ⍝ Callers
 callee←1↓¨ct        ⍝ Callees
 'Incomplete compilation unit'assert∧/af∊caller  ⍝ User missed fns
 al←D(E caller)∊¨callee  ⍝ Adjacency list calling tree
 al←(⍴al)⍴(,al)\,D Raze cts ⍝ Number of calls
 r←(E caller),E al
