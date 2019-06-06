 r←p Pagein y;desc;z
⍝ Define function y from source file
 y←(y≠' ')/y ⍝ Ignore blanks
 ⍎(0=⎕NC'p')/'p←pathsource' ⍝ Default load point
 r←p LoadFn y
 desc←(r⍳CR)↑r
 z←⎕def  (1+⍴desc)↓r
 →(~z≡y)⍴0.1 ⍝ Ugh
 r←desc
