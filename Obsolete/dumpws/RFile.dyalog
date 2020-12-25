 Chars←RFile name;nid;signature;nums
⍝ Read ANSI or Unicode character file (Windows)
 nid←name ⎕NTIE 0
 signature←3↑⎕NREAD nid 83 3 0
 :If signature≡¯17 ¯69 ¯65 ⍝ UTF-8
     nums←⎕NREAD nid 83(¯2+⎕NSIZE nid)3
     Chars←'UTF-8'⎕UCS{⍵+256×⍵<0}nums ⍝ Signed ints
 :ElseIf (2↑signature)≡¯1 ¯2 ⍝ Unicode (UTF-16)
     Chars←⎕NREAD nid 160(¯1+⎕NSIZE nid)2
 :Else ⍝ ANSI
     Chars←⎕NREAD nid 80(⎕NSIZE nid)0
 :EndIf
 ⎕NUNTIE nid
