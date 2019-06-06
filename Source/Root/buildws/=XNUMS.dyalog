 Z←⍙XNUMS A
 ⍝Extracts numbers from character vector ⍵, similar to ⍎
 ⍝ Sets ⍙ERR to an error message if invalid numbers, else sets it to ''
 ⍝
 Z←⍳0
 →(A∧.=' ')/L3        ⍝ return empty if arg is blank
 ⍙ERR←'contains complex numbers'
 →(∨/'Jj'∊A)/0        ⍝ no complex numbers on this APL
 A←0 ⍙EJCASE A        ⍝ convert E/J in numbers to primary alphabet
 ⍙ERR←'contains invalid numbers'
 →(0∊⎕VI A)/0         ⍝ quit if any numbers are bad
 Z←⎕FI A              ⍝ the numbers
L3:⍙ERR←''            ⍝ indicate success
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
