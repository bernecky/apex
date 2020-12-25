 Z←⍙FNNAME H;I;P
 ⍝Extracts function or operator name from header line ⍵
 ⍝ The argument is the header line, without any leading [0] or ∇
 →(~P←'('∊H)/L1         ⍝ If it's an operator [e.g., Z←(F OP) B],
 H←(¯1+H⍳')')↑H
 H←(H⍳'(')↓H            ⍝    get the stuff between the parens
 →L2                    ⍝ Else, it's a function,
L1:H←(('←'∊H)×H⍳'←')↓H
 H←(¯1+H⍳';')↑H         ⍝    get the stuff between ← and ;
L2:H[(H='}')/⍳⍴H]←' '   ⍝ change {A}FOO B to {A FOO B
 H←⍙VTOM' ',H
 H←(H∨.≠' ')⌿H          ⍝ matrix of names in H
 I←(1 1 2,[0.5]1 2 2)[1+P;''⍴⍴H] ⍝ row containing the fn/op name
 Z←(Z≠' ')/Z←H[I;]
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
