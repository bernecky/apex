 ss←{⎕ML←1                           ⍝ Approx alternative to xutils' ss.
     srce find repl←,¨⍵              ⍝ source, find and replace vectors.
     mask←find⍷srce                  ⍝ mask of matching strings.        
     prem←(⍴find)↑1                  ⍝ leading pre-mask.                
     cvex←(prem,mask)⊂find,srce      ⍝ partitioned at find points.      
     (⍴repl)↓∊{repl,(⍴find)↓⍵}¨cvex  ⍝ collected with replacements.     
     ⍝ Taken from dfns.dws
 }   
