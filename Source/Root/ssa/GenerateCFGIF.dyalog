﻿ r←GenerateCFGIF y;st;ast;cv;bb;i;f;ef;mf;d;cfg;elf;j;ifbb;elsebb;rngif
 ⍝ Generate control flow graph for ast :If :Else :EndIf
 ast←D y[ssaast]
 cv←D y[ssacv]
 bb←D y[ssabb] ⍝ Basic Block list
 cfg←D y[ssacfg] ⍝ Partially built CFG
 ⍝ We start by finding :If/:Else/:EndIf blocks.
 f←ast[;astfn]∊E':If'
 :If 1∊f ⍝ Any :If statements?
     elf←ast[;astfn]∊E':Else'
     ef←ast[;astfn]∊E':EndIf'
  ⍝ We ASSUME these are nested properly.
  ⍝ :If/:EndIf mark sets inner to outer.
     mf←+\f+ef\¯1 ⍝ Same as matching parens
     j←(ef/mf)proindexof ¯1+f/mf
     ifbb←f/¯1++\bb ⍝ bb# of :If
     elsebb←¯1+elf/+\bb ⍝ bb of associated :Else
     elsebb←mcb elsebb[j]⍝ Sort to match :If
     rngif←(mcb f/⍳⍴f),mcb ef/⍳⍴f ⍝ Range of :If/:EndIf
  ⍝
  ⍝ Path from :If to after :EndIf IF no associated :Else
     d←ef/+\bb ⍝ bb# after associated :EndIf
     d←mcb d[j] ⍝ Sort to match :If
     cfg←cfg mset(mcb ifbb),d∘∘∘⍝ ONLY SOMETIMES!
  ⍝
  ⍝ Path from :If to :Else
     cfg←cfg mset(mcb ifbb),elsebb
  ⍝
  ⍝ Mark path from :Else to :EndIf
     cfg←cfg mset elsebb,d∘∘∘
 :EndIf
 r←y ⋄ r[ssacfg]←E cfg
