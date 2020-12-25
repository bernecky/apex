 Z←⍙ASCII
 ⍝Returns all 128 ASCII characters, with ⎕ for nonprinting chars
 ⍝ If a character occurs twice in ⎕AV, this fn returns the version
 ⍝   that maps to the ASCII character when written by TFWRITE or
 ⍝   read by TFREAD.
 ⍝
 Z←128⍴'⎕'
 Z[32+⍳33]←' !"#$%&''()*+,-./0123456789:;<=>?@'
 Z[65+⍳26]←'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
 Z[97+⍳26]←'abcdefghijklmnopqrstuvwxyz'
 Z[91+⍳6]←'[\]∧_‘'
 Z[123+⍳4]←'{|}~'
 →('DYALOG'∨.≠6↑⍙APLVER)/L1            ⍝ On Dyalog,
 Z[⎕IO+39 94 124]←⎕AV[⎕IO+219 235 238] ⍝    use ASCII quote/caret/stile
 →0
 ⍝ Use ASCII split-stile on APL*PLUS and Sharp APL:
L1:→(~('APLPLUS'∧.=7↑⍙APLVER)∨'IPSA'∧.=4↑⍙APLVER)/0
 Z[⎕IO+124]←'|'
 ⍝ APLASCII.APLPLUS3 version 1.4 (1995.10.15)
