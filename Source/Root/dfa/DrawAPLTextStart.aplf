 DrawAPLTextStart qcr;k
 ⍝ Set up APL Text window
 :If visualizedfa≡'yes'
     ulc←0 0 ⍝ Upper-left corner
     k←⎕EX'F'              ⍝ Erase any old window
     'F'⎕WC'Form' 'RichEdit'(ulc)
     'F.txt'⎕WC'RichEdit'
     F.txt.Posn←0 0
     scrnsize←'.'⎕WG'Size' ⍝ Screen size in pixels
     size←2×F.GetTextSize(E qcr),E'Dyalog Std TT'
     F.Caption←qcr[0;]
     F.Size←size
 :EndIf
