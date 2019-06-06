 rinp←rinp Strplc a;b;c;d;⎕IO                                                                              
 ⍝ general replace of one string by another in <rinp>.                                                     
 ⍝ the right argument <a> is a two-element nested array specifying the old                                 
 ⍝ string followed by the new string.                                                                      
 ⍝ origin 1 dependent.                                                                                     
 ⎕IO←1                                                                                                     
 ⍝ globals:  F - ss; V - rinp.    /lhg  8nov76, 1may84                                                     
 b←,D a[2] ⋄ a←,D a[1] ⋄ c←rinp ss a ⍝ find all matches                                                    
l0:d←1,≤\(⍴a)≤(1↓c)-¯1↓c ⋄ →(∧/d)⍴l1 ⋄ c←d/c ⋄ →l0 ⍝ remove overlapping occurrences, one at a time         
l1:→(⍴c)↓0 ⋄ →(1 0≤d←(⍴b)-⍴a)/l2,l3 ⍝ →l2 if expand required ⋄ →l3 if strings conformable                  
 a←(⍴rinp)⍴0 ⋄ a[c]←1 ⋄ rinp←(=\a=(-⍴a)↑d↓a)/rinp ⍝ set up mask and perform compress                       
 c←c+0,d×⍳¯1+⍴c ⋄ →l3 ⍝ adjust hit pointers                                                                
l2:a←((d×⍴c)+⍴rinp)⍴0 ⋄ a[c←c+0,d×⍳¯1+⍴c]←1 ⋄ rinp←(=\a=(-⍴a)↑(-d)↓a)\rinp ⍝ set up mask and perform expand
l3:a←⍴b ⋄ rinp[c∘.+¯1+⍳a]←((⍴c),a)⍴b ⍝ insert new text into <rinp>                                         
 ⍝ (lhg/∆rplc.1 from the sharp apl utility library) 
