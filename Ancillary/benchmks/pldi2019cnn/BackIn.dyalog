BackIn←{
(d_out W in)←⍵ 
 Z←{cell←(⍴in)↑(-⍵+⍴d_out)↑(⍵⌷W)×d_out ⋄ cell}⍤99 1⊢⊃⍳⍴W
 ⍝⍝Z2←{cell←(⍴in)↑(-⍵+⍴d_out)↑(⍵⌷W)×d_out ⋄
 ⍝⍝    cell}¨⍳⍴W
 +⌿((×/(-⍴⍴W)↓⍴Z),(⍴⍴W)↓⍴Z)⍴Z
 ⍝⍝Z3←⊃+⌿,Z2
 ⍝⍝xx←1÷Z≡Z3
}

