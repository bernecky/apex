 r←GenerateCFG y;bb;cfg;i;j
 ⍝ Generate control flow graph for ast
 bb←D y[ssabb] ⍝ Basic Block list
 i←+/bb
 cfg←(2⍴i)⍴¯1⌽(1+i)↑1 ⍝ Start w/fall-through flow
 i←y ⋄ i[ssacfg]←E cfg
 j←GenerateCFGFOR i ⍝ Handle :For :EndFor
 r←GenerateCFGIF j ⍝ Handle :If :Else :EndIf
