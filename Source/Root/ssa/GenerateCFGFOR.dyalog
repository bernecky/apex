﻿ r←GenerateCFGFOR y;st;ast;cv;bb;i;f;ef;mf;d;cfg;elf
 ⍝ Generate control flow graph for ast :For loop
 ast←D y[ssaast]
 cv←D y[ssacv]
 bb←D y[ssabb] ⍝ Basic Block list
 cfg←D y[ssacfg] ⍝ Current cfg
 ⍝ We start by matching :For/:EndFor blocks.
 f←ast[;astfn]∊E':For'
 ef←ast[;astfn]∊E':EndFor'
 ⍝ We ASSUME these are nested properly. Hence,
 ⍝ we have an even number of them, and they
 ⍝ match from outside to in.
 ⍝ The CFG is a square matrix with 1↑⍴ast rows
 ⍝ Control flows from row to column. E.g.,
 ⍝ a 1 in cfg[i;j] indicates flow from bb i
 ⍝ to bb j.
 ⍝ Now add edges to correspond to
 ⍝ :For/:EndFor nodes.
 ⍝ Add edge from the :For to the node after
 ⍝ the :EndFor.
 ⍝ First, match :For w/respective :EndFor
 mf←+\f+ef\¯1 ⍝ Like matching parentheses...
 mf←(ef/mf)proindexof ¯1+f/mf
 i←f/¯1++\bb ⍝ bb# of :For
 d←ef/+\bb ⍝ bb# after associated :EndFor
 d←d[mf] ⍝ Sort to match :For
 cfg←cfg mset(⍪i),⍪ d ⍝ No scatter indexing
 ⍝ Add edge from :EndFor to associated :For
 cfg←cfg mset(⍪d-1),⍪i
 ⍝ Remove :EndFor to next bb edge
 cfg←cfg mclear(⍪d-1),⍪d
 r←y ⋄ r[ssacfg]←E cfg
