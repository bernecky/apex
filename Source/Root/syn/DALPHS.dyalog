 Z←DALPHS
 ⍝Returns a 2- or 3-by-26 matrix of the alphabets available on this system
 ⍝ The rows are:
 ⍝      [1;] primary case (usually uppercase, but lower on Sharp APL)
 ⍝      [2;] secondary case (usually lowercase or uppercase-underscored,
 ⍝           but uppercase on Sharp APL)
 ⍝      [3;] third case (if this system has one)
 ⍝
 →('DYALOG'∨.≠6↑DAPLVER)/L1⍝ If Dyalog,
 Z←⎕AV[65 17 97∘.+⍳26]     ⍝    uppercase, lowercase, underscored
 →0
L1:→('IPSA'∨.≠4↑DAPLVER)/L2⍝ If Sharp,
 →(⎕AV[⎕IO+189]='≡')/L2    ⍝    jump if on SAX--just two alphabets
 Z←⎕AV[86 113 166∘.+⍳26]   ⍝    three alphabets on MF and PC
 →0
L2:Z←2 26⍴'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
 Z←('IPSA'∧.=4↑DAPLVER)⊖Z  ⍝ reverse upper/lower on Sharp APL/SAX
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
