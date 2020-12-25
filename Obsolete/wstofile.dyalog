 wstofile y;i;j;k;CR
 ⍝ Put functions in this workspace onto file y.
 ⍝We use 1⎕fd form, almost, so we can build ⎕cr matrix at read time.
 i←1 ⎕WS 1
 i←(i∨.≠(¯1↑⍴i)↑'wstofile')⌿i
lp:j←8↑i[⎕IO;]
 j←(j≠' ')/j
 k←,(⎕CR i[⎕IO;]),CR←⎕AV[156+⎕IO]
 k ⎕hfwrite  y,j,'.fun'
 →(~0∊⍴i←1 0↓i)⍴lp
